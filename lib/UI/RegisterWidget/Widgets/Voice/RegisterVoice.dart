/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../../Data/ProviderData.dart';
import 'package:scenario_editor/UI/RegisterWidget/Widgets/Voice/RegisterVoiceScreen.dart';


/// RegisterVoice widget.
class RegisterVoice extends StatelessWidget {
  const RegisterVoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text("Voice"),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          child: const Text("add"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterVoiceScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}

