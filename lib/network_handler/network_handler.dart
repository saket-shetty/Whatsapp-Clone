import 'package:http/http.dart' as http;

class NetworkHandler {
  static Future<http.Response> getRequest(String url) async {
    Map<String, String> headers = {"app-id": "60992da1ea03b472bb9a096b"};
    // https://dummyapi.io/data/api/user
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }
}
