import 'package:flutter/material.dart';

import 'order_manager.dart';
import 'order_item_card.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building orders');
    final orderManager = OrderManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderManager.orderCount,
        itemBuilder: (ctx, i) => OrderItemCard(orderManager.orders[i]),
      ),
    );
  }
}