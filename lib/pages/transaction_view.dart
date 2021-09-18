import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_local_db/models/transaction.dart';
import 'package:hive_local_db/pages/order_item_view.dart';
import 'package:hive_local_db/pages/setting.dart';

class TransactionView extends StatefulWidget {
  static String routeName = "/home/transaction";
  TransactionView({Key? key}) : super(key: key);

  @override
  _TransactionViewState createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  List<Transaction> transactions = [];

  initialAction() async {
    final box = Hive.box<Transaction>('transactions');
    final res = box.values;
    setState(() {
      transactions = res.toList();
    });
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initialAction();
  }

  addTransaction(String name, double amount, bool isExpense) {
    final transaction = Transaction()
      ..name = name
      ..createdData = DateTime.now()
      ..amount = amount
      ..isExpense = isExpense;
    final box = Hive.box<Transaction>('transactions');
    box.add(transaction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, OrderItemsView.routeName),
              icon: Icon(Icons.list)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, Setting.routeName),
              icon: Icon(Icons.settings)),
        ],
        elevation: 0,
        backgroundColor: Colors.black87,
        title: Text("HIVE"),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                ),
                TextField(
                  controller: _amountController,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await addTransaction(_nameController.text.trim(),
                          double.parse(_amountController.text.trim()), true);
                      initialAction();
                    },
                    child: Text("Add Transaction")),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3), offset: Offset(2, 1)),
              ]),
              child: Column(
                children: [
                  Text(transactions[index].name),
                  Text(transactions[index].amount.toString()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
