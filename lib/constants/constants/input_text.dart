import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final String errorText;
  final bool showError;
  final bool obscureText;
  final TextInputType inputType;
  final TextEditingController controller;
  final Function(String) onChanged;
  final int maxLines;
  final bool? isFocused;
  final Color? backgroundColor;
  final bool hasLabel;
  final Widget? icon;
  final bool hasBorder;
  final Widget? iconAtFirst;
  final String labelText;

  InputTextField({
    required this.onChanged,
    required this.hintText,
    this.errorText = '',
    this.showError = false,
    this.obscureText = false,
    this.isFocused = false,
    this.hasLabel = true,
    this.hasBorder = true,
    this.maxLines = 1,
    this.labelText = '',
    this.icon,
    this.iconAtFirst,
    this.backgroundColor = const Color(0xff141313),
    required this.controller,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          hasLabel
              ? Text(
                labelText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              )
              : Container(),
          Container(
            width: width * 0.80,
            height: height * 0.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              border: hasBorder
                  ? Border.all(color: Colors.blue, width: 2.5)
                  : null,
            ),
            child: Row(
              children: [
                icon != null
                    ? Align(alignment: Alignment.centerRight, child: icon!)
                    : Container(),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.end,
                    maxLines: maxLines,
                    controller: controller,
                    keyboardType: inputType,
                    obscureText: obscureText,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (str) {},
                    onChanged: onChanged,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.withOpacity(0.6),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: showError,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                errorText,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}