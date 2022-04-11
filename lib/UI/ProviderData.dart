import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_selector/file_selector.dart';
import 'dart:convert';

import 'package:scenario_editor/UI/ShowScenario.dart';
import 'package:scenario_editor/json.dart';


class ProviderData extends ChangeNotifier {
  int eventcode = -1;
  int code = 0;
  String? type = null;
  String? name = null;
  String? newname = null;
  List<String> nameList = ["", "ののの", "def1", "def2", "def3"];
  String? text = null;
  String? BGImage = null;
  String? CharacterImage = null;
  String? BGM = null;
  List<int> goto = [];
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

  void saveFile() async{
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
      final dynamic data = Uint8List.fromList(jsontomap.getJson().codeUnits);
      final mimeType = "application/json";
      final file = XFile.fromData(data, mimeType: mimeType);
      await file.saveTo(path);
    }
    notifyListeners();
  }

  void getScenario(codeNum) {
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
    if (scenarioList["context"][codeNum]["option"] == []) {
      goto = scenarioList["context"][codeNum]["goto"].cast<int>();
      option = scenarioList["context"][codeNum]["option"].cast<String>();
    }
    notifyListeners();
  }


  void setEventCode(newEventCode) {
    eventcode = newEventCode;
    notifyListeners();
  }

  void setCode(newcode) {
    code = int.parse(newcode);
    notifyListeners();
  }

  void setName(newname) {
    name = newname;
    notifyListeners();
  }

  void setNewName(newName) {
    newname = newName;
    notifyListeners();
  }

  void setText(newtext) {
    text = newtext;
    notifyListeners();
  }

  void setType(newtype) {
    type = newtype;
    notifyListeners();
  }

  void setBGImage(newBGImage) {
    BGImage = newBGImage;
    notifyListeners();
  }

  void setCharacterImage(newCharacterImage) {
    CharacterImage = newCharacterImage;
    notifyListeners();
  }

  void setBGM(newBGM) {
    BGM = newBGM;
    notifyListeners();
  }

  void setGoto(newGoto, i) {
    goto[i] = int.parse(newGoto);
    notifyListeners();
  }

  void setOption(newOption, i) {
    option[i] = newOption;
    notifyListeners();
  }

  void add(){
    goto.add(-1);
    option.add("");
    notifyListeners();
  }

  void register() {
    /* 各provider値をmap型にする関数 */
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
      tmpmap["goto"] = goto.toString();
      tmpmap["option"] = option.toString();
    }

/*
    /* tmpmapを追加 */
    for (int i = 0; i < scenarioList["context"].length; i++) {
      if (scenarioList["context"][i]["goto"].containsValue(code) == true) {
        int index = scenarioList["context"][i]["goto"].indexOf(code);
        scenarioList["context"][i]["goto"][index] = code;
      }
    }
*/

    scenarioList["context"].insert(code, tmpmap);

    clear();
    notifyListeners();
  }

  List<int> removeGoto (List<int> oldgoto) {
    for (int i = 0; i < oldgoto.length; i++) {
      if (goto[i] == ""){
        goto.removeAt(i);
        option.removeAt(i);
        return removeGoto(goto);
      }
    }
    return goto;
  }

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
    notifyListeners();
  }

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
  }
}