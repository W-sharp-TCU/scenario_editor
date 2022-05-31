/// import packages.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '/Data/ProviderData.dart';
import 'package:scenario_editor/Data/Interface/interface_ScenarioJson.dart';
import '../GetScreenSize.dart';

/// Scenario widget
class Scenario extends StatelessWidget {
  Scenario({Key? key, required this.codeNum}) : super(key: key);
  /// ScenarioList index
  int codeNum = -1;

  @override
  Widget build(BuildContext context) {
    GetScreenSize.setSize(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);

    return Container(
      height: GetScreenSize.screenHeight() * 0.2,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Text(
              "code: " + context.watch<ProviderData>().scenarioList["context"][codeNum]["code"].toString(),
            ),
          ),
          if (context.watch<ProviderData>().scenarioList["context"][codeNum]["type"] == ScenarioJsonInterface.speech)
            Expanded(
              child: Text("type: Speech"),
            ),
          if (context.watch<ProviderData>().scenarioList["context"][codeNum]["type"] == ScenarioJsonInterface.question)
            Expanded(
                child: Text("type: Question"),
            ),
          if (context.watch<ProviderData>().scenarioList["context"][codeNum]["type"] == ScenarioJsonInterface.statusUp)
            Expanded(
                child: Text("type: StatusUP"),
            ),
          if (context.watch<ProviderData>().scenarioList["context"][codeNum]["type"] == ScenarioJsonInterface.speech)
            Expanded(
              child: Text("name: " + context.watch<ProviderData>().scenarioList["context"][codeNum]["name"]),
            ),
          Expanded(
            child:
              Text(
                "text: " + context.watch<ProviderData>().scenarioList["context"][codeNum]["text"],
                maxLines: 1,
              ),
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
