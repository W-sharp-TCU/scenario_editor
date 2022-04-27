/// import packages.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../Data/ProviderData.dart';


/// RegisterGotoAndOptionWidget widget.
class RegisterGotoAndOptionWidget extends StatelessWidget {
  const RegisterGotoAndOptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          height: size.height * 0.9,
          width: size.width * 0.8,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < context.watch<ProviderData>().goto.length; i++) ContainerWidget(i: i),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text("add"),
                  onPressed: () {
                    context.read<ProviderData>().addgoto(-1);
                    context.read<ProviderData>().addoption("");
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



/// RegisterGotoAndOptionWidget widget.
class ContainerWidget extends StatelessWidget {
  ContainerWidget({Key? key, required this.i}) : super(key: key);
  int i;

  @override
  Widget build(BuildContext context) {
    var _textEditingController1 = new TextEditingController(
      text: context.watch<ProviderData>().goto[i].toString(),
    );
    _textEditingController1.selection = TextSelection.fromPosition(
      TextPosition(offset: _textEditingController1.text.length),
    );
    var _textEditingController2 = new TextEditingController(
      text: context.watch<ProviderData>().option[i],
    );
    _textEditingController2.selection = TextSelection.fromPosition(
      TextPosition(offset: _textEditingController2.text.length),
    );

    return Container(
      child: Row(
        children: <Widget>[
          const Text("goto"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController1,
              keyboardType: TextInputType.number,
              maxLines: 1,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              ],
              onChanged: (_newvalue) {
                if (_newvalue != "") {
                  context.read<ProviderData>().editgoto(int.parse(_newvalue.toString()), i);
                }
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text("option"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController2,
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              onChanged: (_newvalue) {
                context.read<ProviderData>().editoption(_newvalue.toString(), i);
              },
            ),
          ),
        ],
      ),
    );
  }
}