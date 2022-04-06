import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_selector/file_selector.dart';
import 'dart:convert';

import 'package:scenario_editor/ShowScenario.dart';

class ProviderData extends ChangeNotifier {
  int eventcode = -1;
  int code = -1;
  String? name = null;
  String text = "";
  String? type = null;
  String? BGImage = null;
  String? CharacterImage = null;
  String? BGM = null;
  List<int> goto = [];
  List<String> option = [];
  Map<String, dynamic> scenarioList =
    {
      "eventcode": 10,
      "context": [
        {
          "code": 0,
          "name": "name1",
          "text": "test text 1",
        },
        {
          "code": 1,
          "name": "name2",
          "text": "test text 2",
        },
      ],
    };


  void loadFile() async{
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
    print(fileContent);
    /* string で受け取るから jsonにする関数が必要 */
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
      final dynamic data = Uint8List.fromList(jsonEncode(scenarioList).codeUnits);
      final mimeType = "application/json";
      final file = XFile.fromData(data, mimeType: mimeType);
      await file.saveTo(path);
    }
  }

  void getScenario(codeNum) {
    print(codeNum);
    /* get each field value methods */
    /*

    */
    setEventCode(scenarioList["eventcode"]);
    setName(scenarioList["context"][codeNum]["name"]);
    setText(scenarioList["context"][codeNum]["text"]);
    /*
    setType(scenarioList["context"][codeNum]["type"]);
    setBGImage(scenarioList["context"][codeNum]["BGImage"]);
    setCharacterImage(scenarioList["context"][codeNum]["CharacterImage"]);
    setBGM(scenarioList["context"][codeNum]["BGM"]);
    goto = scenarioList["context"][codeNum]["goto"];
    option = scenarioList["context"][codeNum]["option"];
    */
  }

  void setEventCode(newEventCode) {
    eventcode = newEventCode;
    notifyListeners();
  }

  void setCode(newcode) {
    code = int.parse(newcode);
    print(code);
    notifyListeners();
  }

  void setName(newname) {
    name = newname;
    print(name);
    notifyListeners();
  }

  void setText(newtext) {
    text = newtext;
    print(text);
    notifyListeners();
  }

  void setType(newtype) {
    type = newtype;
    print(type);
    notifyListeners();
  }

  void setBGImage(newBGImage) {
    BGImage = newBGImage;
    print(newBGImage);
    notifyListeners();
  }

  void setCharacterImage(newCharacterImage) {
    CharacterImage = newCharacterImage;
    print(CharacterImage);
    notifyListeners();
  }

  void setBGM(newBGM) {
    BGM = newBGM;
    print(BGM);
    notifyListeners();
  }

  void setGoto(newGoto, i) {
    goto[i] = int.parse(newGoto);
    print(goto);
    notifyListeners();
  }

  void setOption(newOption, i) {
    option[i] = newOption;
    print(option);
    notifyListeners();
  }

  void add(){
    goto.add(-1);
    option.add("");
    notifyListeners();
  }

  void register() {
    for (int i = 0; i < goto.length; i++) {
      if (option == "") {
        goto.remove(i);
        goto.remove(i);
      }
    }
    /* 各provider値をmap型にする関数 */
    /*

    */
    clear();
    notifyListeners();
  }

  void clear() {
    eventcode = -1;
    code = -1;
    name = null;
    text = "";
    type = null;
    BGImage = null;
    CharacterImage = null;
    BGM = null;
    option = [];
    goto = [];
  }
}