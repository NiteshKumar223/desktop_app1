import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key, 
    required this.textController, 
    this.width, this.keyboardType
  });
  final TextEditingController textController;
  final double? width;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.0,
      width: width,
      child: TextFormField(
        controller: textController,
        maxLines: 1,
        keyboardType: keyboardType,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        textAlignVertical: TextAlignVertical.top,
      ),
    );
  }
}