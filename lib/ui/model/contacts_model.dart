import 'package:contact_app/data/contact.dart';
import 'package:faker/faker.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactModel extends Model {
  late List<Contact> _contacts = List.generate(
    50,
    (index) {
      return Contact(
        name: faker.person.firstName() + ' ' + faker.person.lastName(),
        email: faker.internet.freeEmail(),
        phoneNumber: faker.randomGenerator.integer(1000000).toString(),
      );
    },
  );
// get only property, makes sure that we cannot overwrite contact from different classes
  List<Contact> get contacts => _contacts;

  void changedFavoriteStatus(int index) {
    _contacts[index].isFavorite = !_contacts[index].isFavorite;
    _sortContacts();
    notifyListeners();
  }

  void _sortContacts() {
    return _contacts.sort((a, b) {
      int comparisonResult;
      // Primarily sorting based on whether or not the contact is favorited
      comparisonResult = _compareBasedOnFavoriteStatus(a, b);

      // If the favorite status of two is identical,
      // secondary, alphabetical sorting kicks in.
      if (comparisonResult == 0) {
        comparisonResult = _compareAlphabetically(a, b);
      }
      return comparisonResult;
    });
  }

  int _compareBasedOnFavoriteStatus(Contact a, Contact b) {
    if (a.isFavorite) {
      //contactOne will be BEFORE contactTwo
      return -1;
    } else if (b.isFavorite) {
      //contactOne will be AFTER contactTwo
      return 1;
    } else {
      return 0;
    }
  }

  int _compareAlphabetically(Contact a, Contact b) {
    return a.name.compareTo(b.name);
  }
}
