class HourlyModel {
  DateTime time;
  String humidity;
  double temp;
  String icon;

  HourlyModel(
      {required this.time, required this.humidity, required this.temp, required this.icon});

  factory HourlyModel.fromJson(Map<String, dynamic>json){
    return HourlyModel(
      time: DateTime.parse(json['time']),
      humidity: json['humidity'].toString(),
      temp: json['temp_c'],
      icon: json['condition']['icon'].toString(),
    );
  }
}