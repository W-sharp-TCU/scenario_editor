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
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.9,
      width: size.width * 0.4,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// scenariodata's lenth scenario by for(){}.
            for (int i = 0; i < context.watch<ProviderData>().scenarioList["context"].length; i++) Scenario(codeNum: i),
          ],
        ),
      ),
    );
  }
}


