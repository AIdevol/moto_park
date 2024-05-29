import 'package:flutter/material.dart';

class TestingWidget extends StatelessWidget {
  const TestingWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkModeOn = brightness == Brightness.dark;

    return Container(
      height: 45,
      decoration: ShapeDecoration(
        color: isDarkModeOn ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: isDarkModeOn ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        // Shadows and other properties...
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
              child: iconRowText('images/menu.png', '', isDarkModeOn)),
          VerticalDivider(
            color: isDarkModeOn ? Colors.white : Colors.black,
            thickness: 1,
          ),
          iconRowText('images/sort.png', 'SORT', isDarkModeOn),
          VerticalDivider(
            color: isDarkModeOn ? Colors.white : Colors.black,
            thickness: 1,
          ),
          iconRowText('images/view.png', 'VIEW', isDarkModeOn),
          VerticalDivider(
            color: isDarkModeOn ? Colors.white : Colors.black,
            thickness: 1,
          ),
          iconRowText('images/edit.png', 'EDIT', isDarkModeOn),
          VerticalDivider(
            color: isDarkModeOn ? Colors.white : Colors.black,
            thickness: 1,
          ),
          iconRowText('images/theme.png', '', isDarkModeOn),
        ],
      ),
    );
  }

  Widget iconRowText(String image, String text, var isDarkModeOn) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              color: isDarkModeOn ? Colors.white : Colors.black,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: isDarkModeOn ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
