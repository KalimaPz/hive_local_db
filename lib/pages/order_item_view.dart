import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_local_db/models/order_item.dart';

class OrderItemsView extends StatefulWidget {
  static String routeName = "/home/draft_list";
  OrderItemsView({Key? key}) : super(key: key);

  @override
  _OrderItemsViewState createState() => _OrderItemsViewState();
}

class _OrderItemsViewState extends State<OrderItemsView> {
  List<OrderItem> orderItems = [];
  initialAction() async {
    final Box box = Hive.box<OrderItem>('order_items');
    final List<OrderItem> list = [];
    final data = box.values.toList();

    data.forEach((element) {
      list.add(element);
    });

    orderItems = list;
  }

  @override
  void initState() {
    initialAction();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  addOrderItem() async {
    final OrderItem orderItem = OrderItem(
      orderDateTime: DateTime.now().toString(),
      orderLines: [
        OrderLines(
          productQuantity: 1,
          productTotalWeight: 23,
          productWeight: 1,
        )
      ],
      orderPartnerId: "11",
      orderRiderId: "22",
      orderType: "33",
    );

    final Box box = Hive.box<OrderItem>('order_items');
    await box.add(orderItem);
  }

  Container orderTile(
      {String? partner_id,
      String? rider_id,
      String? order_type,
      List<OrderLines>? orderLines,
      String? dateTime}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Text("Partner Id: $partner_id"),
          Text("Rider Id: $rider_id"),
          Text("Date: $dateTime"),
          orderLines!.length > 0
              ? Container(
                  color: Colors.blue[50],
                  child: ListView.builder(
                    itemCount: orderLines.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        Text(orderLines[index].toString()),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Items List"),
      ),
      body: SafeArea(
        child: ListView(
          primary: true,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            orderItems.length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: orderItems.length,
                    itemBuilder: (context, index) {
                      return orderTile(
                          dateTime: orderItems[index].orderDateTime,
                          orderLines: orderItems[index].orderLines,
                          order_type: orderItems[index].orderType,
                          partner_id: orderItems[index].orderPartnerId,
                          rider_id: orderItems[index].orderRiderId);
                    },
                  )
                : Container(),
            ElevatedButton(
                onPressed: () async => addOrderItem(),
                child: Text("Add Order Test")),
          ],
        ),
      ),
    );
  }
}
