import 'package:flutter/material.dart';
import '../../controllers/api.dart';

class Helpers
{
  static input(text,con,obscure)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
      child: TextFormField(
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: text,
        ),
        obscureText: obscure,
        controller: con,
      ),
    );
  }
}