import 'package:flutter/material.dart';

class Alert {

  static void show({BuildContext context, String title, String content}) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      }
    );
  }
}