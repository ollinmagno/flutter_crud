import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/users.dart';
import 'user_list.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter CRUD',
        theme: ThemeData(primaryColor: Colors.amber),
        home: UserList(),
      ),
    );
  }
}