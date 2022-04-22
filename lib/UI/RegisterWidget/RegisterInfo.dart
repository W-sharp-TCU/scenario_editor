/// import package.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../Data/ProviderData.dart';
import 'Widgets/UpperButtons.dart';
import 'Widgets/RegisterEventCode.dart';
import 'Widgets/RegisterCode.dart';
import 'Widgets/RegisterType.dart';
import 'Widgets/RegisterName.dart';
import 'Widgets/RegisterText.dart';
import 'Widgets/RegisterBGImage.dart';
import 'Widgets/RegisterCharacterImage.dart';
import 'Widgets/RegisterBGM.dart';
import 'Widgets/RegisterOptionAndGoto.dart';
import 'Widgets/UnderButtons.dart';


/// RegisterInfo widget.
class RegisterInfo extends StatelessWidget {
  const RegisterInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderData providerData = Provider.of<ProviderData>(context);
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.9,
      width: size.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          UpperButtons(),
          SizedBox(
            height: size.height * 0.05,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RegisterEventCode(),
                RegisterCode(),
                /*
                RegisterType(),
                if (providerData.type == "Speech") RegisterName(),
                if (providerData.type == "Speech") RegisterText(),
                RegisterBGImage(),
                RegisterCharacterImage(),
                RegisterBGM(),
                const SizedBox(
                  height: 10,
                ),
                RegisterOptionAndGoto(),
                */
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          UnderButtons(),
        ],
      ),
    );
  }
}








