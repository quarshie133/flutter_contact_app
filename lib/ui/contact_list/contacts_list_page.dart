import 'package:contact_app/data/contact.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class ContactListPage extends StatefulWidget {
  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  late List<Contact> _contacts;

// Runs when the widget initialized
  @override
  void initState() {
    super.initState();

    _contacts = List.generate(
      50,
      (index) {
        return Contact(
          name: faker.person.firstName() + ' ' + faker.person.lastName(),
          email: faker.internet.freeEmail(),
          phoneNumber: faker.randomGenerator.integer(1000000).toString(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        // Runs and build every single list item
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_contacts[index].name),
            subtitle: Text(_contacts[index].email),
            trailing: IconButton(
              icon: Icon(
                _contacts[index].isFavorite ? Icons.star : Icons.star_border,
                color: _contacts[index].isFavorite ? Colors.amber : Colors.grey,
              ), onPressed: () { 
                _contacts[index].isFavorite = !_contacts[index].isFavorite;
               },
            ),
          );
        },
      ),
    );
  }
}
