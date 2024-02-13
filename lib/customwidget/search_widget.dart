
import 'package:desktop_app1/utils/color.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  const SearchWidget({
    super.key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 42,
      // width: 400,
      margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        // border: Border.all(color: AppColor.colorprimary),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          // contentPadding: ,
          prefixIcon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus();
                  },
                )
              : null,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
