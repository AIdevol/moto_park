import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/pages/home/sheets/elements/ReminderAlert.dart';
import 'package:moto_park/pages/home/sheets/elements/documentVisible.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';

class DocumentAndReminder extends StatefulWidget {
  const DocumentAndReminder({Key? key});

  @override
  State<DocumentAndReminder> createState() => _DocumentAndReminderState();
}

class _DocumentAndReminderState extends State<DocumentAndReminder>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final selectedIndex = 0.obs;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.yellow,
        title: Center(
          child: Text(
            "View Document and Reminders",
            style: BalooStyles.balooboldTextStyle(
              color: Colors.black,
              size: 16,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() => _buildButton(0, "Document")),
                  Obx(() => _buildButton(1, "Reminder")),
                ],
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              color: Colors.black,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  DocumentVisible(
                    key: UniqueKey(),

                  ),
                  ReminderAlert(
                    key: UniqueKey(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int index, String text) {
    return GestureDetector(
      onTap: () {
        selectedIndex.value = index;
        _tabController.animateTo(index);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: selectedIndex.value == index ? Colors.yellow : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.7,
              blurRadius: 0.5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: BalooStyles.balooboldTextStyle(
              color: selectedIndex.value == index ? Colors.black : Colors.grey,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }
}
