import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user.tile.dart';
import 'package:flutter_crud/data/dummy_users.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16.0),
        color: Colors.white,
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index){
            return UserTile(users.values.elementAt(index));
          },
        ),
      ),
    );
  }
}