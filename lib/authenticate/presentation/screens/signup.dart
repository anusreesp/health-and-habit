import 'dart:ui';

import 'package:animate_you/authenticate/presentation/screens/login.dart';
import 'package:animate_you/common/normal_textfield.dart';
import 'package:animate_you/common/oval_text_button.dart';
import 'package:animate_you/common/validator.dart';
import 'package:animate_you/theme.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_mixin/animation_mixin.dart';
import 'package:simple_animations/simple_animations.dart';

class SignUpScreen extends StatefulWidget {
  static const route = '/signup-page';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with AnimationMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKeySignUp = GlobalKey<FormState>();

  AnimationController? _controller;
  Animation<double>? animatedFade;
  Animation<double>? animatedBlur;
  Animation<double>? animatedSize;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    animatedFade = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOutQuint,
    ));

    animatedBlur = Tween<double>(begin: 50, end: 0)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.ease));

    animatedSize = Tween<double>(begin: 0, end: 500).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.decelerate));

    _controller?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
            animation: animatedBlur!,
            builder: (BuildContext context, Widget? child) {
              return BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: animatedBlur!.value, sigmaY: animatedBlur!.value),
                child: Stack(
                  children: [bgColor(), buildBody()],
                ),
              );
            }));
  }

  bgColor() {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.5,
          color: Colors.teal.shade900,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.5,
          color: AppTheme.light().scaffoldBackgroundColor,
        )
      ],
    );
  }

  buildBody() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(40)),
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.teal.shade900,
                Colors.teal.shade800,
                Colors.teal.shade400
              ])),
          child: const Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Text(
                  'Sign Up',
                  style: man32White,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Create an account',
                  style: man20White,
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppTheme.light().scaffoldBackgroundColor,
                // color: Colors.black,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    AnimatedBuilder(
                        animation: animatedSize!,
                        builder: (context, child) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              width: animatedSize?.value,
                              decoration: BoxDecoration(
                                  color:
                                      AppTheme.light().scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: AppTheme.darkGrey2Color,
                                        blurRadius: 20,
                                        offset: Offset(0, 8)),
                                  ]),
                              child: Form(
                                key: _formKeySignUp,
                                child: Column(
                                  children: [
                                    NormalTextField(
                                      controller: nameController,
                                      hintText: 'Full name',
                                      validator: MultiValidator([
                                        MinLengthValidator(6,
                                            errorText: 'Name is too short'),
                                        NonNumberValidator(
                                            errorText:
                                                'Numeric values are not allowed')
                                      ]),
                                    ),
                                    NormalTextField(
                                      controller: emailController,
                                      hintText: 'Email',
                                      validator: EmailTextValidator(
                                          errorText: 'Enter a valid email'),
                                    ),
                                    NormalTextField(
                                      controller: newPasswordController,
                                      isObscureText: true,
                                      hintText: 'New password',
                                      validator: MinLengthValidator(8,
                                          errorText: 'Password is too short'),
                                    ),
                                    NormalTextField(
                                        controller: confirmPasswordController,
                                        isObscureText: true,
                                        hintText: 'Confirm password',
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Password is too short';
                                          }
                                          if (val !=
                                              newPasswordController.text) {
                                            return 'Password does not match';
                                          }
                                          return null;
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 25,
                    ),
                    OvalTextButton(height: 50, onTap: () {}, title: 'Sign Up'),
                    const SizedBox(
                      height: 34,
                    ),
                    const Text(
                      'Continue with Social Media',
                      style: TextStyle(color: AppTheme.darkGrey1Color),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: OvalTextButton(
                                bgColor: AppTheme.facebookColor,
                                onTap: () {},
                                height: 42,
                                title: 'Facebook'),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: OvalBorderButton(
                              onTap: () {},
                              title: 'Google',
                              bgColor: AppTheme.greycolor,
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.blackColor),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?   ',
                          style: TextStyle(color: AppTheme.darkGrey1Color),
                        ),
                        GestureDetector(
                          child: Text(
                            'Login',
                            style: TextStyle(color: AppTheme.teal2Color),
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()
                                    // SignUpScreen()
                                    ));

                            // Navigator.pushNamed(
                            //   context, SignUpScreen.route,
                            //   // arguments: data.id
                            // );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
