import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_app/pages/navigation_page.dart';
import 'controllers/auth_controller.dart';
import 'pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());

    return GetMaterialApp(
      title: 'Marketplace App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(
          name: '/home',
          page: () => NavigationPage(),
          transition: Transition.rightToLeft,
          transitionDuration: Duration(milliseconds: 500),
        ),
      ],
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
