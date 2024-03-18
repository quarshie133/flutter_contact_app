import 'package:contact_app/ui/contact_list/contacts_list_page.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(const MyApp());
}
// colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ContactListPage(),
    );
  }
}
