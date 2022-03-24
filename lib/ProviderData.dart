import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderData extends ChangeNotifier {
  //int eventcode = -1;
  String? name = null;
  String text = "";
  String? type = null;
  String? BGImage = null;
  String? CharacterImage = null;
  String? BGM = null;
  //List<int> goto = [];

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

    clear();
  }

  void clear() {
    //eventcode = -1;
    name = null;
    text = "";
    type = null;
    BGImage = null;
    CharacterImage = null;
    BGM = null;
    //goto = [];
  }
}