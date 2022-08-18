import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  late PageController _pageController;
  final RxInt _currentIndex = 0.obs;
}
