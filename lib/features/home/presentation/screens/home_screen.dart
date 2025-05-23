import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:gap/gap.dart';

import '../../../../app/get_it/get_it.dart';
import '../../../../core/common/widgets/sections/drawer/drawer.dart';
import '../../../../core/common/widgets/sections/loading_body.dart';
import '../../../cart/presentation/screens/widgets/cart_icon_widget.dart';
import '../../../product/presentation/blocs/products_cubit.dart';
import 'advancedViewMode.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = serviceLocator<ProductsCubit>();
        return Scaffold(
          extendBody: true,
          drawer: TDrawer(),
          appBar: AppBar(
            leadingWidth: 26,
            title: Text(
              "Wasil",
              style: TextTheme.of(
                context,
              ).titleLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
            actions: [CartIconWidget()],
          ),
          body: Conditional.single(
            context: context,
            fallbackBuilder: (context) => LoadingBody(),
            conditionBuilder: (context) => cubit.finishLoading,
            widgetBuilder: (context) {
              if (state is ProductsError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Something went wrong",
                        style: TextTheme.of(context).titleSmall,
                      ),
                    ),
                  ],
                );
              }
              if (cubit.productsWatchList.isEmpty) {
                return Text("NO DATA");
              }
              if (state is ProductsLoading) {
                return LoadingBody();
              }
              return AdvancedViewMode();
              // : SimpleViewMode();
            },
          ), // body: NoTradingAccountBody(),
        );
      },
    );
  }
}
