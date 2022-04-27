import 'dart:io';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scenario_editor/UI/RegisterWidget/Widgets/RegisterBGImage.dart';
import 'dart:convert';

import 'package:scenario_editor/UI/ShowScenarioWidget/ShowScenario.dart';
import 'package:scenario_editor/Data/json.dart';
import 'package:scenario_editor/Data/interface_ScenarioJson.dart';

class ProviderData extends ChangeNotifier {
  /// variable
  int _eventcode = -1;
  int _code = 0;
  String? _type = null;
  List<String> _typeList = ["Speech", "Question", "StatusUP"];
  String? _name = null;
  String _tmpname = ""; /// tmpname's textfield.
  List<String> _nameList = ["", "ののの", "def1", "def2", "def3"];  /// change list of name on dropdownbutton.
  String _text = "";
  String _bgImage = "";
  String _characterImage = "";
  String _bgm = "";
  String _se = "";
  String _voice_1 = "";
  String _voice_2 = "";
  String _voice_3 = "";
  List<int> _goto = [];
  List<String> _option = [];
  List<int> _status = [];
  Map<String, dynamic> _scenarioList =
  {
    "eventcode": -1,
    "context": [],
  };


  /// getter
  /// getter eventcode.
  int get eventcode => _eventcode;
  /// getter code.
  int get code => _code;
  /// getter name.
  String? get type => _type;
  /// getter typeList.
  List<String> get typeList => _typeList;
  /// getter name.
  String? get name => _name;
  /// getter tmpname.
  String get tmpname => _tmpname;
  /// getter nameList.
  List<String> get nameList => _nameList;
  /// getter text.
  String get text => _text;
  /// getter BGImage.
  String get bgImage => _bgImage;
  /// getter CharacterImage.
  String get characterImage => _characterImage;
  /// getter bgm.
  String get bgm => _bgm;
  /// getter se.
  String get se => _se;
  /// getter voise_1.
  String get voice_1 => _voice_1;
  /// getter voise_2.
  String get voice_2 => _voice_2;
  /// getter voise_3.
  String get voice_3 => _voice_3;
  /// getter goto.
  List<int> get goto => _goto;
  /// getter option.
  List<String> get option => _option;
  /// getter status.
  List<int> get status => _status;
  /// getter scenarioList.
  Map<String, dynamic> get scenarioList => _scenarioList;



  /// setter
  /// setter eventcode.
  set eventcode (int neweventcode) {
    _eventcode = neweventcode;
    setscenarioList_eventcode(neweventcode);
    notifyListeners();
  }
  /// setter code.
  set code (int newcode) {
    _code = newcode;
    notifyListeners();
  }
  /// setter type.
  set type (String? newtype) {
    _type = newtype;
    notifyListeners();
  }
  /// setter name.
  set name (String? newname) {
    _name = newname;
    notifyListeners();
  }
  /// setter tmpname.
  set tmpname (String newtmpname) {
    _tmpname = newtmpname;
    print(_tmpname);
    notifyListeners();
  }
  /// setter nameList.
  set nameList (List<String> newnameList) {
    _nameList = newnameList;
    notifyListeners();
  }
  /// setter text.
  set text (String newtext) {
    _text = newtext;
    notifyListeners();
  }
  /// setter BGimage.
  set bgImage (String newbgImage) {
    _bgImage = newbgImage;
    notifyListeners();
  }
  /// setter CharacterImage.
  set characterImage (String newcharacterImage) {
    _characterImage = newcharacterImage;
    notifyListeners();
  }
  /// setter bgm.
  set bgm (String newbgm) {
    _bgm = newbgm;
    notifyListeners();
  }
  /// setter se.
  set se (String newse) {
    _se = newse;
    notifyListeners();
  }
  /// setter voice_1.
  set voice_1 (String newvoice_1) {
    _voice_1 = newvoice_1;
    notifyListeners();
  }
  /// setter voice_2.
  set voice_2 (String newvoice_2) {
    _voice_2 = newvoice_2;
    notifyListeners();
  }
  /// setter voice_3.
  set voice_3 (String newvoice_3) {
    _voice_3 = newvoice_3;
    notifyListeners();
  }
  /// setter goto.
  set goto (List<int> newgoto) {
    _goto = newgoto;
    notifyListeners();
  }
  /// setter option.
  set option (List<String> newoption) {
    _option = newoption;
    notifyListeners();
  }
  /// setter status.
  set status (List<int> newstatus) {
    _status = newstatus;
    notifyListeners();
  }
  /// setter scenarioList.
  set scenarioList (Map<String, dynamic> newscenarioList) {
    scenarioList = newscenarioList;
    notifyListeners();
  }


