import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_15/api/user_api.dart';
import 'package:flutter_app1/tugas/tugas_15/widgets/text_form_field_widget_15.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen15 extends StatefulWidget {
  static const String id = "/register_15";

  const RegisterScreen15({super.key});

  @override
  State<RegisterScreen15> createState() => _RegisterScreen15State();
}

class _RegisterScreen15State extends State<RegisterScreen15> {
  final FToast fToast = FToast();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  void register() async {
    setState(() {
      _isLoading = true;
    });
    final res = await UserApi().createUser(
      name: nameController.text,
      password: passwordController.text,
      email: emailController.text,
    );
    if (res.errors != null) {
      final errorList = res.errors!.toList();
      fToast.showToast(
        gravity: ToastGravity.TOP,
        toastDuration: Duration(seconds: 2),
        child: Container(
          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: Column(
            children:
                errorList.map((e) {
                  return Text(e, style: TextStyle(color: Colors.white));
                }).toList(),
          ),
        ),
      );
    } else {
      fToast.showToast(
        gravity: ToastGravity.TOP,
        toastDuration: Duration(seconds: 2),
        child: Container(
          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: Text(res.message, style: TextStyle(color: Colors.white)),
        ),
      );
      Navigator.pop(context);
    }
    setState(() {
      _isLoading = false;
    });
  }

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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
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
                      TextFormFieldWidget15(
                        prefixIcon: Icon(Icons.email),
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
                      TextFormFieldWidget15(
                        prefixIcon: Icon(Icons.person),
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
                      TextFormFieldWidget15(
                        prefixIcon: Icon(Icons.password),
                        hintText: "Enter your Password",
                        controller: passwordController,
                        obscureText: !_isPasswordVisible,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            child:
                                _isPasswordVisible
                                    ? Icon(
                                      Icons.visibility_outlined,
                                      size: 24,
                                      color: Color(0xffc4c4c4),
                                    )
                                    : Icon(
                                      Icons.visibility_off_outlined,
                                      size: 24,
                                      color: Color(0xffc4c4c4),
                                    ),
                          ),
                        ),
                        onChanged: (p0) {
                          print("Password : $p0");
                        },
                      ),
                      SizedBox(height: 40),
                      _isLoading
                          ? CircularProgressIndicator()
                          : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                backgroundColor: Color(0xff283FB1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  register();

                                  print("Email: ${emailController.text}");
                                  print("Name: ${nameController.text}");
                                  print("Password: ${passwordController.text}");
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
