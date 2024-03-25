import 'package:contact_app/data/contact.dart';
import 'package:contact_app/ui/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key,
    required this.contactIndex,
  });

  final int contactIndex;

  @override
  Widget build(BuildContext context) {
    // If you don't need to rebuild the widget tree once the model's data changes
    // (when you only make changes to the model, like in this ContactCard),
    // you don't need to use ScopedModelDescendant with a builder, but only simply
    // call ScopedModel.of<T>() function
    final model = ScopedModel.of<ContactModel>(context);
    final displayedContact = model.contacts[contactIndex];

    return ListTile(
      title: Text(displayedContact.name),
      subtitle: Text(displayedContact.email),
      trailing: IconButton(
        icon: Icon(
          displayedContact.isFavorite ? Icons.star : Icons.star_border,
          color: displayedContact.isFavorite ? Colors.amber : Colors.grey,
        ),
        onPressed: () {
          model.changedFavoriteStatus(contactIndex);
        },
      ),
    );
  }
}
