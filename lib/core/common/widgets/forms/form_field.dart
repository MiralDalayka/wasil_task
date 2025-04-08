import 'package:flutter/material.dart';

class TFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool? enabled;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  const TFormField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText = "",
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.enabled = true,
  });

  @override
  State<TFormField> createState() => _TFormFieldState();
}

class _TFormFieldState extends State<TFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      style: TextTheme.of(context).bodySmall?.copyWith(
            fontSize: 12.4,
          ),
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        label: Text(
          widget.label,
          style: TextTheme.of(context).titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.normal,
              ),
        ),
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextTheme.of(context).labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
        contentPadding: EdgeInsets.only(left: 6, right: 6, bottom: 10, top: 0),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(4, 20),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(4, 20),
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(4, 20),
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(4, 20),
          ),
        ),
      ),
    );
  }
}
