import 'package:flutter/material.dart';

class TDropDownTile extends StatefulWidget {
  final String title;
  final String value;
  final List<String> items;
  final String? extraText;
  final void Function(String?)? onChanged;
  const TDropDownTile({
    required this.title,
    required this.items,
    required this.value,
    super.key,
    this.onChanged,
    this.extraText,
  });

  @override
  State<TDropDownTile> createState() => T_DropDownTileState();
}

class T_DropDownTileState extends State<TDropDownTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${widget.title} ",
                style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              TextSpan(
                text: widget.extraText,
                style: TextTheme.of(context).bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        DropdownButton<String>(
          value: widget.value,
          items: widget.items
              .map((String item) => DropdownMenuItem<String>(
                    alignment: AlignmentDirectional.centerEnd,
                    value: item,
                    child: Text(
                      item,
                      style: TextTheme.of(context).bodyMedium,
                    ),
                  ))
              .toList(),
          selectedItemBuilder: (context) => [
            for (final item in widget.items)
              Text(
                widget.value,
                style: TextTheme.of(context).bodyMedium,
              )
          ],
          menuWidth: MediaQuery.of(context).size.width / 1.1,
          onChanged: widget.onChanged,
          padding: EdgeInsets.all(0),
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          underline: SizedBox.shrink(),
          alignment: AlignmentDirectional.center,
          isDense: true,
          isExpanded: false,
          dropdownColor: Theme.of(context).colorScheme.secondaryContainer,
          iconEnabledColor: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ],
    );
  }
}
