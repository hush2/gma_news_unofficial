import 'dart:convert';

class SconfigModel {
  Map<String, dynamic> _forex = {};
  List<dynamic> _lotto = [];

  get forex => _forex;

  get lotto => _lotto;

  SconfigModel.fromJson(String json) {
    var jsonObj = jsonDecode(json);
    _forex = jsonObj['forex'];
    _lotto = jsonObj['lotto'];
  }
}
