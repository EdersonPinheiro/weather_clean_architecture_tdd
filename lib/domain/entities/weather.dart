import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName;
  final String main;
  final String description;
  final String inCode;
  final double temperature;
  final int pressure;
  final int humidity;

  const WeatherEntity(
      {required this.cityName,
      required this.main,
      required this.description,
      required this.inCode,
      required this.temperature,
      required this.pressure,
      required this.humidity});

  @override
  // TODO: implement props
  List<Object?> get props => [
        cityName,
        main,
        description,
        inCode,
        temperature,
        pressure,
        humidity,
      ];
}
