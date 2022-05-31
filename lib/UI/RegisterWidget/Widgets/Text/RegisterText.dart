/// import packages.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../../Data/ProviderData.dart';


/// RegisterText widget.
class RegisterText extends StatelessWidget {
  const RegisterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _textEditingController = new TextEditingController(
      text: context.watch<ProviderData>().text,
    );
    _textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _textEditingController.text.length),
    );

    return Container(
      child: Row(
        children: <Widget>[
          const Text("text"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 3,
              maxLength: 90,
              onChanged: (_newvalue) {
                context.read<ProviderData>().text = _newvalue.toString();
              },
            ),
          ),
        ],
      ),
    );
  }
}
