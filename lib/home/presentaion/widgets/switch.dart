import 'package:flutter/material.dart';

class SwitchComplete extends StatefulWidget {
  bool isComplete;

  SwitchComplete(this.isComplete);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SwitchComplete> {

  void _toggleSwitch(bool value) {
    setState(() {
      widget.isComplete = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.isComplete,
      onChanged: _toggleSwitch,
      // Other properties like activeColor can also be set
    );
  }
}