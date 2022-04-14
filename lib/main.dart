import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scenario_editor/UI/ShowScenario.dart';

import 'UI/ProviderData.dart';
import 'UI/RegisterInfo.dart';
import 'UI/ShowScenario.dart';

void main() {
  runApp(
    ScenarioEditor(),
  );
}

class ScenarioEditor extends StatelessWidget {
  ScenarioEditor({Key? key}) : super(key: key);

  final ProviderData providerData = ProviderData();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderData(),
      child: MaterialApp(
        title: "scenario_editor",
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: const TopPage(),
      ),
    );
  }
}


class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("scenario_editor"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            RegisterInfo(),
            ShowScenario(),
          ],
        ),
      ),
    );
  }
}
