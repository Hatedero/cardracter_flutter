import 'dart:async';

import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.defaultValue,
    this.style = const TextStyle(),
    required this.onFinished,
  });

  final String defaultValue;
  final TextStyle? style;
  final void Function(String) onFinished;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _controller;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.defaultValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onFinished(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: null,
      minLines: 1,
      onSubmitted: (String value) async {},
      decoration: InputDecoration(border: OutlineInputBorder()),
      onChanged: _onChanged,
      style: widget.style,
    );
  }
}
