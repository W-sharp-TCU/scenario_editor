/// import packages.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../Data/ProviderData.dart';


/// RegisterCode widget.
class RegisterCode extends StatelessWidget {
  const RegisterCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _textEditingController = new TextEditingController(
      text: context.watch<ProviderData>().code.toString(),
    );
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
              keyboardType: TextInputType.number,
              maxLines: 1,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              ],
              onChanged: (newvalue) {
                if (newvalue != "") {
                  context.read<ProviderData>().code = int.parse(newvalue);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
