/*
SaleAdsSlider: slider to show the ads and sale
widget that has button to click on
 */

import 'dart:async';

import 'package:flutter/material.dart';

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

    final List<String> imgList = [
      'https://imageplaceholder.net/600x400/eeeeee/131313?text=Sales1',
      'https://imageplaceholder.net/600x400/eeeeee/131313?text=Sales2',
      'https://imageplaceholder.net/600x400/eeeeee/131313?text=Sales3',
    ];

    return SizedBox(
      height: 150,
      child: PageView.builder(
        controller: _pageController,
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          final imgUrl = imgList[index];
          //todo: replace it with card that has button
          return Image.network(imgUrl, fit: BoxFit.cover);
        },
        pageSnapping: true,
      ),
    );
  }
}
