import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderData extends ChangeNotifier {
  //int eventcode = -1;
  int code = -1;
  String? name = null;
  String text = "";
  String? type = null;
  String? BGImage = null;
  String? CharacterImage = null;
  String? BGM = null;
  //List<int> goto = [];
  Map<String, dynamic> scenarioList =
    {
      "eventcode": 1,
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

  void getScenario(codeNum) {
    print(codeNum);
    setName(scenarioList["context"][codeNum]["name"]);
    setText(scenarioList["context"][codeNum]["text"]);
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

  void register() {
    /* 各provider値をmap型にする関数 */
    clear();
    notifyListeners();
  }

  void clear() {
    //eventcode = -1;
    code = -1;
    name = null;
    text = "";
    type = null;
    BGImage = null;
    CharacterImage = null;
    BGM = null;
    //goto = [];
  }
}