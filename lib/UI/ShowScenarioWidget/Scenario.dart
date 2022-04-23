/// import packages.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '/Data/ProviderData.dart';
import 'package:scenario_editor/Data/interface_ScenarioJson.dart';

/// Scenario widget
class Scenario extends StatelessWidget {
  Scenario({Key? key, required this.codeNum}) : super(key: key);
  /// ScenarioList index
  int codeNum = -1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("code: " + context.watch<ProviderData>().scenarioList["context"][codeNum]["code"].toString()),
              const SizedBox(
                width: 10,
              ),
              if(context.watch<ProviderData>().scenarioList["context"][codeNum]["type"] == ScenarioJsonInterface.speech)
                Text("type: Speech"),
              if(context.watch<ProviderData>().scenarioList["context"][codeNum]["type"] == ScenarioJsonInterface.question)
                Text("type: Question"),
              if(context.watch<ProviderData>().scenarioList["context"][codeNum]["type"] == ScenarioJsonInterface.statusUp)
                Text("type: StatusUP"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("name: " + context.watch<ProviderData>().scenarioList["context"][codeNum]["name"]),
              const SizedBox(
                width: 10,
              ),
              Text("text: " + context.watch<ProviderData>().scenarioList["context"][codeNum]["text"]),
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
                  context.read<ProviderData>().getScenario(codeNum);
                },
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                child: const Text("Delete"),
                onPressed: () async {
                  await showDialog<String>(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      title: const Text("Really"),
                      content: const Text("never recover, once delete it."),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text("Cancel"),
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        CupertinoDialogAction(
                          child: const Text("Ok"),
                          onPressed: () {
                            context.read<ProviderData>().delete(codeNum);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
