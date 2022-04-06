import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProviderData.dart';


class RegisterGotoAndOptionWidget extends StatelessWidget {
  const RegisterGotoAndOptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          height: 1200,
          width: 1000,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (int i = 0; i < providerData.goto.length; i++) ContainerWidget(i: i),
                  ElevatedButton(
                    child: const Text("add"),
                    onPressed: () {
                      providerData.add();
                    },
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
      ),
    );
  }
}


class ContainerWidget extends StatelessWidget {
  ContainerWidget({Key? key, required this.i}) : super(key: key);
  int i;

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);
    var _textEditingController1 = new TextEditingController(text: providerData.goto[i].toString());
    _textEditingController1.selection = TextSelection.fromPosition(
      TextPosition(offset: _textEditingController1.text.length),
    );
    var _textEditingController2 = new TextEditingController(text: providerData.option[i]);
    _textEditingController2.selection = TextSelection.fromPosition(
      TextPosition(offset: _textEditingController2.text.length),
    );

    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textEditingController1,
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              onChanged: (newvalue) {
                providerData.setGoto(newvalue.toString(), i);
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController2,
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              onChanged: (newvalue) {
                providerData.setOption(newvalue.toString(), i);
              },
            ),
          ),
        ],
      ),
    );
  }
}