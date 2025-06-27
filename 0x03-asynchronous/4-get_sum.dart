import 'dart:convert';
import '4-util.dart';

Future<int> calculateTotal() async {
  try {
    final userData = await fetchUserData();
    final user = jsonDecode(userData);
    final userId = user['id'];
    
    final ordersData = await fetchUserOrders(userId);
    final orders = jsonDecode(ordersData);
    
    double total = 0;
    for (String product in orders) {
      final priceData = await fetchProductPrice(product);
      final price = jsonDecode(priceData);
      total += price;
    }
    
    return total.toInt();
  } catch (e) {
    return -1;
  }
}