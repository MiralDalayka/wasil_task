import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../app/get_it/get_it.dart';
import '../blocs/products_cubit.dart';
import 'advanced_quote_tile.dart';

class AdvancedViewMode extends StatefulWidget {
  const AdvancedViewMode({super.key});

  @override
  State<AdvancedViewMode> createState() => _AdvancedViewModeState();
}

class _AdvancedViewModeState extends State<AdvancedViewMode> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = serviceLocator<ProductsCubit>();
        return ListView.separated(
          itemCount: cubit.productsWatchList.length,
          separatorBuilder: (context, index) => Gap(0),
          itemBuilder: (context, index) {
            return AdvancedQuoteTile(product: cubit.productsWatchList[index]);
          },
        );
      },
    );
  }
}
