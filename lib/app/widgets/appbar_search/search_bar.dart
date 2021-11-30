import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/widgets/appbar_search/search_field.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    this.onLeadingPress,
    this.leadingColor,
    this.controller,
    this.fieldBorder,
    this.hintText = '',
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.inputTextStyle,
    this.cursorColor,
    this.fillColor,
    this.filled = false,
    this.onChange,
    this.onClearField,
    this.showClearButton = true,
    this.showLeading = true,
    this.topSafeArea = true,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
  }) : super(key: key);

  /// Function that callback from leading press
  ///
  final VoidCallback? onLeadingPress;

  /// Color of leading arrow button
  /// the default [white]
  ///
  final Color? leadingColor;

  /// search field controller
  ///
  final TextEditingController? controller;

  /// for custom search field border with [InputBorder]
  /// * [InputBorder.non] for non border in the search field
  /// * [OutlineInputBorder] for outline all over the search field
  /// * [UnderlineInputBorder] for just underline in the search field
  ///
  final InputBorder? fieldBorder;

  /// give the hint text in the search field
  ///
  final String? hintText;

  /// give the style of hint text
  ///
  final TextStyle? hintStyle;

  /// give style of the input text of the typing [notTheHint]
  ///
  final TextStyle? inputTextStyle;

  /// give the preffix icon in front of the search field
  ///
  final Widget? prefixIcon;

  /// give the suffix icon in the back of the search field
  /// * when [showClearButton] true suffixIcon is the clear button
  /// * when [showClearButton] false suffixIcon is empty
  ///
  final Widget? suffixIcon;

  /// fill color of search field
  ///
  final Color? fillColor;

  /// cursor color for typing in search field
  /// the default is [white]
  ///
  final Color? cursorColor;

  /// is the search field is filled or not
  /// the default is [false]
  ///
  final bool? filled;

  /// fungtion with callback the value from onChange search field
  ///
  final ValueChanged<String>? onChange;

  /// clear the search filed when suffix icon not setted
  ///
  final VoidCallback? onClearField;

  /// to show the clear button or not
  /// the default [true]
  ///
  final bool showClearButton;

  /// to show the leading icon or not
  /// the default [true]
  ///
  final bool showLeading;

  /// custom content padding
  /// the default [vertical] 0 and [horizontal] 10
  ///
  final EdgeInsetsGeometry contentPadding;

  /// disable top [SafeArea]
  /// default true
  ///
  final bool topSafeArea;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  /// Returns the appropriate "back" icon for the given `platform`.
  static IconData _getIconData(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return Icons.arrow_back_ios;
    }
  }

  Widget _leadingContent({
    Color? color,
  }) {
    if (widget.showLeading) {
      return IconButton(
          onPressed: widget.onLeadingPress,
          icon: Icon(
            _getIconData(Theme.of(context).platform),
            color: color ?? Theme.of(context).appBarTheme.foregroundColor,
          ));
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: widget.topSafeArea,
      child: Row(
        children: [
          Container(
            child: _leadingContent(color: widget.leadingColor),
          ),
          Expanded(
              child: SearchField(
            bordlessField: widget.fieldBorder == InputBorder.none,
            border: widget.fieldBorder,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            inputTextStyle: widget.inputTextStyle,
            cursorColor: widget.cursorColor,
            fillCollor: widget.fillColor,
            filled: widget.filled,
            controller: widget.controller,
            onChange: widget.onChange,
            onClearField: widget.onClearField,
            showClearButton: widget.showClearButton,
            contentPadding: widget.contentPadding,
          )),
          const SizedBox(width: 20.0)
        ],
      ),
    );
  }
}
