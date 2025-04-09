/*
This code is the home page; search for SECTION to find main components
 */

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../home_screen_body_widgets/categories/categories_header.dart';
import '../home_screen_body_widgets/categories/categories_list_view.dart';
import '../home_screen_body_widgets/flash_sale/flash_products/flash_products_view.dart';
import '../home_screen_body_widgets/flash_sale/header/flash_sale_header.dart';
import '../home_screen_body_widgets/flash_sale/sales_category.dart';
import '../home_screen_body_widgets/header.dart';
import '../home_screen_body_widgets/sale_ads_slider.dart';
import '../home_screen_body_widgets/search_bar.dart';

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
                //Header SECTION that shows user's location and notification
                HomeTitle(),
                HomeHeader(),
                Gap(10),
                //Search Bar SECTION with filters
                HomeSearchBar(),
                Gap(20),
                //Sales and ads slider SECTION
                SaleAdsSlider(),
                Gap(10),
                //Categories SECTION: shows the title and a list of all categories
                CategoryHeader(),
                CategoryListView(),
                Gap(20),
                //Flash Sale SECTION : shows the sale on categorized products
                FlashSaleHeader(),
                //left time on the current sale
                Gap(20),
                SaleCategoryListView(),
                // products that have sale on category
                Gap(20),
              ],
            ),
          ),
          //all products based on selected category on sale
          FlashProductsView(),

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
