// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:tradervolt/app/get_it/get_it.dart';
// import 'package:tradervolt/features/symbols/presentation/blocs/symbols_cubit.dart';
// import 'package:tradervolt/features/symbols/presentation/widgets/quote_sheet.dart';
// import 'package:tradervolt/features/symbols/presentation/widgets/simple_quote_tile.dart';

// class SimpleViewMode extends StatefulWidget {
//   const SimpleViewMode({super.key});

//   @override
//   State<SimpleViewMode> createState() => _SimpleViewModeState();
// }

// class _SimpleViewModeState extends State<SimpleViewMode> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SymbolsCubit, SymbolsStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         final cubit = serviceLocator<SymbolsCubit>();
//         return ListView(
//           children: [
//             Padding(
//               padding: const EdgeInsetsDirectional.only(
//                 start: 14.0,
//                 end: 20.0,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Symbol"),
//                   Row(
//                     children: [
//                       Text("Bid"),
//                       Gap(65),
//                       Text("Ask"),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             ListView.separated(
//               shrinkWrap: true,
//               itemCount: cubit.symbolsWatchList.length,
//               separatorBuilder: (context, index) => Gap(4),
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return SimpleQuoteTile(
//                   symbol: cubit.symbolsWatchList[index],
//                   hasOpenTrade: cubit.hasTrade(
//                     symbol: cubit.symbolsWatchList[index],
//                   ),
//                   onTap: () {
//                     cubit.updateSelectedSymbol(cubit.symbolsWatchList[index]);
//                     showModalBottomSheet(
//                       context: context,
//                       isDismissible: true,
//                       useRootNavigator: false,
//                       backgroundColor:
//                           Theme.of(context).scaffoldBackgroundColor,
//                       enableDrag: true,
//                       showDragHandle: true,
//                       shape: RoundedRectangleBorder(),
//                       builder: (context) => SymbolSheet(),
//                     );
//                   },
//                 );
//               },
//             )
//           ],
//         );
//       },
//     );
//   }
// }
