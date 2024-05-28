import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_clean_architecture_tdd/core/error/exception.dart';
import 'package:weather_clean_architecture_tdd/core/error/failure.dart';
import 'package:weather_clean_architecture_tdd/data/repositories/weather_repository_impl.dart';
import '../helpers/dummy_data/dummy_models.dart';
import '../helpers/teste_relper.mocks.dart';

void main() {
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepositoryImpl = WeatherRepositoryImpl(
        weatherRemoteDataSource: mockWeatherRemoteDataSource);
  });

  group('get current weather', () {
    test('should return current weather a call to data source is successful',
        () async {
      when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
          .thenAnswer((_) async => testWeatherModel);

      final result =
          await weatherRepositoryImpl.getCurrentWeather(testCityName);

      expect(result, equals(const Right(testWeatherEntity)));
    });

    test('should return server failure a call to data source is unsuccessful',
        () async {
      when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
          .thenThrow(ServerException());

      final result =
          await weatherRepositoryImpl.getCurrentWeather(testCityName);

      expect(result, equals(const Left(ServerFailure('An error has occurred'))));
    });

     test('should return connection failure when the device has no internet',
        () async {
      when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
          .thenThrow(const SocketException('Failed to connect to the network'));

      final result =
          await weatherRepositoryImpl.getCurrentWeather(testCityName);

      expect(result, equals(const Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });
}
