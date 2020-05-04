import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class PrimeNumberService {
  final String proxy = "localhost:8888";
  IOClient _httpClient;

  PrimeNumberService() {
    var httpClient = HttpClient();
    httpClient.findProxy = (uri) {
      return "PROXY $proxy";
    };
    _httpClient = IOClient(httpClient);
  }

  Future<int> fetchPrimes(String query) async {
    var url = Uri.https('api.wolframalpha.com', 'v2/query', {
      'input': query,
      'format': 'plaintext',
      'output': 'JSON',
      'appid': 'PPTG5L-RJRTTAKARR'
    }).toString();

    final response = await _httpClient.get(url);
    final Map<String, dynamic> jsonMap = json.decode(response.body);
    List<Map<String, dynamic>> podsArray =
        List<Map<String, dynamic>>.from(jsonMap['queryresult']['pods']);
    var pod = podsArray.firstWhere((pod) {
      if (pod['primary'] == true) {
        return true;
      }
      return false;
    });
    print(pod);
    Map<String, dynamic> subpod =
        List<Map<String, dynamic>>.from(pod['subpods']).first;
    print(subpod['plaintext']);
    return int.parse(subpod['plaintext']);
  }
}
