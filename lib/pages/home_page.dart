import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_app/controllers/home_controller.dart';
import 'package:marketplace_app/widgets/product_shimmer.dart';
import '../dummys/dummy_products.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 16),
        title: const Text("Products", style: TextStyle(color: Colors.black)),
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(width: 40, height: 40, child: FlutterLogo()),
        ),
        actions: [
          Icon(Icons.favorite_border),
          const SizedBox(width: 12),
          Icon(Icons.notifications_active_outlined),
        ],
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
      ),

      body: Obx(() {
        if (homeC.isLoading.value) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (context, index) {
              return const ProductShimmer();
            },
          );
        }

        return GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 40 : 16,
            vertical: 18,
          ),
          itemCount: dummyProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isTablet ? 3 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.50,
          ),
          itemBuilder: (context, index) {
            final item = dummyProducts[index];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                    color: Colors.black54,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: item.image,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color:
                                item.condition == "Baru"
                                    ? Colors.green
                                    : Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item.condition ?? '',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          item.name ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_sharp, size: 16),
                            Text(
                              item.location ?? '',
                              style: TextStyle(
                                fontSize: isTablet ? 15 : 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Text(
                          homeC.formatToIDR(item.price ?? ''),
                          style: TextStyle(
                            fontSize: isTablet ? 20 : 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
