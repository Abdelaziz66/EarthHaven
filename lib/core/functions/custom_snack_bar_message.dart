import 'package:flutter/material.dart';

showSnackBar({required context, required String message}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,

       behavior: SnackBarBehavior.fixed,
       duration: const Duration(seconds: 2),
        content: Text(
          message,
          style: const TextStyle(fontSize: 15
          ,color: Colors.white),

        ),
      ),
    );
