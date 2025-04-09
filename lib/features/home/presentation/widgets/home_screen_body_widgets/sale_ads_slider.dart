/*
SaleAdsSlider: slider to show the ads and sale
widget that has button to click on
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/core/common/widgets/sections/soon_page.dart';

import '../../../../auth/presentation/blocs/auth_cubit.dart';

class SaleAdsSlider extends StatefulWidget {
  const SaleAdsSlider({super.key});

  @override
  State<SaleAdsSlider> createState() => _SaleAdsSliderState();
}

class _SaleAdsSliderState extends State<SaleAdsSlider> {
  int _currentPage = 0;

  late Timer _timer;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //todo should be replaced

    final List<String> salesImages = [
      'https://th.bing.com/th/id/R.b68aefd87053f57b18a06ff06a013ab6?rik=DInQsRngtu8yuQ&pid=ImgRaw&r=0',
      'https://th.bing.com/th/id/OIP.0wOwtx3MH4Aalsb3FTXpugHaD4?rs=1&pid=ImgDetMain',

      'https://media.istockphoto.com/id/1163637877/vector/perfume-ads-with-paper-flowers.jpg?s=612x612&w=0&k=20&c=EWgGPkvjNePF5JvRSywRKmGIUYgPBloV3AqNyZXrHdk=',
    ];
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: salesImages.length,
        itemBuilder: (context, index) {
          final imgUrl = salesImages[index];
          return GestureDetector(
            onTap: () => serviceLocator<AuthCubit>().authMode(SoonPage()),
            child: Image.network(imgUrl, fit: BoxFit.cover),
          );
        },
        pageSnapping: true,
      ),
    );
  }
}
