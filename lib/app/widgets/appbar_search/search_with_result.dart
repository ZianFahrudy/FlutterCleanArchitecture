import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/widgets/appbar_search/search_bar.dart';

class SearchWithResult extends StatefulWidget {
  const SearchWithResult({
    Key? key,
    this.onLeadingPress,
    this.resultList,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 10.0),
    this.controller,
    this.cursorColor,
    this.fieldBorder,
    this.fillColor,
    this.filled = false,
    this.hintStyle,
    this.hintText = '',
    this.inputTextStyle,
    this.leadingColor,
    this.onChange,
    this.onClearField,
    this.prefixIcon,
    this.showClearButton = true,
    this.showLeading = true,
    this.suffixIcon,
    this.backdropColors = Colors.transparent,
  }) : super(key: key);

  final Widget? resultList;

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

  /// background result color
  ///
  final Color backdropColors;

  @override
  _SearchWithResultState createState() => _SearchWithResultState();
}

class _SearchWithResultState extends State<SearchWithResult> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SearchBar(
          onLeadingPress: widget.onLeadingPress,
          leadingColor: widget.leadingColor,
          controller: widget.controller,
          fieldBorder: widget.fieldBorder,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          inputTextStyle: widget.inputTextStyle,
          cursorColor: widget.cursorColor,
          fillColor: widget.fillColor,
          filled: widget.filled,
          onChange: widget.onChange,
          onClearField: widget.onClearField,
          showClearButton: widget.showClearButton,
          showLeading: widget.showLeading,
          contentPadding: widget.contentPadding,
        ),
        Divider(height: 0, thickness: 0),
        Container(
          height: size.height - AppBar().preferredSize.height,
          color: widget.backdropColors,
          child: widget.resultList ?? const SizedBox(),
        )
      ],
    );
  }
}
