import 'package:animate_you/authenticate/controllers/auth_controller.dart';
import 'package:animate_you/authenticate/presentation/screens/reset_password.dart';
import 'package:animate_you/authenticate/presentation/screens/signup.dart';
import 'package:animate_you/authenticate/presentation/widget/fade_animation.dart';
import 'package:animate_you/common/normal_textfield.dart';
import 'package:animate_you/common/oval_text_button.dart';
import 'package:animate_you/common/validator.dart';
import 'package:animate_you/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/login-page';
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.teal.shade900,
          Colors.teal.shade800,
          Colors.teal.shade400
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: man32White,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Welcome',
                    style: man20White,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: AppTheme.light().scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Form(
                              key: _formKeyLogin,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  FadeAnimation(
                                      2.5,
                                      Container(
                                        decoration: BoxDecoration(
                                            color: AppTheme.light()
                                                .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color:
                                                      AppTheme.darkGrey2Color,
                                                  blurRadius: 20,
                                                  offset: Offset(0, 8)),
                                            ]),
                                        child: Column(
                                          children: [
                                            NormalTextField(
                                              controller: emailController,
                                              hintText: 'Email',
                                              validator: EmailTextValidator(
                                                  errorText:
                                                      'Enter a valid email'),
                                            ),
                                            NormalTextField(
                                              controller: passwordController,
                                              isObscureText: true,
                                              hintText: 'Password',
                                              validator: MinLengthValidator(8,
                                                  errorText:
                                                      'Password is too short'),
                                            ),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  FadeAnimation(
                                      1.5,
                                      GestureDetector(
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                              color: AppTheme.teal2Color),
                                        ),
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ForgetPassword()));
                                        },
                                      )),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  Consumer(builder: (BuildContext context,
                                      WidgetRef ref, Widget? child) {
                                    final authController =
                                        ref.watch(authProvider);

                                    if (authController is AuthLoading) {
                                      return const CircularProgressIndicator();
                                    } else {
                                      return OvalTextButton(
                                          onTap: () {
                                            if (_formKeyLogin.currentState!
                                                .validate()) {
                                              ref
                                                  .read(authProvider.notifier)
                                                  .emailLogin(
                                                      emailController.text,
                                                      passwordController.text);
                                            }
                                          },
                                          title: 'Login');
                                    }
                                  }),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const FadeAnimation(
                                      1.5,
                                      Text(
                                        'Continue with Social Media',
                                        style: TextStyle(
                                            color: AppTheme.darkGrey1Color),
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: FadeAnimation(
                                          1.5,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: OvalTextButton(
                                                height: 42,
                                                bgColor: AppTheme.facebookColor,
                                                onTap: () {},
                                                title: 'Facebook'),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: FadeAnimation(
                                          1.5,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0),
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
                                        'Dont have an account?   ',
                                        style: TextStyle(
                                            color: AppTheme.darkGrey1Color),
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                              color: AppTheme.teal2Color),
                                        ),
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpScreen()));

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
                            )))))
          ],
        ),
      ),
    );
  }
}
