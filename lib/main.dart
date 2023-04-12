import 'package:flutter/material.dart';
// import 'package:frs/normalMode.dart';
import 'package:frs/ffMode.dart';
import 'package:frs/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(Splash());
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash2 extends StatelessWidget {
  const Splash2() : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: MediaQuery.of(context).viewInsets,
          // height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(0xFF, 0x0e, 0x66, 0xa4),
                const Color.fromARGB(0xFF, 0x92, 0x95, 0xf5),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: AnimatedSplashScreen(
            duration: 4000,
            centered: true,
            splash: Wrap(
              children: [
                Text('Food\nRecommendation\nSystem',style: TextStyle(color: Colors.white,fontSize: 40),),
              ],
            ),
            nextScreen: MyApp(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,

            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FRS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
