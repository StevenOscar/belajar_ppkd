import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_10/confirm_page.dart';
import 'package:flutter_app1/tugas/tugas_10/text_form_field_widget.dart';

class TugasSepuluhFlutter extends StatefulWidget {
  const TugasSepuluhFlutter({super.key});

  @override
  State<TugasSepuluhFlutter> createState() => _TugasSepuluhFlutterState();
}

class _TugasSepuluhFlutterState extends State<TugasSepuluhFlutter> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isFormValid = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Formulir Pendaftaran Kelas Flutter",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 38,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 60),
                  TextFormFieldWidget(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 25,
                    ),
                    controller: nameController,
                    hintText: "Nama Lengkap",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nama harus diisi";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (p0) {
                      setState(() {
                        isFormValid = formkey.currentState!.validate();
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormFieldWidget(
                    prefixIcon: Icon(Icons.email, color: Colors.blue, size: 25),
                    controller: emailController,
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email harus diisi";
                      } else if (!value.contains("@")) {
                        return "Email harus mengandung simbol '@'";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (p0) {
                      setState(() {
                        isFormValid = formkey.currentState!.validate();
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormFieldWidget(
                    prefixIcon: Icon(
                      Icons.phone_android_outlined,
                      color: Colors.blue,
                      size: 25,
                    ),
                    controller: phoneController,
                    hintText: "Nomor Handphone (Opsional)",
                    keyboardType: TextInputType.phone,
                    onChanged: (p0) {
                      setState(() {
                        isFormValid = formkey.currentState!.validate();
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormFieldWidget(
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Colors.blue,
                      size: 25,
                    ),
                    controller: cityController,
                    hintText: "Kota Domisili",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Kota Domisili harus diisi";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (p0) {
                      setState(() {
                        isFormValid = formkey.currentState!.validate();
                      });
                    },
                  ),
                  SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        disabledBackgroundColor: Colors.grey.shade500,
                      ),
                      onPressed:
                          isFormValid
                              ? () {
                                showDialog(
                                  context: context,
                                  builder:
                                      (context) => AlertDialog(
                                        title: Center(
                                          child: Text(
                                            "Ringkasan Data",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        content: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Nama : ",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      nameController.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Email : ",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      emailController.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Nomor Telepon : ",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      phoneController.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Kota : ",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      cityController.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) => ConfirmPage(
                                                        name:
                                                            nameController.text,
                                                        email:
                                                            emailController
                                                                .text,
                                                        phoneNumber:
                                                            phoneController
                                                                .text,
                                                        city:
                                                            cityController.text,
                                                      ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "Lanjutkan",
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                );
                              }
                              : null,
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
