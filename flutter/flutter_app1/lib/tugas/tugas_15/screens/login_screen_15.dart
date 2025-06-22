import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_15/api/user_api.dart';
import 'package:flutter_app1/tugas/tugas_15/helper/shared_preferences_helper.dart';
import 'package:flutter_app1/tugas/tugas_15/screens/pokemon_list_screen_15.dart';
import 'package:flutter_app1/tugas/tugas_15/screens/register_screen_15.dart';
import 'package:flutter_app1/tugas/tugas_15/widgets/text_form_field_widget_15.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen15 extends StatefulWidget {
  static const String id = "/login_15";

  const LoginScreen15({super.key});

  @override
  State<LoginScreen15> createState() => _LoginScreen15State();
}

class _LoginScreen15State extends State<LoginScreen15> {
  final FToast fToast = FToast();
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

  void login() async {
    setState(() {
      _isLoading = true;
    });
    final res = await UserApi().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );
    if (res.data == null) {
      fToast.showToast(
        gravity: ToastGravity.TOP,
        toastDuration: Duration(seconds: 2),
        child: Container(
          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: Text(res.message, style: TextStyle(color: Colors.white)),
        ),
      );
    } else {
      await SharedPreferencesHelper.setToken(res.data!.token!);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PokemonListScreen15(userData: res.data!.user!)),
      );
      fToast.showToast(
        gravity: ToastGravity.TOP,
        toastDuration: Duration(seconds: 2),
        child: Container(
          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: Text(res.message, style: TextStyle(color: Colors.white)),
        ),
      );
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
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
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
                      TextFormFieldWidget15(
                        prefixIcon: Icon(Icons.email),
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
                      TextFormFieldWidget15(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password),
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
                      SizedBox(height: 24),
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
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                  login();
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
                                      Navigator.pushNamed(context, RegisterScreen15.id);
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
