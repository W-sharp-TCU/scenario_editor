/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../Data/ProviderData.dart';
import 'Scenario.dart';


/// ShowScenario widget
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
                /// scenariodata's lenth scenario by for(){}.
                for (int i = 0; i < providerData.scenarioList["context"].length; i++) Scenario(codeNum: i),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


