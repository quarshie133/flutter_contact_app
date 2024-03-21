import 'package:contact_app/data/contact.dart';
import 'package:contact_app/ui/contact_list/widget/contact_tile.dart';
import 'package:contact_app/ui/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactListPage extends StatefulWidget {
  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
// Build function runs when the state chnages
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ScopedModelDescendant<ContactModel>(
        builder: (context, child, model) {
          return ListView.builder(
            itemCount: model.contacts.length,
            // Runs and build every single list item
            itemBuilder: (context, index) {
              return ContactTile(
                contactIndex: index,
              );
            },
          );
        },
      ),
    );
  }
}
