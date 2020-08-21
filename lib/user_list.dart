import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/user.tile.dart';
import 'models/users.dart';
import 'provider/users.dart';


class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuários'),
        actions: <Widget>[
           IconButton(
            icon: Icon(Icons.add),
            onPressed: () => users.put(User(name: 'Ollin',
            email: 'ollin@uncisal.com', avatarUrl: '')),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        color: Colors.white,
        child: ListView.builder(
          itemCount: users.count,
          itemBuilder: (context, index) => UserTile(users.byIndex(index)),
        ),
      ),
    );
  }
}