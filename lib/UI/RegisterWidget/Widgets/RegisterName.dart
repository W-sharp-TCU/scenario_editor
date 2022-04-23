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
    String? _value = context.watch<ProviderData>().name;
    var _textEditingController = new TextEditingController(
      text: context.watch<ProviderData>().tmpname,
    );
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
              value: _value,
              underline: Container(
                height: 2,
                color: Colors.black12,
              ),
              items: context.watch<ProviderData>().nameList.map<DropdownMenuItem<String>>((String _value) {
                return DropdownMenuItem<String>(
                  value: _value,
                  child: Text(_value),
                );
              }).toList(),
              onChanged: (_newvalue) {
                if (_newvalue != null) {
                  context.read<ProviderData>().name = _newvalue.toString();
                }
              }
          ),
          const SizedBox(
            width: 10,
          ),
          if (context.watch<ProviderData>().name == "") Expanded(
            child: TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              onChanged: (_newvalue) {
                context.read<ProviderData>().tmpname = _newvalue.toString();
              },
            ),
          ),
        ],
      ),
    );
  }
}

