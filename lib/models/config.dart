import 'dart:convert';

class ConfigModel {
  Map<String, dynamic> forex = {};
  List<dynamic> lotto = [];

  ConfigModel.fromJson(String json) {
    var jsonObj = jsonDecode(json);
    forex = jsonObj['forex'];
    lotto = jsonObj['lotto'];
  }
}
