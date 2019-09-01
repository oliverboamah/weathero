import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NoResult extends StatelessWidget {

  // props
  final String image;
  final String title;
  final String description;

  NoResult({this.image, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          this.image,
          width: 120,
          height: 120,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            this.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          width: 250,
          child: Text(this.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black38,
                fontSize: 16,
              )),
        )
      ],
    );
  }
}
