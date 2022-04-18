/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../Data/ProviderData.dart';
import 'RegisterGotoAndOptionWidget.dart';


/// RegisterOptionAndGoto widget.
class RegisterOptionAndGoto extends StatelessWidget {
  const RegisterOptionAndGoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);

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
                    builder: (context) => RegisterGotoAndOptionWidget()
                )
            );
          },
        ),
      ],
    );
  }
}

