import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_selector/file_selector.dart';
import 'dart:convert';

import 'package:scenario_editor/UI/ShowScenarioWidget/ShowScenario.dart';
import 'package:scenario_editor/Data/json.dart';


class ProviderData extends ChangeNotifier {
  /// variable
  int eventcode = -1;
  int code = 0;
  String? type = null;
  String? name = null;
  String? newname = null; /// newname's textfield.
  List<String> nameList = ["", "ののの", "def1", "def2", "def3"];  /// change list of name on dropdownbutton.
  String? text = null;
  String? BGImage = null;
  String? CharacterImage = null;
  String? BGM = null;
  List<int> goto = [];
  List<int> estimatedgoto = []; /// goto estimated.
  String? tmpgotovalue = null;
  List<String> option = [];
  Map<String, dynamic> scenarioList =
  {
    "eventcode": -1,
    "context": [],
  };
  Map<String, dynamic> scenarioMap =
  {
    "eventcode": -1,
    "context": [],
  };

  /// call it to restore scenariolist.
  void getScenario(codeNum) {
    clear();
    setEventCode(scenarioList["eventcode"]);
    setCode(scenarioList["context"][codeNum]["code"]);
    if (scenarioList["context"][codeNum]["type"] == "") {
      type = null;
    } else {
      setType(scenarioList["context"][codeNum]["type"]);
    }
    if (nameList.contains(scenarioList["context"][codeNum]["name"])) {
    } else {
      nameList.add(scenarioList["context"][codeNum]["name"]) ;
    }
    setText(scenarioList["context"][codeNum]["text"]);
    setBGImage(scenarioList["context"][codeNum]["BGImage"]);
    setCharacterImage(scenarioList["context"][codeNum]["CharacterImage"]);
    setBGM(scenarioList["context"][codeNum]["BGM"]);

    if(scenarioList["context"][codeNum]["goto"] != null) {
      print(scenarioList["context"][codeNum]["goto"] is List<int>);
      /*
      String _tmpgoto = scenarioList["context"][codeNum]["goto"].replaceFirst("[","");
      _tmpgoto = _tmpgoto.replaceFirst("]","");
      goto = _tmpgoto.split(",").map<int>((String item) => int.parse(item)).toList();
      */
      goto = scenarioList["context"][codeNum]["goto"];
      print(goto);
    }
    if(scenarioList["context"][codeNum]["option"] != null) {
      String _tmpoption = scenarioList["context"][codeNum]["option"].replaceFirst("[", "");
      _tmpoption = _tmpoption.replaceFirst("]", "");
      option = _tmpoption.split(",").toList();
      print(option);
    }
    notifyListeners();
  }

  /// set eventcode.
  void setEventCode(newEventCode) {
    eventcode = newEventCode;
    notifyListeners();
  }
  /// set code.
  void setCode(newcode) {
    code = int.parse(newcode);
    notifyListeners();
  }
  /// set name.
  void setName(newname) {
    name = newname;
    notifyListeners();
  }
  /// set newname.
  void setNewName(newName) {
    newname = newName;
    notifyListeners();
  }
  /// set text.
  void setText(newtext) {
    text = newtext;
    notifyListeners();
  }
  /// set type.
  void setType(newtype) {
    type = newtype;
    notifyListeners();
  }
  /// set BGImage.
  void setBGImage(newBGImage) {
    BGImage = newBGImage;
    notifyListeners();
  }
  /// set CharacterImage.
  void setCharacterImage(newCharacterImage) {
    CharacterImage = newCharacterImage;
    notifyListeners();
  }
  /// set BGM.
  void setBGM(newBGM) {
    BGM = newBGM;
    notifyListeners();
  }
  /// set goto.
  void setGoto(newGoto, i) {
    goto[i] = int.parse(newGoto);
    notifyListeners();
  }
  /// set estimatedgoto.
  void setEstimatedGoto(newestimatedgoto) {
    estimatedgoto.add(newestimatedgoto);
    notifyListeners();
  }
  /// set option.
  void setOption(newOption, i) {
    option[i] = newOption;
    notifyListeners();
  }
  /// add empty to goto and option.
  void add(){
    goto.add(-1);
    option.add("");
    notifyListeners();
  }

