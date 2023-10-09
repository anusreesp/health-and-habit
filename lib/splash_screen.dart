import 'package:animate_you/authenticate/presentation/screens/login.dart';
import 'package:animate_you/features/home_page.dart';
import 'package:animate_you/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/splashscreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

Duration transitionDuration = Duration(seconds: 2);
bool expanded = false;
double _bigFontSize = 150;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1))
        .then((value) => setState(() => expanded = true))
        .then((value) => Duration(seconds: 3))
        .then(
          (value) => Future.delayed(Duration(seconds: 5)).then(
            (value) => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false),
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal, width: 6),
            color: AppTheme.blackColor,
            shape: BoxShape.circle,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: transitionDuration, //a duration
                curve: Curves.fastOutSlowIn,
                style: TextStyle(
                  color: Color(
                      0xFFffffff), // our color from above, prefixed with 0xFF
                  fontSize: !expanded
                      ? _bigFontSize
                      : 110, // change font size depending on expanded state

                  fontWeight: FontWeight.w500, //
                ),
                child: const Text(
                  "H",
                ),
              ),
              // SizedBox(
              //   width: 12,
              // ),
              AnimatedCrossFade(
                firstCurve: Curves.fastOutSlowIn, // the same curve as above
                crossFadeState: !expanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: transitionDuration, // the same duration as above
                firstChild: Container(), // an empty container

                secondChild: remainderPart(),
                alignment: Alignment
                    .centerLeft, // "reveal" the logo from the center left
                sizeCurve: Curves.easeInOut,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget remainderPart() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'ealth',
          style: TextStyle(
            color: Color(0xFFffffff),
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        Center(
          child: Text(
            '&',
            style: TextStyle(
              color: Color(0xFFffffff),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          'abit',
          style: TextStyle(
            color: Color(0xFFffffff),
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
