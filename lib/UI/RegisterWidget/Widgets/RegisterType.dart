/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../Data/ProviderData.dart';


/// RegisterType widget.
class RegisterType extends StatelessWidget {
  const RegisterType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> typeList = ["Speech", "Question", "StatusUP"];
    final ProviderData providerData = Provider.of<ProviderData>(context);
    String? value = providerData.type;

    return Container(
      child: Row(
        children: <Widget>[
          const Text("type"),
          const SizedBox(
            width: 10,
          ),
          DropdownButton(
            value: value,
            underline: Container(
              height: 2,
              color: Colors.black12,
            ),
            items: typeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newvalue) {
              providerData.setType(newvalue.toString());
            }
          ),
        ],
      ),
    );
  }
}

