/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../Data/ProviderData.dart';


/// RegisterCharacterImage widget.
class RegisterCharacterImage extends StatelessWidget {
  const RegisterCharacterImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);
    var _textEditingController = new TextEditingController(text: providerData.CharacterImage);
    _textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _textEditingController.text.length),
    );

    return Container(
      child: Row(
        children: <Widget>[
          const Text("CharacterImage"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
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
