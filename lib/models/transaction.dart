import 'package:hive_flutter/adapters.dart';

part 'transaction.g.dart';

// flutter packages pub run build_runner build // generate adapter
@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late DateTime createdData;
  @HiveField(2)
  late bool isExpense = true;
  @HiveField(3)
  late double amount;
}
