import 'dart:convert';

class jsonToMap{
  Map<String, dynamic> _map = {};
  String _json = "";

  void decode(){
    _json.replaceAll('<br>', '\n');
    _map = jsonDecode(_json);
  }

  void encode(){
    _json = jsonEncode(_map);
    _json.replaceAll('\n', '<br>');
  }

  void setMap(Map<String, dynamic> newmap) {
    _map = newmap;
  }

  void setJson(String newjson) {
    _json = newjson;
  }

  Map<String, dynamic> getMap(){
    return _map;
  }

  String getJson(){
    return _json;
  }

}