import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  static const String baseUrl = 'https://api.stackexchange.com/2.2/';
  static const Map<String, String> headers = {
  "Accept" : "application/json;charset=utf-t",
  "Accept-Language" : "en"
  };


  Future<dynamic>? get(String endpoint, {Map<String, String>? queryParams}) async {
    final Uri uri = Uri.parse(baseUrl + endpoint);

    // Ensure that query parameters are converted to strings
    final Map<String, String> queryParamsString = queryParams ?? {};

    final Uri finalUri = uri.replace(
      queryParameters: queryParamsString,
    );

    final response = await http.get(finalUri, headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
