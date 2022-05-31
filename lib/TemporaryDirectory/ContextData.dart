import 'package:flutter/cupertino.dart';
import 'package:scenario_editor/Data/Interface/interface_ScenarioJson.dart';

class ContextData extends ScenarioJsonInterface {
  int _index = 0;
  int _type = 0;
  String? _text;
  List<String>? _option;
  List<int>? _statusName;
  List<int>? _gain;
  List<int> _goto = [];
  
  int get index => _index;
  int get type => _type;
  String? get text => _text;
  List<String>? get option => _option;
  List<int>? get statusName => _statusName;
  List<int>? get gain => _gain;
  List<int> get goto => _goto;

  ContextData.speech({required int index, required String text, required List<int> goto}) {
    _index = index;
    _type = ScenarioJsonInterface.speech;
    _text = text;
    _goto = goto;
  }

  ContextData.question({required int index, String? text,
                        required List<String> option, required List<int> goto}) {
    if (!(option.length == goto.length)) {
      throw Exception("option.length and goto.length must be the same.");
    }
    _index = index;
    _type = ScenarioJsonInterface.question;
    _text = text;
    _option = option;
    _goto = goto;
  }

  ContextData.statusUp({required int index, String? text,
                        required List<int> statusName, required List<int> gain,
                        required List<int> goto}) {
    if (!(statusName.length == gain.length && gain.length == goto.length)) {
      throw Exception("statusName.length, gain.length & goto.length must be same.");
    }
    _index = index;
    _type = ScenarioJsonInterface.question;
    _text = text;
    _statusName = statusName;
    _gain = gain;
    _goto = goto;
  }

  set index(int newValue) => _index;
  set text(String? newValue) => _text;
  set option(List<String>? newValue) {
    switch (_type) {
      case ScenarioJsonInterface.speech:
        throw Exception("You can edit only \"index\", \"text\", & \"goto\" "
            "because this data type is \"speech\".");
      case ScenarioJsonInterface.statusUp:
        throw Exception("You can edit only \"index\", \"text\", \"statusName\", \"gain\" & \"goto\" "
            "because this data type is \"statusUp\".");
    }
    _option = newValue;
  }
  set statusName(List<int>? newValue) {
    switch (_type) {
      case ScenarioJsonInterface.speech:
        throw Exception("You can edit only \"index\", \"text\", & \"goto\" "
            "because this data type is \"speech\".");
      case ScenarioJsonInterface.question:
        throw Exception("You can edit only \"index\", \"text\", \"question\", \"option\" & \"goto\" "
            "because this data type is \"question\".");
    }
    _statusName = newValue;
  }
  set gain(List<int>? newValue) {
    switch (_type) {
      case ScenarioJsonInterface.speech:
        throw Exception("You can edit only \"index\", \"text\", & \"goto\" "
            "because this data type is \"speech\".");
      case ScenarioJsonInterface.question:
        throw Exception("You can edit only \"index\", \"text\", \"question\", \"option\" & \"goto\" "
            "because this data type is \"question\".");
    }
    _gain = newValue;
  }
  set goto(List<int> newValue) => _goto;
}