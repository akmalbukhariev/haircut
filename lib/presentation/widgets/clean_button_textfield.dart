
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CleanButtonTextField extends StatefulWidget{
  const CleanButtonTextField({
    Key? key,
    this.controlTextField,
    this.placeHolder = "",
    this.isReadOnly = false
  }) : super(key: key);

  final bool isReadOnly;
  final String placeHolder;
  final TextEditingController? controlTextField;

  @override
  State<CleanButtonTextField> createState() => _CleanButtonTextField();
}

class _CleanButtonTextField extends State<CleanButtonTextField> {

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controlTextField ?? TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: widget.isReadOnly,
      controller: widget.controlTextField,//_controlTextField,
      onChanged: (text) {
        setState(() {});
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.placeHolder,
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
              onPressed: () {
                _controller.clear();
                setState(() {});
              },
              icon: const Icon(
                Icons.cancel, color: Colors.grey,))
              : null),
    );
  }
}