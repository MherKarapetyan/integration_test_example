import 'package:flutter/material.dart';
import 'package:integration_test_example/presentation/widgets/textfields/textfield_styles.dart';

class AppTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String Function(String) validator;
  final String hintText;
  final TextFieldStyles _styles = TextFieldStyles();

  AppTextField({
    Key key,
    this.onChanged,
    this.validator,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _styles.textfieldPadding,
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Theme.of(context).secondaryHeaderColor,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
