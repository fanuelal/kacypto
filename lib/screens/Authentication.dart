import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../Styles/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import '../helpers/ProtectedRoute.dart';
import './AuthenticationSinUp.dart';

class Authentication extends StatefulWidget {
  static final routeName = "authenticationScreen";
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwrodController = TextEditingController();
  bool _passwordVisibility = false;
  bool _isAuthenticating = false;

  void _showErrorDialog(String errorMessage) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Login Failed',
        titleColor: AppColor.iceWhite,
        text: errorMessage,
        textColor: AppColor.iceWhite,
        confirmBtnColor: AppColor.purple,
        confirmBtnText: 'OK',
        backgroundColor: AppColor.Darkgrey);
  }

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<Auth>(context, listen: false);
    Future<void> _SignInauthentication(String email, String password) async {
      var errorMessage = "Authentication Error!";
      ProtectedRoute _protectedRoute = new ProtectedRoute();
      setState(() {
        _isAuthenticating = true;
      });
      try {
        await _auth.signIn(email, password).timeout(const Duration(seconds: 3));
        setState(() {});
      } on TimeoutException {
        errorMessage = "Slow connection Try again. Timeout!";
      } catch (error) {
        if (error.toString().contains('EMAIL_EXISTS')) {
          errorMessage = 'This Email address is already in use,';
        } else if (error.toString().contains('INVALID_EMAIL')) {
          errorMessage = 'Invalid Email address';
        } else if (error.toString().contains('WEAK_PASSWORD')) {
          errorMessage = 'Weak password you are using.';
        } else if (error.toString().contains('INVALID_PASSWORD')) {
          errorMessage = 'Invalid Password or Email.';
        } else if (error.toString().contains('TOO_MANY_ATTEMPTS_TRY_LATER')) {
          errorMessage = 'To many attempts.';
        } else if (error.toString().contains('INVALID_EMAIL')) {
          errorMessage = 'Your Email address is invalid';
        } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
          errorMessage = 'Your Email address was not found.';
        } else if (error.toString().contains('MISSING_PASSWORD')) {
          errorMessage = 'The system Missed your password';
        }
        _showErrorDialog(errorMessage);
      }
      setState(() {
        _isAuthenticating = false;
      });

      _protectedRoute.isProtected(context);
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.firstDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.35),
                  child: Text(
                    "Kasypto",
                    style: GoogleFonts.dosis(
                        color: AppColor.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 5, vertical: 50),
                //   child: Image.asset(
                //       fit: BoxFit.cover,
                //       height: size.height * 0.45,
                //       width: size.width,
                //       "assets/images/login2.webp"),
                // ),
                Lottie.asset(
                  "assets/lottie/cryptoCity.json",
                  height: size.height * 0.5,
                  width: size.width,
                  fit: BoxFit.cover,
                  animate: true,
                  repeat: true,
                  //     controller: _controller, onLoaded: (composition) {
                  //   _controller.duration = Duration(seconds: 10);
                  //   _controller.forward();
                  //   _controller.repeat();
                  // },
                ),
              ]),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 45),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: AppColor.iceWhite),
                          decoration: InputDecoration(
                              prefixIconColor: Colors.white,
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 165, 0, 143)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "Email",
                              labelStyle: TextStyle(color: AppColor.iceWhite),
                              hintStyle: TextStyle(color: AppColor.white)),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _passwrodController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: AppColor.iceWhite,
                          ),
                          obscuringCharacter: '•',
                          obscureText: !_passwordVisibility,
                          decoration: InputDecoration(
                            prefixIconColor: Colors.white,
                            prefixIcon: Icon(Icons.lock_outline_sharp),
                            suffixIcon: IconButton(
                              color: AppColor.iceWhite,
                              icon: Icon(
                                _passwordVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisibility = !_passwordVisibility;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 165, 0, 143),
                                )),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: AppColor.iceWhite),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 5, 69, 126),
                                AppColor.purple,
                              ])),
                          child: ElevatedButton(
                              onPressed: () {
                                _SignInauthentication(_emailController.text,
                                    _passwrodController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(size.width - 30, 50),
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(color: AppColor.iceWhite),
                              )),
                        ),
                      ],
                    ),
                  ),
                  _isAuthenticating
                      ? Positioned(
                          top: 0,
                          child: Container(
                            margin: EdgeInsets.only(left: (size.width * 0.3)),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.80),
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: Lottie.asset(
                              "assets/lottie/waiting.json",
                              fit: BoxFit.cover,
                              animate: true,
                              repeat: true,
                              //     controller: _controller,
                              //     onLoaded: (composition) {
                              //   _controller.duration = composition.duration;
                              //   _controller.forward();
                              //   _controller.repeat();
                              // }
                            ),
                          ),
                        )
                      : Text(""),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AuthenticationSignUp()));
                      },
                      child: Text("Create account",
                          style: GoogleFonts.robotoMono(
                              // background: ,
                              color: AppColor.contentColorBlue)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot password?",
                        style: GoogleFonts.robotoMono(
                          color: AppColor.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
