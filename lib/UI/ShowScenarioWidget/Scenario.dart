/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '/Data/ProviderData.dart';


/// Scenario widget
class Scenario extends StatelessWidget {
  Scenario({Key? key, required this.codeNum}) : super(key: key);
  /// ScenarioList index
  int codeNum = -1;

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);

    return SizedBox(
      height: 50,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("code: " + providerData.scenarioList["context"][codeNum]["code"].toString()),
              const SizedBox(
                width: 10,
              ),
              Text("type: " + providerData.scenarioList["context"][codeNum]["type"]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("name: " + providerData.scenarioList["context"][codeNum]["name"]),
              const SizedBox(
                width: 10,
              ),
              Text("text: " + providerData.scenarioList["context"][codeNum]["text"]),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text("Edit"),
                onPressed: (){
                  /// call provider's method to get scenario data.
                  providerData.getScenario(codeNum);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}