import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {

  // props
  final String hintText;
  final Function onSearchIconPressed;

  SearchBar({this.hintText, this.onSearchIconPressed});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  // state
  String inputText = '';

  @override
  Widget build(BuildContext context) {
     return Padding(
        padding: EdgeInsets.only(top: 5, bottom: 16),
        child: Card(
            elevation: 4,
            child: TextField(
              onChanged: (text) {
                this.setState(() {
                  this.inputText = text.trim();
                });
              },
              decoration: InputDecoration(
                  hintText: this.widget.hintText,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      this.widget.onSearchIconPressed(this.inputText);
                    },
                    icon: Icon(Icons.search, color: Colors.black38),
                  ),
                  contentPadding: EdgeInsets.all(16)),
            )));
  }
}