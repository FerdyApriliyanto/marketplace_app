import 'package:get/get.dart';
import '../dummys/dummy_products.dart';
import '../models/product.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    await Future.delayed(Duration(seconds: 2));
    products.value = dummyProducts;
    isLoading.value = false;
  }

  String formatToIDR(String harga) {
    final intHarga = int.tryParse(harga) ?? 0;

    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return formatter.format(intHarga);
  }
}
