import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  SearchField({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.bordlessField = false,
    this.onClearField,
    this.cursorColor,
    this.border,
    this.hintStyle,
    this.hintText = '',
    this.filled = false,
    this.fillCollor,
    this.inputTextStyle,
    this.onChange,
    this.controller,
    this.showClearButton = true,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
  }) : super(key: key);

  /// set the suffix icon from the front
  /// * when [showClearButton] true suffixIcon is the clear button
  /// * when [showClearButton] false suffixIcon is empty
  ///
  final Widget? suffixIcon;

  /// set the prefix icon in front of the search field
  /// the default is [empty]
  ///
  final Widget? prefixIcon;

  /// if the searh field no need the board
  /// the default [false]
  ///
  final bool bordlessField;

  /// color of the cursor of text field
  /// the default [white]
  ///
  final Color? cursorColor;

  /// function for clear the search field
  ///
  final VoidCallback? onClearField;

  /// custom search field border
  ///
  final InputBorder? border;

  /// set the hint text
  /// the default ['']
  ///
  final String? hintText;

  /// set the style of the hint text
  ///
  final TextStyle? hintStyle;

  /// set the input text style
  ///
  final TextStyle? inputTextStyle;

  /// set the search field is filled or not
  /// the default [false]
  ///
  final bool? filled;

  /// set the fill color
  ///
  final Color? fillCollor;

  /// controller for the search field
  ///
  final TextEditingController? controller;

  /// fungtion from the search field onChange
  ///
  final ValueChanged<String>? onChange;

  /// show the clear button
  /// * when the suffix icon not setted
  /// * the default [true]
  ///
  final bool showClearButton;

  /// custom content padding
  /// the default [vertical] 0 and [horizontal] 10
  final EdgeInsetsGeometry contentPadding;

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  /// border style on bordless is [true]
  var _border = OutlineInputBorder(
      borderSide: BorderSide(width: 0.0, color: Colors.transparent));

  /// the clear button
  /// * when the suffix icon not setted
  /// * and the showClearButton is true
  Widget clearButton(BuildContext context) {
    if (widget.showClearButton) {
      return IconButton(
          onPressed: widget.onClearField ??
              () {
                widget.controller?.clear();
              },
          icon: Icon(
            CupertinoIcons.xmark_circle,
            color: Theme.of(context).appBarTheme.foregroundColor,
            size: 20.0,
          ));
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      cursorColor: widget.cursorColor ?? Theme.of(context).dividerColor,
      style: widget.inputTextStyle,
      controller: widget.controller,
      onChanged: widget.onChange,
      decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          suffixIcon: widget.suffixIcon ?? clearButton(context),
          prefixIcon: widget.prefixIcon,
          hintText: "${widget.hintText}...",
          hintStyle: widget.hintStyle,
          border: widget.bordlessField || widget.border == null
              ? _border
              : widget.border,
          enabledBorder: widget.bordlessField || widget.border == null
              ? _border
              : widget.border,
          focusedBorder: widget.bordlessField || widget.border == null
              ? _border
              : widget.border,
          fillColor: widget.fillCollor,
          filled: widget.filled),
    );
  }
}
