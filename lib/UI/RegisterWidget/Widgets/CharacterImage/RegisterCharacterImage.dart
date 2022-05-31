/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../../Data/ProviderData.dart';


/// RegisterCharacterImage widget.
class RegisterCharacterImage extends StatelessWidget {
  const RegisterCharacterImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _textEditingController = new TextEditingController(
      text: context.watch<ProviderData>().characterImage,
    );
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
              onChanged: (_newvalue) {
                context.read<ProviderData>().characterImage = _newvalue.toString();
              },
            ),
          ),
        ],
      ),
    );
  }
}
