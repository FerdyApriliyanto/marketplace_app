import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_app/controllers/navigation_controller.dart';

class NavigationPage extends StatelessWidget {
  final navC = Get.put(NavigationController());

  NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: navC.pages[navC.currentIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black38)],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: navC.currentIndex.value,
            onTap: (i) => navC.currentIndex.value = i,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey[500],
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_rounded),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_rounded),
                label: "Jual",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded),
                label: "Favorit",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: "Akun",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
