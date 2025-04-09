/*
This code is the home page; search for SECTION to find main components
 */

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/features/auth/presentation/blocs/auth_cubit.dart';

import '../../../../core/common/services/router/app_router.dart';
import '../../../product/presentation/screens/all_products_screen.dart';
import '../widgets/home_screen_body_widgets/categories/categories_header.dart';
import '../../../categories/presentation/widgets/categories_row.dart';
import '../../../product/presentation/widgets/products_view_home_screen_widgets/products_view.dart';
import '../widgets/home_screen_body_widgets/header/flash_sale_header.dart';
import '../widgets/home_screen_body_widgets/products_view_header.dart';
import '../widgets/home_screen_body_widgets/sale_ads_slider.dart';
import '../widgets/home_screen_body_widgets/search_bar.dart';
import 'home_screen.dart';

class AdvancedViewMode extends StatelessWidget {
  const AdvancedViewMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeSearchBar(),
                Gap(10),
                FlashSaleHeader(),
                Gap(10),
                SaleAdsSlider(),
                Gap(10),
                CategoryHeader(),
                CategoriesRow(),
                Gap(10),
                ProductsViewHeader(),
              ],
            ),
          ),
          FlashProductsView(),
          SliverToBoxAdapter(
            child: TextButton(
              onPressed: () {
                serviceLocator<AuthCubit>().authMode(AllProductsScreen());
              },
              child: Text("See More"),
            ),
          ),
          //space to make sure all items showed up
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(height: 50),
          ),
        ],
      ),
    );
  }
}
