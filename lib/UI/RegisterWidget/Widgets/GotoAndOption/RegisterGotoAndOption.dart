/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../../Data/ProviderData.dart';
import 'RegisterGotoAndOptionScreen.dart';


/// RegisterGotoAndOption widget.
class RegisterGotoAndOption extends StatelessWidget {
  const RegisterGotoAndOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text("goto and option"),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          child: const Text("add"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterGotoAndOptionScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}

