
import 'package:http/http.dart' as http ;
import 'dart:convert';
class NetworkingHelper {

  NetworkingHelper(this.url);
  final String url;

  Future  getData() async{
      try {
        http.Response response = await http.get(url);
          String data = response.body;
          return jsonDecode(data);
      } catch(e) {
        print(e);
      }
  }
}