  /// set map.
  /// set scenarioList.
  void setscenarioList_eventcode (int neweventcode) {
    scenarioList["eventcode"] = neweventcode;
  }


  /// add value to lists. (setter)
  /// add to nameList.
  void addnameList (String newnamevalue) {
    _nameList.add(newnamevalue);
  }
  /// add to goto.
  void addgoto (int newgotovalue) {
    _goto.add(newgotovalue);
    notifyListeners();
  }
  /// add to option.
  void addoption (String newoptionvalue) {
    _option.add(newoptionvalue);
    notifyListeners();
  }


  /// edit value on lists.
  /// edit on goto.
  void editgoto (int newgotovalue, int index) {
    _goto[index] = newgotovalue;
    notifyListeners();
  }
  /// edit on option.
  void editoption (String newoptionvalue, int index) {
    _option[index] = newoptionvalue;
    notifyListeners();
  }


  /// register.
  void register () {
    /// collect scenario data, name, type etc.
    Map<String, dynamic> _tmpmap = {};
    /// register code.
    if (code >= 0) {
      _tmpmap["code"] = code;
    } else {
      print("error: code");
      return;
    }
    /// register type.
    if (type == "Speech" || type ==  "Question" || type == "StatusUP") {
      if (type == "Speech") {
        _tmpmap["type"] = ScenarioJsonInterface.speech;
      } else if (type == "Question") {
        _tmpmap["type"] = ScenarioJsonInterface.question;
      } else if (type == "StatusUP") {
        _tmpmap["type"] = ScenarioJsonInterface.statusUp;
      } else {
        print("error: type interface");
        return;
      }
    } else {
      print("error: type");
      return;
    }
    /// register name.
    if (type == "Speech") {
      if (name == "" && tmpname != "") {
        _tmpmap["name"] = tmpname;
        addnameList(tmpname);
      } else if (name != null) {
        _tmpmap["name"] = name;
      } else {
        print("error: name");
        return;
      }
    } else {
      _tmpmap["name"] = "";
    }
    /// register text.
    if (type == "Speech") {
      if (text != "") {
        _tmpmap["text"] = text;
      } else {
        print("error: text");
        return;
      }
    } else {
      _tmpmap["text"] = text;
    }
    /// register bgImage.
    if (bgImage != "") {
      _tmpmap["BGImage"] = bgImage;
    } else {
      print("error: BGImage");
      return;
    }
    /// register characterImage.
    if (characterImage != "") {
      _tmpmap["CharacterImage"] = characterImage;
    } else {
      print("error: CharacterImage");
      return;
    }
    /// register bgm.
    if (bgm != "") {
      _tmpmap["BGM"] = bgm;
    } else {
      print("error: BGM");
      return;
    }
    /// register se.
    if (se != "") {
      _tmpmap["SE"] = se;
    } else {
      print("error: SE");
      return;
    }
    /// register voice_1.
    if (voice_1 != "") {
      _tmpmap["Voice_1"] = voice_1;
    } else {
      print("error: voise_1");
      return;
    }
    /// register voice_2.
    if (voice_2 != "") {
      _tmpmap["Voice_2"] = voice_2;
    } else {
      print("error: voise_2");
      return;
    }
    /// register voice_3.
    if (voice_3 != "") {
      _tmpmap["Voice_1"] = voice_3;
    } else {
      print("error: voise_3");
      return;
    }
    /// register goto.
    removegotoandoption();
    if (goto.isEmpty) {
      _tmpmap["goto"] = [code + 1];
      _tmpmap["option"] = [];
    } else {
      _tmpmap["goto"] = goto;
      _tmpmap["option"] = option;
    }

    /// insert tmpmap to scenarioList.
    scenarioList["context"].insert(code, _tmpmap);

    /// adjust goto value when scenario inserted.
    adjust();

    print(scenarioList);
    clear();
    notifyListeners();
  }


  /// remove goto and option when register.
  void removegotoandoption () {
    for (int i = 0; i < goto.length; i++) {
      if (goto[i] == -1) {
        goto.removeAt(i);
        option.removeAt(i);
        return removegotoandoption();
      }
    }
  }


