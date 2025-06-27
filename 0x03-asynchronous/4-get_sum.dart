import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    final userData = await fetchUserData();
    final user = jsonDecode(userData);
    final userId = user['id'];
    
    final ordersData = await fetchUserOrders(userId);
    if (ordersData == null || ordersData.isEmpty) {
      return -1;
    }
    final orders = jsonDecode(ordersData);
    
    double total = 0;
    for (String product in orders) {
      final priceData = await fetchProductPrice(product);
      if (priceData == null || priceData.isEmpty) {
        return -1;
      }
      final price = jsonDecode(priceData);
      total += (price as num).toDouble();
    }
    
    return total;
  } catch (e) {
    return -1;
  }
}