import 'RequestMaker.dart';

class WebService {
  static final HOST = "http://185.185.83.212:5000/save";
  static final TEST = "";

  static Future<String> send(String measurement, Map<String, dynamic> tags,
      Map<String, dynamic> fields) async {
    String url = HOST + TEST;
    Map<String, dynamic> body = {
      "measurement": measurement,
      "tags": tags,
      "fields": fields
    };
    print("url Create User " + url);
    print("body Create User: " + body.toString());
    RequestMaker().post(url, body, false);
    return "a";
  }
}
