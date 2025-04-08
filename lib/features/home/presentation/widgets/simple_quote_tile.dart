// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:tradervolt/app/get_it/get_it.dart';
// import 'package:tradervolt/core/common/widgets/components/symbol_price.dart';
// import 'package:tradervolt/features/symbols/domain/entities/symbol_entity.dart';
// import 'package:tradervolt/features/symbols/presentation/blocs/symbols_cubit.dart';

// class SimpleQuoteTile extends StatefulWidget {
//   final SymbolEntity symbol;
//   final bool? hasOpenTrade;
//   final VoidCallback? onTap;
//   const SimpleQuoteTile({
//     super.key,
//     this.hasOpenTrade = false,
//     this.onTap,
//     required this.symbol,
//   });

//   @override
//   State<SimpleQuoteTile> createState() => _SimpleQuoteTileState();
// }

// class _SimpleQuoteTileState extends State<SimpleQuoteTile> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         InkWell(
//           onTap: widget.onTap ?? () {},
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   "${widget.symbol.name}",
//                   style: TextTheme.of(context).bodyLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                 ),
//                 Row(
//                   children: [
//                     SymbolPrice(
//                       price: "${widget.symbol.bid}",
//                       priceState: widget.symbol.symbolBidPriceState,
//                       digits: widget.symbol.digits ?? 2,
//                     ),
//                     Gap(14),
//                     SymbolPrice(
//                       price: "${widget.symbol.ask}",
//                       priceState: widget.symbol.symbolAskPriceState,
//                       digits: widget.symbol.digits ?? 2,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (widget.hasOpenTrade == true)
//           Positioned.directional(
//             textDirection: TextDirection.ltr,
//             top: -12,
//             start: -12,
//             child: Transform.rotate(
//               angle: pi / 4,
//               child: Container(
//                 width: 20,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: serviceLocator<SymbolsCubit>()
//                           .isProfitting(symbol: widget.symbol)
//                       ? Theme.of(context).colorScheme.primary
//                       : Theme.of(context).colorScheme.error,
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