  /// adjust goto value.
  void adjust () {
    for (int i = 0; i < scenarioList["context"].length; i++) {
      if (scenarioList["context"][i]["code"] != i) {
        scenarioList["context"][i]["code"] = i;
      }
    }
  }


  /// call it to restore scenariolist.
  void getScenario(codeNum) {
    clear();
    eventcode = scenarioList["eventcode"];
    code = scenarioList["context"][codeNum]["code"];
    if (scenarioList["context"][codeNum]["type"] == ScenarioJsonInterface.speech) {
      type = "Speech";
    } else if (scenarioList["context"][codeNum]["type"] == ScenarioJsonInterface.question) {
      type = "Question";
    } else if (scenarioList["context"][codeNum]["type"] == ScenarioJsonInterface.statusUp) {
      type = "StatusUP";
    }
    if (nameList.contains(scenarioList["context"][codeNum]["name"])) {
      name = scenarioList["context"][codeNum]["name"];
    } else {
      name = "";
      tmpname = scenarioList["context"][codeNum]["name"];
    }
    text = scenarioList["context"][codeNum]["text"];
    bgImage = scenarioList["context"][codeNum]["BGImage"];
    characterImage = scenarioList["context"][codeNum]["CharacterImage"];
    bgm = scenarioList["context"][codeNum]["BGM"];
    se = scenarioList["context"][codeNum]["SE"];
    voice_1 = scenarioList["context"][codeNum]["Voice_1"];
    voice_2 = scenarioList["context"][codeNum]["Voice_2"];
    voice_3 = scenarioList["context"][codeNum]["Voice_3"];
    goto = scenarioList["context"][codeNum]["goto"];
    option = List<String>.from(scenarioList["context"][codeNum]["option"]);
    notifyListeners();
  }


  /// delete scenario.
  void delete (int index) {
    scenarioList["context"].removeAt(index);
    adjust();
    clear();
    notifyListeners();
  }


  /// clear register widget.
  void clear () {
    code = scenarioList["context"].length;
    type = null;
    name = null;
    tmpname = "";
    text = "";
    bgImage = "";
    characterImage = "";
    bgm = "";
    se = "";
    voice_1 = "";
    voice_2 = "";
    voice_3 = "";
    goto = [];
    option = [];
  }


  /// allclear.
  void allclear () {
    eventcode = -1;
    code = scenarioList["context"].length;
    type = null;
    name = null;
    tmpname = "";
    nameList = ["", "ののの", "def1", "def2", "def3"];
    text = "";
    bgImage = "";
    characterImage = "";
    bgm = "";
    se = "";
    voice_1 = "";
    voice_2 = "";
    voice_3 = "";
    goto = [];
    option = [];
    scenarioList =
    {
      "eventcode": -1,
      "context": [],
    };
  }


  /// load json file as map.
  void loadFile () async {
    allclear();
    final XTypeGroup typeGroup = XTypeGroup(
      label: "json",
      extensions: ["json"],
    );
    final XFile? file = await openFile(
      acceptedTypeGroups: [typeGroup],
    );
    if (file == null) {
      return;
    }
    final String fileContent = await file.readAsString();
    jsonToMap jsontomap = new jsonToMap();
    jsontomap.setJson(fileContent);
    jsontomap.decode();
    _scenarioList = jsontomap.getMap();
    clear();
    notifyListeners();
  }


  /// save map data as json file.
  void saveFile() async {
    String? path = await getSavePath(
      acceptedTypeGroups: [
        XTypeGroup(
          label: "json",
          extensions: ["json"],
        )
      ],
      suggestedName: "sampledatafile.json",
    );
    if (path == null) {
      return;
    }
    jsonToMap jsontomap = new jsonToMap();
    jsontomap.setMap(scenarioList);
    jsontomap.encode();
    if (path == "") {
      final anchor = html.AnchorElement(
          href: "data:application/json;charset=utf-8," + jsontomap.getJson()
      );
      anchor.download = "sampledatafile.json";
      anchor.click();
    } else {
      final dynamic data = Uint8List.fromList(jsontomap.getJson().codeUnits);
      final mimeType = "application/json";
      final file = XFile.fromData(data, mimeType: mimeType);
      await file.saveTo(path);
    }
    notifyListeners();
  }

}
