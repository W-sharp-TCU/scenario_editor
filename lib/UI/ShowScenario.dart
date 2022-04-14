import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'ProviderData.dart';


class ShowScenario extends StatelessWidget {
  const ShowScenario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);

    return Container(
      child: Column(
        children: [
          Container(
            height: 800,
            width: 800,
            child: GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 4,
              children: [
                for (int i = 0; i < providerData.scenarioList["context"].length; i++) Scenario(codeNum: i),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class Scenario extends StatelessWidget {
  Scenario({Key? key, required this.codeNum}) : super(key: key);
  int codeNum = -1;

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);

    return SizedBox(
      height: 50,
      child: Column(
        children: <Widget>[
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
