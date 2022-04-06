import 'dart:convert';

class jsonToMap{
  Map<String, dynamic> _map = {};
  String _json;
  jsonToMap(this._json);

  void decode(){
    _json.replaceAll('<br>', '\n');
    _map = jsonDecode(_json);
  }

  void encode(){
    _json = jsonEncode(_map);
    _json.replaceAll('\n', '<br>');
  }

  Map getMap(){
    return _map;
  }

  String getJson(){
    return _json;
  }

}