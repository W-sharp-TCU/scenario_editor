import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowScenario extends StatelessWidget {
  const ShowScenario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 400,
            width: 800,
            child: GridView.count(
              primary: false,
              crossAxisCount: 1,
              children: [

              ],
            ),
          )
        ],
      ),
    );
  }
}


class Scenario extends StatelessWidget {
  const Scenario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("name"),
              const SizedBox(
                width: 10,
              ),
              Text(""),
            ],
          )
        ],
      ),
    );
  }
}
