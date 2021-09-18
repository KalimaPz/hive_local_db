import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_local_db/models/order_item.dart';
import 'package:hive_local_db/models/transaction.dart';
import 'package:hive_local_db/pages/order_item_view.dart';
import 'package:hive_local_db/pages/transaction_view.dart';

import 'models/order_item.dart';
import 'pages/setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(OrderItemAdapter());
  Hive.registerAdapter(OrderLinesAdapter());

  await Hive.openBox<Transaction>("transactions");
  await Hive.openBox<OrderItem>("order_items");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        TransactionView.routeName: (context) => TransactionView(),
        OrderItemsView.routeName: (context) => OrderItemsView(),
        Setting.routeName: (context) => Setting(),
      },
      initialRoute: "/",
      home: TransactionView(),
    );
  }
}
