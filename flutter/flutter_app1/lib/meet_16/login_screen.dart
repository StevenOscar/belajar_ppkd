import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/meet_16/database/db_helper.dart';
import 'package:flutter_app1/meet_16/models/user_model.dart';
import 'package:flutter_app1/meet_16/register_screen.dart';
import 'package:flutter_app1/meet_16/text_form_field_widget.dart';

class LoginScreenApp extends StatefulWidget {
  static const String id = "/login_screen_app";
  const LoginScreenApp({super.key});

  @override
  State<LoginScreenApp> createState() => _LoginScreenAppState();
}

class _LoginScreenAppState extends State<LoginScreenApp> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(250),
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Positioned(
              left: -80,
              top: -50,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 150, color: Color(0xffF34B1B).withAlpha(150))],
                ),
                width: 230,
                height: 230,
              ),
            ),
            Positioned(
              left: -85,
              top: 400,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 140, color: Color(0xff283FB1).withAlpha(140))],
                ),
                width: 200,
                height: 200,
              ),
            ),
            Positioned(
              right: 20,
              bottom: -70,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 200, color: Color(0xffF34B1B).withAlpha(150))],
                ),
                width: 230,
                height: 230,
              ),
            ),
            Positioned(
              right: -120,
              bottom: 50,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 140, color: Color(0xff283FB1).withAlpha(140))],
                ),
                width: 200,
                height: 200,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Login to access your account",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Color(0xff888888),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email Address",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Color(0xff888888),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormFieldWidget(
                        hintText: "Email",
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (p0) {
                          print("Email : $p0");
                        },
                      ),
                      SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Color(0xff888888),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormFieldWidget(
                        hintText: "Password",
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child:
                                isPasswordVisible
                                    ? Icon(Icons.visibility_outlined, size: 24, color: Color(0xffc4c4c4))
                                    : Icon(Icons.visibility_off_outlined, size: 24, color: Color(0xffc4c4c4)),
                          ),
                        ),
                        onChanged: (p0) {
                          print("Password : $p0");
                        },
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              overlayColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: 4),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Color(0xffF34B1B),
                                  content: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Text(
                                        "Yahaha lupa",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xffF34B1B),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Color(0xff283FB1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              UserModel? data = await DbHelper.login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              if (data != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Text(
                                          "Login Success",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Text(
                                          "Email dan password tidak sesuai",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(child: Divider(color: Color(0xffF2F2F2))),
                          SizedBox(width: 4),
                          Text(
                            "Or Sign In With",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff888888),
                            ),
                          ),
                          SizedBox(width: 4),
                          Expanded(child: Divider(color: Color(0xffF2F2F2))),
                        ],
                      ),
                      SizedBox(height: 32),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/tugas_6/btnSigninwithGoogle.png", width: 16, height: 16),
                            SizedBox(width: 10),
                            Text(
                              "Google",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff222222),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff888888),
                          ),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, RegisterScreenApp.id);
                                    },
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff283FB1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
