import 'package:flutter/material.dart';
import 'package:weathero/components/noresult.dart';
import 'package:weathero/components/searchbar.dart';
import 'package:weathero/components/weatherinfo.dart';
import 'package:weathero/services/wrappers/weatherdata.dart';
import 'package:weathero/util/alert.dart';
import '../services/api/weather.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /// state
  
  // content list
  List<Widget> _contentList = [];

  // weather information
  String _city = 'London';
  int _degrees = 20;
  String _weatherImageAsset = 'assets/images/sunny.png' ;
  String _weatherTitle = 'Partly Cloudy';
  String _weatherDescription ='Slightly humid witha gentle breeze in london';
  String _day = 'Thursday';

  @override
  void initState() {
    super.initState();

    this._contentList.addAll(<Widget>[
      this._searchBar(),
      this._weatherInfo(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._city),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: _content(),
        ),
      ),
    );
  }

  // content widget
  Widget _content() {
    return Column(
      children: this._contentList,
    );
  }

  // search bar widget 
  Widget _searchBar() {
    return SearchBar(
      hintText: 'Enter City',
      onSearchIconPressed: (inputText) => this._searchWeatherInfo(inputText)
    );
  }

  // weather info  widget
  Widget _weatherInfo() {
    return WeatherInfo(
      imageAsset: this._weatherImageAsset,
      title: this._weatherTitle,
      description: this._weatherDescription,
      degrees: this._degrees,
      day: this._day
    );
  }

  // no result found widget
  Widget _noResult() {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: NoResult(
        image: 'assets/images/no_result.png',
        title: 'No Result Found',
        description: 'We can\'t find any matching results',
      )
    );
  }

  // progress indicator widget
  Widget _progressIndicator() {
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 10),
      child: CircularProgressIndicator(),
    );
  }

  _searchWeatherInfo(String city) {
    this._showProgressIndicatorView();

    Weather().getWeather(city: city.replaceAll(' ', '+')).then((weather) {
      this._updateUI(weather);
    }).catchError((error) {
      this._showNoResultView();
      Alert.show(context: context, title: 'Error', content: error.toString());
    });
  }

  void _updateUI(WeatherData weather) {
    if (weather != null) {
      setState(() {
        this._showWeatherInfoView(weather);
      });
    } else {
      this._showNoResultView();
    }
  }

  void _showProgressIndicatorView() {
    this.setState(() {
      this._contentList.clear();
      this._contentList.addAll([
        this._searchBar(),
        this._progressIndicator(),
      ]);
    });
  }

  void _showWeatherInfoView(WeatherData weather) {
    this.setState(() {
      this._city = weather.city;
      this._weatherTitle = weather.title;
      this._weatherDescription = weather.description;
      this._degrees = weather.degrees;
      this._day = weather.day;
      this._weatherImageAsset = weather.getImage();
      this._contentList.clear();
      this._contentList.addAll(<Widget>[
        this._searchBar(),
        this._weatherInfo(),
      ]);
    });
  }

  void _showNoResultView() {
    this.setState(() {
      this._contentList.clear();
      this._contentList
          .addAll(<Widget>[this._searchBar(), this._noResult()]);
    });
  }

}
