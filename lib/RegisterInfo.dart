import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:scenario_editor/ProviderData.dart';


class RegisterInfo extends StatelessWidget {
  const RegisterInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RegisterName(),
          RegisterText(),
          RegisterType(),
          RegisterBGImage(),
          RegisterCharacterImage(),
          RegisterBGM(),
          const SizedBox(
            height: 30,
          ),
          Buttons(),
        ],
      ),
    );
  }
}


class RegisterName extends StatelessWidget {
  const RegisterName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> nameList = ["", "name1", "name2", "name3", "name4"];
    final ProviderData providerData = Provider.of<ProviderData>(context);
    String? value = providerData.name;

    return Container(
      child: Row(
        children: <Widget>[
          const Text("name"),
          const SizedBox(
            width: 10,
          ),
          DropdownButton(
            value: value,
            underline: Container(
              height: 2,
              color: Colors.black12,
            ),
            items: nameList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newvalue) {
              providerData.setName(newvalue.toString());
            }
          ),
          /* subname's textfield */
          /*
          TextField(),
          */
        ],
      ),
    );
  }
}


class RegisterText extends StatelessWidget {
  const RegisterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);

    return Container(
      child: Row(
        children: <Widget>[
          const Text("text"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (newvalue) {
                providerData.setText(newvalue.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}


class RegisterType extends StatelessWidget {
  const RegisterType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> typeList = ["Speech", "Question", "StatusUP"];
    final ProviderData providerData = Provider.of<ProviderData>(context);
    String? value = providerData.type;

    return Container(
      child: Row(
        children: <Widget>[
          const Text("type"),
          const SizedBox(
            width: 10,
          ),
          DropdownButton(
              value: value,
              underline: Container(
                height: 2,
                color: Colors.black12,
              ),
              items: typeList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newvalue) {
                providerData.setType(newvalue.toString());
              }
          ),
        ],
      ),
    );
  }
}


class RegisterBGImage extends StatelessWidget {
  const RegisterBGImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);

    return Container(
      child: Row(
        children: <Widget>[
          const Text("BGImage"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              onChanged: (newvalue) {
                providerData.setBGImage(newvalue.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}


class RegisterCharacterImage extends StatelessWidget {
  const RegisterCharacterImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);

    return Container(
      child: Row(
        children: <Widget>[
          const Text("CharacterImage"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              onChanged: (newvalue) {
                providerData.setCharacterImage(newvalue.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}


class RegisterBGM extends StatelessWidget {
  const RegisterBGM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);

    return Container(
      child: Row(
        children: <Widget>[
          const Text("BGM"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              onChanged: (newvalue) {
                providerData.setBGM(newvalue.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}


class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);

    return Container(
      child: Row(
        children: <Widget>[
          ElevatedButton(
            child: const Text("Register"),
            onPressed: (){
              providerData.register();
            },
          ),
        ],
      ),
    );
  }
}