import 'package:flutter/material.dart';
import 'package:flutter_crud/user_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter CRUD',
      theme: ThemeData(primaryColor: Colors.amber),
      home: UserList(),
    );
  }
}