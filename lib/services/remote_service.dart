import 'package:chefkraft/model/popular_dish_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future<PopularDishModel?> fetchData() async {
    var response = await client.get(Uri.parse(
        "https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return popularDishModelFromJson(jsonString);
    } else {
      return null;
    }
  }
}
