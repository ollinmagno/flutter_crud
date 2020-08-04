import 'package:flutter/material.dart';

class Users {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  const Users ({
    this.id,
    @required this.name,
    @required this.email,
    @required this.avatarUrl
  });
}