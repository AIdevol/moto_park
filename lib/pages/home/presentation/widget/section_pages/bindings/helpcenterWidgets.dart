import 'package:flutter/material.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/pages/home/presentation/widget/section_pages/bindings/help_controller.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/helper_widget.dart'; // Update this import as needed

class HelpTopicWidget extends StatelessWidget {
  final HelpTopic topic;

  const HelpTopicWidget({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: topic.action,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            divider(),
            // vGap(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    topic.title,
                    style: BalooStyles.balooboldTextStyle(
                        color: blackColor, size: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                hGap(20),
                const Icon(Icons.chevron_right),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
