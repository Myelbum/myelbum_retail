import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/screens/authentication/login/login.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

import 'ui/data_layer/screens/authentication/register/full_sign_up/google_or_email.dart';
import 'ui/data_layer/screens/authentication/register/retail_sign_up/retail_sign_up.dart';

void main() {
  runApp(const ElbumRetailApp());
}

class ElbumRetailApp extends StatelessWidget {
  const ElbumRetailApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SplashScren();
  }
}

class SplashScren extends StatefulWidget {
  const SplashScren({super.key});

  @override
  State<SplashScren> createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;
  AnimationController? contr;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(animationController!);
    animationController!.addListener(() {
      if (animationController!.status == AnimationStatus.completed) {
        animationController!.reverse();
      }
      if (animationController!.status == AnimationStatus.dismissed) {
        animationController!.forward();
      }
      setState(() {});
    });
    animationController!.forward();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignChoiceType()));
      animationController!.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.appThemeColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Rectangle 367.png',
                    width: 126.0,
                    height: 127.0,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  const Text(
                    "MyElbum",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 23.0,
                  ),
                  const Text(
                    "Retail Partner",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Opacity(
                  opacity: animationController!.value,
                  child: const Text("Powered by Structure",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignChoiceType extends StatelessWidget {
  const SignChoiceType({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    'assets/images/interior-design-with-photoframes-nice-chairs_23-2149385446 (1) 1.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 4,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: customButon(size, "LOGIN", [
                "I have a MYELBUM retail account",
              ]),
            ),
            const SizedBox(
              height: 32.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RetailSignUp()));
              },
              child: customButon(size, "RETAIL sign up", [
                "I have a myelbum account, I WANT TO",
                " CREATE MY RETAIL ACOUNT"
              ]),
            ),
            const SizedBox(
              height: 32.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GoogleEmail()));
              },
              child: customButon(size, "FULL SIGN UP", [
                "I DON’T have a myelbum account YET",
              ]),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
