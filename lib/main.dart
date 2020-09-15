import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user_form.dart';
import 'package:provider/provider.dart';
import 'provider/users_dao.dart';
import 'routes/app_routes.dart';
import 'user_list.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UsersDAO(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter CRUD',
      theme: ThemeData(primaryColor: Colors.amber),
      routes: {
        AppRoutes.HOME: (_) => UserList(),
        AppRoutes.USER_FORM: (_) => UserForm(),
      },
    );
  }
}
