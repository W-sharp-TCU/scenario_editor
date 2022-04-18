/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../Data/ProviderData.dart';


/// RegisterCode widget.
class RegisterCode extends StatelessWidget {
  const RegisterCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);
    var _textEditingController = new TextEditingController(text: providerData.code.toString());
    _textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _textEditingController.text.length),
    );

    return Container(
      child: Row(
        children: <Widget>[
          const Text("code"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              onChanged: (newvalue) {
                //providerData.setCode(int.parse(newvalue));
                providerData.setCode(newvalue.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
