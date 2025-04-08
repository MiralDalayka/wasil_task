// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// class TExpansionTile extends StatefulWidget {
//   final String tileName;
//   final List<Widget> children;
//   const TExpansionTile({
//     super.key,
//     required this.tileName,
//     required this.children,
//   });

//   @override
//   State<TExpansionTile> createState() => _TExpansionTileState();
// }

// class _TExpansionTileState extends State<TExpansionTile> {
//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       controller: ExpansionTileController(),
//       title: Row(
//         children: [
//           Icon(
//             Icons.folder,
//             size: 28,
//             color: Theme.of(context).colorScheme.onSecondaryContainer,
//           ),
//           Gap(10),
//           Text("${widget.tileName}"),
//         ],
//       ),
//       dense: true,
//       trailing: SizedBox.shrink(),
//       children: widget.children,
//     );
//   }
// }
