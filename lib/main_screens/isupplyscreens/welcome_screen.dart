import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/yellow_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const textColors = [
  Color.fromARGB(255, 11, 52, 114),
  // Colors.yellowAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.green,
  Colors.purple,
  Colors.teal
];

const textStyle =
    TextStyle(fontSize: 45, fontWeight: FontWeight.bold, fontFamily: 'Acme');

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage('images/inapp/bgimage.jpg'),
            //     fit: BoxFit.cover)
                ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'WELCOME',
                    textStyle: textStyle,
                    colors: textColors,
                  ),
                  ColorizeAnimatedText(
                    'iSupply Pro',
                    textStyle: textStyle,
                    colors: textColors,
                  )
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
              const SizedBox(
                height: 150,
                width: 200,
                child: Image(image: AssetImage('images/logo.png')),
              ),
              SizedBox(
                height: 80,
                child: DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 9, 69, 158),
                      fontFamily: 'Acme'),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Buy'),
                      RotateAnimatedText('Shop'),
                      RotateAnimatedText('iSupply Pro'),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Container(
                      //   decoration: const BoxDecoration(
                      //       color: Colors.white38,
                      //       borderRadius: BorderRadius.only(
                      //           topLeft: Radius.circular(50),
                      //           bottomLeft: Radius.circular(50))),
                      //   child: null,
                      // ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50))),
                        child: Column(
                          
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                          children: [
                            // AnimatedLogo(controller: _controller),
                            Padding(
                              padding: const EdgeInsets.only(right:40.0),
                              child: YellowButton(
                                  label: 'LOG IN',
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/customer_login');
                                  },
                                  width: 0.65),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(10.0),
                            //   child: YellowButton(
                            //       label: 'CUSTOMER SCREEN',
                            //       onPressed: () {
                            //         Navigator.pushReplacementNamed(
                            //             context, '/customer_home');
                            //       },
                            //       width: 0.45),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(right: 8),
                            //   child: YellowButton(
                            //       label: 'Sign Up',
                            //       onPressed: () {},
                            //       width: 0.25),
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Container(
              //       height: 60,
              //       width: MediaQuery.of(context).size.width * 0.9,
              //       decoration: const BoxDecoration(
              //           color: Colors.white38,
              //           borderRadius: BorderRadius.only(
              //               topRight: Radius.circular(50),
              //               bottomRight: Radius.circular(50))),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(left: 8),
              //             child: YellowButton(
              //                 label: 'Log In',
              //                 onPressed: () {
              //                   Navigator.pushReplacementNamed(
              //                       context, '/customer_home');
              //                 },
              //                 width: 0.25),
              //           ),
              //           // YellowButton(
              //           //     label: 'Sign Up', onPressed: () {
                              
              //           //         Navigator.pushReplacementNamed(
              //           //             context, '/customer_sign');
              //           //     }, width: 0.25
              //           //     ),
              //           // AnimatedLogo(controller: _controller),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white38.withOpacity(0.3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleFacebookLogIn(
                        label: 'Google',
                        onPresssed: () {},
                        child: const Image(
                            image: AssetImage('images/inapp/google.jpg')),
                      ),
                      GoogleFacebookLogIn(
                        label: 'Facebook',
                        onPresssed: () {},
                        child: const Image(
                            image: AssetImage('images/inapp/facebook.jpg')),
                      ),
                      GoogleFacebookLogIn(
                          label: 'Guest',
                          onPresssed: () async{
                            await FirebaseAuth.instance.signInAnonymously();
                            Navigator.pushReplacementNamed(context, '/customer_home');

                          },
                          child: const Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.lightBlueAccent,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    Key? key,
    required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi/180,
          child: child,
        );
      },
      child: const Image(image: AssetImage('images/logo.png')),
    );
  }
}

class GoogleFacebookLogIn extends StatelessWidget {
  final String label;
  final Function() onPresssed;
  final Widget child;
  const GoogleFacebookLogIn(
      {Key? key,
      required this.child,
      required this.label,
      required this.onPresssed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPresssed,
        child: Column(
          children: [
            SizedBox(height: 30, width: 30, child: child),
            Text(
              label,
              style: const TextStyle(color: Color.fromARGB(255, 10, 58, 130)),
            )
          ],
        ),
      ),
    );
  }
}
