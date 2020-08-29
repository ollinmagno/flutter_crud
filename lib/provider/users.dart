import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all => [..._items.values];

  int get count => _items.length;

  User byIndex(int i) => _items.values.elementAt(i);

  User removeByIndex(int i) => _items.remove(i);

  void put(User user) {
    
    if(user == null){
      return;
    }
    
    final String id = Random().nextDouble().toString();
    _items.putIfAbsent(id, () => User(
      id: id,
      name: user.name,
      email: user.email,
      avatarUrl: user.avatarUrl
    ));
    notifyListeners();
  }
  
}