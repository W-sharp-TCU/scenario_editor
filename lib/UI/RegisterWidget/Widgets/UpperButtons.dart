/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../Data/ProviderData.dart';


/// UpperButtons widget.
class UpperButtons extends StatelessWidget {
  const UpperButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);

    return Container(
      child: Row(
        children: <Widget>[
          ElevatedButton(
              child: const Text("load"),
              onPressed: () {
                /// load jsonSaveFile.
                providerData.loadFile();
              }
          ),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
            child: const Text("save"),
            onPressed: () {
              /// save jsonSaveFile.
              providerData.saveFile();
            },
          ),
        ],
      ),
    );
  }
}