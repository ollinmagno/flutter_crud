import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user_model.dart';

class UsersDAO with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all => [..._items.values];

  int get count => _items.length;

  User byIndex(int i) => _items.values.elementAt(i);

  User removeByIndex(int i) => _items.remove(i);

  void change(User user) {
    if (user == null) {
      return;
    }
    if (user != null &&
        user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
          user.id,
          (_) => User(
              id: user.id,
              name: user.name,
              email: user.email,
              avatarUrl: user.avatarUrl));
    }
    notifyListeners();
  }

  void put(User user) {
    if (user == null) {
      return;
    }
    final String id = Random().nextDouble().toString();
    if (user != null && user.id != null && user.id.trim().isNotEmpty) {
      _items.putIfAbsent(
        id,
        () => User(
            id: id,
            name: user.name,
            email: user.email,
            avatarUrl: user.avatarUrl),
      );
    }

    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
    }
    notifyListeners();
  }
}
