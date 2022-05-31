/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scenario_editor/UI/RegisterWidget/Widgets/SE/RegisterSEScreen.dart';

/// import files.
import '../../../../Data/ProviderData.dart';
import '../GotoAndOption/RegisterGotoAndOptionScreen.dart';


/// RegisterSE widget.
class RegisterSE extends StatelessWidget {
  const RegisterSE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text("SE"),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          child: const Text("add"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterSEScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}

