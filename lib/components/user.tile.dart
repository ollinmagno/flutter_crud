import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user_model.dart';
import 'package:flutter_crud/provider/users_dao.dart';
import 'package:flutter_crud/routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;
  final UsersDAO usersDAO;

  const UserTile(this.user, {this.usersDAO});
  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.amber,
              onPressed: () => Navigator.of(context)
                  .pushNamed(AppRoutes.USER_FORM, arguments: user),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
