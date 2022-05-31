/// import packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// import files.
import '../../../../Data/ProviderData.dart';


/// RegisterType widget.
class RegisterType extends StatelessWidget {
  const RegisterType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _value = context.watch<ProviderData>().type;

    return Container(
      child: Row(
        children: <Widget>[
          const Text("type"),
          const SizedBox(
            width: 10,
          ),
          DropdownButton(
            value: _value,
            underline: Container(
              height: 2,
              color: Colors.black12,
            ),
            items: context.watch<ProviderData>().typeList.map<DropdownMenuItem<String>>((String _value) {
              return DropdownMenuItem<String>(
                value: _value,
                child: Text(_value),
              );
            }).toList(),
            onChanged: (_newvalue) {
              if (_newvalue != null) {
                context.read<ProviderData>().type = _newvalue.toString();
              }
            }
          ),
        ],
      ),
    );
  }
}

