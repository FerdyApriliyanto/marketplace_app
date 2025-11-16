import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:marketplace_app/pages/home_page.dart';

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Widget> pages = [
    HomePage(),
    Center(child: Text("Chat Page")),
    Center(child: Text("Jual Page")),
    Center(child: Text("Favorit Page")),
    Center(child: Text("Akun Page")),
  ];
}
