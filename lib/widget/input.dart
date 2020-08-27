import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final double width;

  final double height;

  final EdgeInsets margin;

  final EdgeInsets padding;

  final String hint;

  final TextStyle hintStyle;

  final ValueChanged<String> onChanged;

  final Widget icon;

  final bool obscureText;

  const Input(
      {this.width = 230,
      this.height = 40,
      this.margin = EdgeInsets.zero,
      this.padding = EdgeInsets.zero,
      this.hint,
      this.hintStyle =
          const TextStyle(color: Colors.grey, fontSize: 14, height: 1),
      this.onChanged,
        this.obscureText,
      this.icon});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      child: Row(
        children: [
          Expanded(
              child: TextField(
            obscureText: widget.obscureText??false,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
                prefixIcon: widget.icon,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                hintText: widget.hint,
                hintStyle: widget.hintStyle),
          ))
        ],
      ),
    );
  }

  BoxDecoration _inputDecoration() => BoxDecoration(
      border: Border.all(color: Colors.grey[400], width: 1),
      borderRadius: BorderRadius.circular(2));
}
