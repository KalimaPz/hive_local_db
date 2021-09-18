import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_local_db/models/transaction.dart';
import 'package:hive_local_db/pages/transaction_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>("transactions");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransactionView(),
    );
  }
}
