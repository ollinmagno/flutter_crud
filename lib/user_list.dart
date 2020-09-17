import 'package:flutter/material.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'components/user_tile.dart';
import 'models/user_model.dart';
import 'provider/users_dao.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersDAO usersDAO = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuários'),
        actions: <Widget>[
           IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.of(context).
            pushNamed(AppRoutes.USER_FORM, arguments: usersDAO),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        color: Colors.white,
        child: ListView.builder(
          itemCount: usersDAO.count,
          itemBuilder: (context, index) => UserTile(usersDAO.byIndex(index)),
        ),
      ),
    );
  }
}