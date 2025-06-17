import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/meet_16/database/db_helper.dart';
import 'package:flutter_app1/meet_16/models/user_model.dart';
import 'package:flutter_app1/meet_16/text_form_field_widget.dart';

class RegisterScreenApp extends StatefulWidget {
  static const String id = "/register_screen_app";
  const RegisterScreenApp({super.key});

  @override
  State<RegisterScreenApp> createState() => _RegisterScreenAppState();
}

class _RegisterScreenAppState extends State<RegisterScreenApp> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
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
                        "Register",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Register your account",
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
                        hintText: "Enter your Email",
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
                          "Name",
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
                        hintText: "Enter your Name",
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        onChanged: (p0) {
                          print("Name : $p0");
                        },
                      ),
                      SizedBox(height: 24),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Username",
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
                        hintText: "Enter your Username",
                        controller: usernameController,
                        onChanged: (p0) {
                          print("Username : $p0");
                        },
                      ),
                      SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Phone Number",
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
                        hintText: "Enter your Phone Number",
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        onChanged: (p0) {
                          print("Phone Number : $p0");
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
                        hintText: "Enter your Password",
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
                      SizedBox(height: 40),
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
                              print("Email: ${emailController.text}");
                              print("Name: ${nameController.text}");
                              print("Username: ${usernameController.text}");
                              print("Phone: ${phoneController.text}");
                              print("Password: ${passwordController.text}");
                              await DbHelper.registerUser(
                                data: UserModel(
                                  email: emailController.text,
                                  name: nameController.text,
                                  username: usernameController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Text(
                                        "Registration success",
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
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Divider(color: Color(0xffF2F2F2)),
                      SizedBox(height: 24),
                      Text.rich(
                        TextSpan(
                          text: "Have an account? ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff888888),
                          ),
                          children: [
                            TextSpan(
                              text: "Sign In",
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pop(context);
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
