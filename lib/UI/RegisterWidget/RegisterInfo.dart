/// import package.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scenario_editor/UI/RegisterWidget/Widgets/RegisterSE.dart';
import 'package:scenario_editor/UI/RegisterWidget/Widgets/RegisterVoice.dart';

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
import '../GetScreenSize.dart';


/// RegisterInfo widget.
class RegisterInfo extends StatelessWidget {
  const RegisterInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetScreenSize.setSize(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);

    return Container(
      height:  GetScreenSize.screenHeight() * 0.9,
      width:  GetScreenSize.screenWidth() * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          UpperButtons(),
          SizedBox(
            height:  GetScreenSize.screenHeight() * 0.05,
          ),
          Container(
            height: GetScreenSize.screenHeight() * 0.6,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RegisterEventCode(),
                  RegisterCode(),
                  RegisterType(),
                  if (context.watch<ProviderData>().type != "StatusUP") RegisterName(),
                  if (context.watch<ProviderData>().type != "StatusUP") RegisterText(),
                  RegisterBGImage(),
                  RegisterCharacterImage(),
                  RegisterBGM(),
                  const SizedBox(
                    height: 10,
                  ),
                  RegisterSE(),
                  const SizedBox(
                    height: 10,
                  ),
                  RegisterVoice(),
                  const SizedBox(
                    height: 10,
                  ),
                  if (context.watch<ProviderData>().type == "Question") RegisterOptionAndGoto(),
                ],
              ),
            ),
          ),
          SizedBox(
            height:  GetScreenSize.screenHeight() * 0.05,
          ),
          UnderButtons(),
        ],
      ),
    );
  }
}








