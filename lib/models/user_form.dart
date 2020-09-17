import 'package:flutter/material.dart';
import 'package:flutter_crud/provider/users_dao.dart';
import 'package:provider/provider.dart';

import 'user_model.dart';

class UserForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  final _nextFocus = FocusNode();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de usuário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final bool isValid = _validateForm();

              if (isValid) {
                _formKey.currentState.save();
                Provider.of<UsersDAO>(context, listen: false).put(
                  User(
                    id  : _formData['id'],
                    name: _formData['name'],
                    email: _formData['email'],
                    avatarUrl: _formData['avatarUrl']
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome",
                ),
                focusNode: _focusNode,
                onFieldSubmitted: (String text) {
                  if (_nextFocus != null) {
                    FocusScope.of(context).requestFocus(_nextFocus);
                  }
                },
                onSaved: (value) => _formData['nome'] = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }
                  if (value.length < 3) {
                    return 'Insira um nome maior';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                focusNode: _nextFocus,
                onSaved: (value) => _formData['email'] = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Foto"),
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    final bool _formOk = _formKey.currentState.validate();
    if (!_formOk) {
      return false;
    }
    return true;
  }
}
