/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../Data/ProviderData.dart';


/// UnderButtons widget.
class UnderButtons extends StatelessWidget {
  const UnderButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);

    return Container(
      child: Row(
        children: <Widget>[
          ElevatedButton(
            child: const Text("Register"),
            onPressed: (){
              providerData.register();
            },
          ),
          const SizedBox(
            width: 50,
          ),
          ElevatedButton(
            child: const Text("Clear"),
            onPressed: (){
              providerData.clear();
            },
          ),
        ],
      ),
    );
  }
}