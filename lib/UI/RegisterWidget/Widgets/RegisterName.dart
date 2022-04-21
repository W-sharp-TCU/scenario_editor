/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../Data/ProviderData.dart';


/// RegisterName widget.
class RegisterName extends StatelessWidget {
  const RegisterName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);
    String? value = providerData.name;
    var _textEditingController = new TextEditingController(text: providerData.newname);
    _textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _textEditingController.text.length),
    );

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
              items: providerData.nameList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newvalue) {
                providerData.setName(newvalue.toString());
              }
          ),
          const SizedBox(
            width: 10,
          ),
          if (providerData.name == "") Expanded(
            child: TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (newvalue) {
                providerData.setNewName(newvalue.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}

