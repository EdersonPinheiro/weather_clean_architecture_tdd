import 'package:flutter_test/flutter_test.dart';
import 'package:weather_clean_architecture_tdd/data/repositories/weather_repository_impl.dart';

import '../helpers/teste_relper.mocks.dart';

void main() {
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepositoryImpl = WeatherRepositoryImpl(
        weatherRemoteDataSource: mockWeatherRemoteDataSource);
  });
}
