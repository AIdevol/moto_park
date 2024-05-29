import 'package:flutter/material.dart';
import 'package:moto_park/utilities/helper_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: _mainBody(),
    );
  }

  _mainBody(){
    return ListView(
      children: [
        backAppBar(title: "Payment"),

      ],
    );
  }
}
