import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/helper_widget.dart';

class ReminderAlert extends StatefulWidget {
  const ReminderAlert({Key? key}) : super(key: key);

  @override
  State<ReminderAlert> createState() => _ReminderAlertState();
}

class _ReminderAlertState extends State<ReminderAlert> {
  bool _expanded1 = false;
  bool _expanded2 = false;
  bool _expanded3 = false;
  bool _showMessage1 = false;
  bool _showMessage2 = false;
  bool _showMessage3 = false;

  // Expiration date for each subscription
  final DateTime _expirationDate1 = DateTime.now().add(const Duration(days: 5));
  final DateTime _expirationDate2 = DateTime.now().add(const Duration(days: 7));
  final DateTime _expirationDate3 =
      DateTime.now().add(const Duration(days: 10));

  // Function to reset all reminders
  void _resetReminders() {
    setState(() {
      _expanded1 = false;
      _expanded2 = false;
      _expanded3 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Insurance",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                vGap(20),
                _buildExpandableContainer(
                  title: "PB56AB1234",
                  subtitle: "Bently Bentlgya",
                  message:
                      "Your subscription will be expired with in ${_calculateDaysLeft(_expirationDate1)} days",
                  expanded: _expanded1,
                  showMessage: _showMessage1,
                  onPressed: () {
                    setState(() {
                      _expanded1 = !_expanded1;
                      _showMessage1 = !_showMessage1;
                    });
                  },
                ),
                vGap(20),
                const Text(
                  "Emission",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                vGap(20),
                _buildExpandableContainer(
                  title: "PB56AB1234",
                  subtitle: "Bently Bentlgya",
                  message:
                      "Your subscription will be expired with in ${_calculateDaysLeft(_expirationDate2)} days",
                  expanded: _expanded2,
                  showMessage: _showMessage2,
                  onPressed: () {
                    setState(() {
                      _expanded2 = !_expanded2;
                      _showMessage2 = !_showMessage2;
                    });
                  },
                ),
                vGap(20),
                const Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                vGap(20),
                _buildExpandableContainer(
                  title: "PB56AB1234",
                  subtitle: "Bently Bentlgya",
                  message:
                      "Your subscription will be expired with in ${_calculateDaysLeft(_expirationDate3)} days",
                  expanded: _expanded3,
                  showMessage: _showMessage3,
                  onPressed: () {
                    setState(() {
                      _expanded3 = !_expanded3;
                      _showMessage3 = !_showMessage3;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to calculate the days left until the expiration date
  int _calculateDaysLeft(DateTime expirationDate) {
    return expirationDate.difference(DateTime.now()).inDays;
  }

  Widget _buildExpandableContainer({
    required String title,
    required String subtitle,
    required String message,
    required bool expanded,
    required bool showMessage,
    required VoidCallback onPressed,
  }) {
    // Extracting the number of days left from the message
    String daysLeftText = message.split(' ')[5];

    // Parsing the number of days left from the extracted text
    int daysLeft = int.tryParse(daysLeftText) ?? 4;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: expanded ? 200 : 100,
        width: 360,
        decoration: BoxDecoration(
          color: Colors.yellow[50],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.7,
              blurRadius: 0.5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ListView(
                        children: [
                          Text(
                            title,
                            style: BalooStyles.balooboldTextStyle(
                                color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                          vGap(5),
                          Text(
                            subtitle,
                            style: BalooStyles.balooboldTextStyle(
                                color: Colors.grey),
                            textAlign: TextAlign.start,
                          ),
                          vGap(30),
                          Text(
                            message,
                            style: BalooStyles.balooboldTextStyle(
                                color: Colors.black87),
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Visibility(
                    visible: expanded,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: _resetReminders,
                          child: Row(
                            children: [
                              Text(
                                'cancel',
                                style: BalooStyles.baloomediumTextStyle(
                                    color: Colors.black87),
                              ),
                              hGap(5),
                              const Icon(
                                Icons.cancel,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/subscriptionScreen');
                          },
                          child: Row(
                            children: [
                              Text(
                                'Reset',
                                style: BalooStyles.baloomediumTextStyle(
                                    color: Colors.black87),
                              ),
                              hGap(5),
                              const Icon(
                                Icons.restore,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Visibility(
                    visible: expanded,
                    child: IconButton(
                      icon: Icon(
                        expanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      ),
                      onPressed: onPressed,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 18.0,
              right: 8.0,
              child: Text(
                'Expire in $daysLeft days',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
