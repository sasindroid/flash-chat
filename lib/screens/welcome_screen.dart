import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo_tag',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 34.0,
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                color: Colors.lightBlueAccent,
                label: 'Log In',
                onPress: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                color: Colors.blueAccent,
                label: 'Register',
                onPress: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
