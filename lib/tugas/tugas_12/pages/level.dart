import 'package:flutter/material.dart';

class LevelInput extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onValidNext;
  const LevelInput({
    super.key,
    required this.controller,
    required this.onValidNext,
  });

  @override
  State<LevelInput> createState() => _LevelInputState();
}

class _LevelInputState extends State<LevelInput> {
  final _formKey = GlobalKey<FormState>();

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) widget.onValidNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
