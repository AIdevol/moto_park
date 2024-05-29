import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.description_outlined),
        backgroundColor: appColor,
        title: Text(
          'Disclaimer',
          style: BalooStyles.baloomediumTextStyle(size: 18, color: blackColor),
        ),
      ),
      body: Stack(children: <Widget>[
        FutureBuilder<String>(
          future: rootBundle.loadString('assets/disclaimer.md'),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: MarkdownBody(
                    data: snapshot.data ??
                        'Failed to load terms and conditions.'),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: _buildOkayButton(context),
        ),
      ]),
    );
  }

  Widget _buildOkayButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: appColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Text(
          'Okay',
          style: BalooStyles.balooboldTextStyle(size: 18, color: blackColor),
        ),
      ),
    );
  }
}
