/// import packages.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../../Data/ProviderData.dart';


/// RegisterWiVoiceScreen widget.
class RegisterVoiceScreen extends StatelessWidget {
  const RegisterVoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          height: size.height * 0.9,
          width: size.width * 0.5 ,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < context.watch<ProviderData>().voiceList.length; i++) VoiceContainerWidget(index: i),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text("add"),
                  onPressed: () {
                    context.read<ProviderData>().addvoice("");
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: const Text("back to home"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/// RegisterVoiceScreen widget.
class VoiceContainerWidget extends StatelessWidget {
  VoiceContainerWidget({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    var _textEditingController = new TextEditingController(
      text: context.watch<ProviderData>().voiceList[index],
    );
    _textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _textEditingController.text.length),
    );

    return Container(
      child: Row(
        children: <Widget>[
          Text("voice " + index.toString()),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              onChanged: (_newvalue) {
                context.read<ProviderData>().editvoiceList(_newvalue, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}