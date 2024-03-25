import 'package:contact_app/data/contact.dart';
import 'package:contact_app/ui/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  // These field' values will be gotten from the form
  String? _name;
  String? _email;
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          TextFormField(
            onSaved: (value) => _name = value,
            validator: (value) {
              String? _validateName(String value) {
                if (value.isEmpty) {
                  return 'Enter a name';
                }
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            onSaved: (value) => _email = value,
            validator: (value) {
              String? _validateEmail(String value) {
                final emailRegex = RegExp(
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
                if (value.isEmpty) {
                  return 'Enter an email';
                } else if (!emailRegex.hasMatch(value)) {
                  return 'Enter a valid email address';
                }
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            onSaved: (value) => _phoneNumber = value,
            validator: (value) {
              String? validatePhoneNumber(String value) {
                final phoneRegex = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
                if (value.isEmpty) {
                  return 'Enter a phone number';
                } else if (!phoneRegex.hasMatch(value)) {
                  return 'Enter a valid phone number';
                }
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: _onSavedContactButonPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('SAVE CONTACT'),
                Icon(
                  Icons.person,
                  size: 18,
                )
              ],
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void _onSavedContactButonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newContact = Contact(
        name: _name!,
        email: _email!,
        phoneNumber: _phoneNumber!,
      );
      ScopedModel.of<ContactModel>(context).addContact(newContact);
      Navigator.of(context).pop();
    }
  }
}
