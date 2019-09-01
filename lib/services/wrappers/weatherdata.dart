class WeatherData {

  String city;
  String title;
  String description;
  int degrees;
  String day;

  WeatherData({this.city, this.title, this.description, this.degrees}) {
    this.day = this._getDay(DateTime.now().weekday);
  }

  String getImage() {
    if(this.title.toLowerCase().contains('cloud')) {
      return 'assets/images/cloudy.png';
    } else if(this.title.toLowerCase().contains('rain')) {
      return 'assets/images/rainy.png';
    } else if(this.title.toLowerCase().contains('snow')) {
      return 'assets/images/snowy.png';
    } else if(this.title.toLowerCase().contains('sun')) {
      return 'assets/images/sunnyy.png';
    } else {
      return 'assets/images/windy.png';
    }
  }

  @override
  String toString() {
    return '{city: $city, title: $title, description: $description, degrees: $degrees}';
  }

  String _getDay(int day) {
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }
}
