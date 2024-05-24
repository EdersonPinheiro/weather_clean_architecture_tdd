import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

import 'package:weather_clean_architecture_tdd/domain/repositories/weather_repository.dart';

@GenerateMocks(
  [WeatherRepository],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void Main() {}