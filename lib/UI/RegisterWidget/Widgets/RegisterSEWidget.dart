/// import packages.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scenario_editor/UI/RegisterWidget/Widgets/RegisterSE.dart';

/// import files.
import '../../../Data/ProviderData.dart';


/// RegisterSEWidget widget.
class RegisterSEWidget extends StatelessWidget {
  const RegisterSEWidget({Key? key}) : super(key: key);

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
                for (int i = 0; i < context.watch<ProviderData>().selist.length; i++) ContainerWidget(index: i),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text("add"),
                  onPressed: () {
                    context.read<ProviderData>().addse("");
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



/// RegisterSEWidget widget.
class ContainerWidget extends StatelessWidget {
  ContainerWidget({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    var _textEditingController = new TextEditingController(
      text: context.watch<ProviderData>().selist[index],
    );
    _textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _textEditingController.text.length),
    );

    return Container(
      child: Row(
        children: <Widget>[
          Text("se " + index.toString()),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              onChanged: (_newvalue) {
                context.read<ProviderData>().editselist(_newvalue, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}