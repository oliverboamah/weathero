import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class WeatherInfo extends StatelessWidget {

  // props
  final String imageAsset;
  final String title;
  final String description;
  final int degrees;
  final String day;

  WeatherInfo({this.imageAsset, this.title, this.description, this.degrees, this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        this._imageView(),
        this._weatherInfo(),
        this._lineDivider(),
        this._currentDay()
      ],
    );
  }

  // weather image widget
  Widget _imageView() {
    return Image.asset(
      this.imageAsset,
      width: 200,
      height: 200,
    );
  }

  // weather info widget
  Widget _weatherInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${this.degrees}\u00B0',
          style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
        ),
        Column(
          children: <Widget>[
            Container(
                width: 200,
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  this.title,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Container(
                width: 200,
                padding: EdgeInsets.only(left: 16, top: 4),
                child: Text(
                  this.description,
                  style: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.bold),
                ))
          ],
        )
      ],
    );
  }

  // line divider widget
  Widget _lineDivider() {
    return Divider(
      color: Colors.black38,
    );
  }

  // current day widget
  Widget _currentDay() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(this.day,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 24)),
      ),
    );
  }
}
