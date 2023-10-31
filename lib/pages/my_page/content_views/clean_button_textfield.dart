
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CleanButtonTextField extends StatefulWidget{
  const CleanButtonTextField({super.key, this.placeHolder = ""});

  final String placeHolder;

  @override
  State<CleanButtonTextField> createState() => _CleanButtonTextField();
}

class _CleanButtonTextField extends State<CleanButtonTextField> {

  var _controlTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controlTextField,
      onChanged: (text) {
        setState(() {});
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.placeHolder,
          suffixIcon: _controlTextField.text.isNotEmpty
              ? IconButton(
              onPressed: () {
                _controlTextField.clear();
                setState(() {});
              },
              icon: const Icon(
                Icons.cancel, color: Colors.grey,))
              : null),
    );
  }
}