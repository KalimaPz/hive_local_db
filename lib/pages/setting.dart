import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  static String routeName = 'home/setting';
  const Setting({Key? key}) : super(key: key);
  InkWell settingMenuPanel({String? label, required VoidCallback callback}) {
    return InkWell(
      splashColor: Colors.red,

      onTap: callback,
      // behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 3, color: Colors.grey[350]!))),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [Expanded(child: Text(label!)), Icon(Icons.chevron_right)],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> settingMenu = [
      settingMenuPanel(
          label: "Menu 1",
          callback: () {
            print("1111");
          }),
      settingMenuPanel(label: "Menu 2", callback: () {}),
      settingMenuPanel(label: "Menu 3", callback: () {}),
      settingMenuPanel(label: "Menu 4", callback: () {}),
      settingMenuPanel(label: "Menu 5", callback: () {}),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        backgroundColor: Colors.black54,
      ),
      body: SafeArea(
        child: settingMenu.length > 0
            ? ListView.builder(
                itemCount: settingMenu.length,
                itemBuilder: (context, index) => settingMenu[index],
              )
            : Center(
                child: Text("No Items"),
              ),
      ),
    );
  }
}
