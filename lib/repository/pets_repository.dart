import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tms_assignment/models/PetsResponse.dart';

class PetsRepository {
  Future<List<Pets>> getListFromServer() async {
    List<Pets> petsList = List();
    try {
      http.Response response =
          await http.get("https://raw.githubusercontent.com/LearnWebCode/json-example/master/pets-data.json");

      final Map parsed = json.decode(response.body);
      PetsResponse data = PetsResponse.fromJson(parsed);
        petsList = data.pets;
      print('response ${response.body}');
      print('list ${data.pets.length}');

    } catch (e) {
      print(e);
    }
    return petsList;
  }
}