  /// register scenario to scenariolist.
  void register() {
    /// once, scenriodata to tmpmap.
    Map<String, dynamic> tmpmap = {};
    if (code == null) {
      tmpmap["code"] = "";
    } else {
      tmpmap["code"] = code.toString();
    }
    if (type == null) {
      tmpmap["type"] = "";
    } else {
      tmpmap["type"] = type.toString();
    }
    if (name == null) {
      tmpmap["name"] = "";
    } else {
      if (name == ""){
        tmpmap["name"] = newname.toString();
      } else {
        tmpmap["name"] = name.toString();
      }
    }
    if (text == null) {
      tmpmap["text"] = "";
    } else {
      tmpmap["text"] = text.toString();
    }
    if (BGImage == null) {
      tmpmap["BGImage"] = "";
    } else {
      tmpmap["BGImage"] = BGImage.toString();
    }
    if (CharacterImage == null) {
      tmpmap["Character"] = "";
    } else {
      tmpmap["Character"] = CharacterImage.toString();
    }
    if (BGM == null) {
      tmpmap["BGM"] = "";
    } else {
      tmpmap["BGM"] = BGM.toString();
    }
    if (goto.isEmpty) {
      tmpmap["goto"] = [code + 1];
      tmpmap["option"] = [];
    } else {
      removeGoto(goto);
      tmpmap["goto"] = goto;
      tmpmap["option"] = option;
    }
    /// add tmpmap to scenairolist.
    scenarioList["context"].insert(code, tmpmap);
    /// adjust goto when scenario inserted.
    for (int i = 0; i < scenarioList["context"].length; i++) {
      if (int.parse(scenarioList["context"][i]["code"]) != i) {
        for (int j = 0; j < scenarioList["context"].length; j++) {
          for (int k = 0; k < scenarioList["context"][j]["goto"].length; k++) {
            if (scenarioList["context"][j]["goto"][k] == int.parse(scenarioList["context"][i]["code"])) {
              scenarioList["context"][j]["goto"][k] = i + 1;
            }
          }
        }
        scenarioList["context"][i]["code"] = i;
      }
    }
    clear();
    print(scenarioList);
    notifyListeners();
  }

  /// remove goto[i] and option[i] if goto[i] is empty.
  /// call it to register scenario data to scenariolist.
  List<int> removeGoto (List<int> oldgoto) {
    for (int i = 0; i < oldgoto.length; i++) {
      if (goto[i] == "") {
        goto.removeAt(i);
        option.removeAt(i);
        return removeGoto(goto);
      }
    }
    return goto;
  }

  /// call it to set estimatedgoto.
  void predictGoto() {
    for(int i = 0; i < scenarioList["context"].length; i++) {
      setEstimatedGoto(scenarioList["context"][i]["code"]);
    }
  }

  /// call it to refresh register form.
  void clear() {
    code = scenarioList["context"].length;
    name = null;
    newname = null;
    text = null;
    type = null;
    BGImage = null;
    CharacterImage = null;
    BGM = null;
    option = [];
    goto = [];
    estimatedgoto = [];
    tmpgotovalue = null;
    notifyListeners();
  }

  /// allclear variables.
  void allClear() {
    eventcode = -1;
    code = 0;
    name = null;
    newname = null;
    nameList = ["", "ののの", "def1", "def2", "def3"];
    text = null;
    type = null;
    BGImage = null;
    CharacterImage = null;
    BGM = null;
    option = [];
    goto = [];
    estimatedgoto = [];
    tmpgotovalue = null;
    scenarioList =
    {
      "eventcode": -1,
      "context": [],
    };
    scenarioMap =
    {
      "eventcode": -1,
      "context": [],
    };
    notifyListeners();
  }

  /// load json file as map.
  void loadFile() async{
    allClear();
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
    scenarioMap = jsontomap.getMap();
    scenarioList = scenarioMap;
    notifyListeners();
  }

  /// save map data as json file.
  void saveFile() async {
    scenarioList["eventcode"] = eventcode;
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
    } else {
      scenarioMap = scenarioList;
      jsonToMap jsontomap = new jsonToMap();
      jsontomap.setMap(scenarioMap);
      jsontomap.encode();
      final dynamic data = Uint8List.fromList(jsontomap
          .getJson()
          .codeUnits);
      final mimeType = "application/json";
      final file = XFile.fromData(data, mimeType: mimeType);
      await file.saveTo(path);
    }
    notifyListeners();
  }
}