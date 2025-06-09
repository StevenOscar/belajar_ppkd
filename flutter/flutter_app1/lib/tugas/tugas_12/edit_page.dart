import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/tugas/tugas_12/db_helper_12.dart';
import 'package:flutter_app1/tugas/tugas_12/participant_model.dart';
import 'package:flutter_app1/tugas/tugas_12/text_form_field_12.dart';
import 'package:intl/intl.dart';

class EditPage extends StatefulWidget {
  final ParticipantModel data;
  const EditPage({super.key, required this.data});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController eventController = TextEditingController();
  late TextEditingController cityController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int genderValue = 0;
  DateTime dateValue = DateTime.now();
  TimeOfDay timeValue = TimeOfDay.now();

  @override
  void initState() {
    nameController = TextEditingController(text: widget.data.name);
    emailController = TextEditingController(text: widget.data.email);
    eventController = TextEditingController(text: widget.data.eventName);
    cityController = TextEditingController(text: widget.data.city);
    phoneController = TextEditingController(text: widget.data.phoneNumber);
    genderValue = widget.data.gender;
    dateValue = widget.data.eventDate;
    timeValue = widget.data.eventTime;
    super.initState();
  }

  void updateData() async {
    if (_formKey.currentState!.validate()) {
      await DbHelperDuaBelas.updateData(
        ParticipantModel(
          id: widget.data.id,
          name: nameController.text,
          email: emailController.text,
          eventName: eventController.text,
          city: cityController.text,
          gender: genderValue,
          phoneNumber: phoneController.text,
          eventDate: dateValue,
          eventTime: timeValue,
          registeredAt: DateTime.now(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Data Berhasil di update",
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
      nameController.clear();
      emailController.clear();
      eventController.clear();
      cityController.clear();
      phoneController.clear();
      dateValue = DateTime.now();
      timeValue = TimeOfDay.now();
      genderValue = 0;
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Lengkapi form terlebih dahulu",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAE4D5),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Data",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Color(0xff000000),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormFieldDuaBelas(
                  controller: nameController,
                  prefixIcon: Icon(Icons.person, color: Colors.black, size: 26),
                  hintText: "Masukkan Nama",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama harus diisi";
                    }
                    return null;
                  },
                ),
                TextFormFieldDuaBelas(
                  controller: emailController,
                  prefixIcon: Icon(Icons.email, color: Colors.black, size: 26),
                  hintText: "Masukkan Email",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email harus diisi";
                    } else if (!value.contains("@")) {
                      return "Email harus menandung simbol '@'";
                    }
                    return null;
                  },
                ),
                TextFormFieldDuaBelas(
                  controller: eventController,
                  prefixIcon: Icon(Icons.event, color: Colors.black, size: 26),
                  hintText: "Masukkan Nama Event",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama Event harus diisi";
                    }
                    return null;
                  },
                ),
                TextFormFieldDuaBelas(
                  controller: cityController,
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Colors.black,
                    size: 26,
                  ),
                  hintText: "Masukkan Kota",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Kota harus diisi";
                    }
                    return null;
                  },
                ),
                TextFormFieldDuaBelas(
                  controller: phoneController,
                  prefixIcon: Icon(
                    Icons.phone_android,
                    color: Colors.black,
                    size: 24,
                  ),
                  hintText: "Masukkan Nomor Telepon",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nomor Telepon harus diisi";
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'[A-Za-z]')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      activeColor: Colors.black,
                      value: 0,
                      groupValue: genderValue,
                      onChanged: (value) {
                        setState(() {
                          genderValue = value!;
                        });
                      },
                    ),
                    Text(
                      "Laki-laki",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 20),
                    Radio(
                      value: 1,
                      activeColor: Colors.black,
                      groupValue: genderValue,
                      onChanged: (value) {
                        setState(() {
                          genderValue = value!;
                        });
                      },
                    ),
                    Text(
                      "Perempuan",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Tanggal : ${DateFormat("EEEE, d MMMM yyyy", "ID_id").format(dateValue)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Jam : ${timeValue.hour.toString()}:${timeValue.minute.toString().padLeft(2, '0')}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () async {
                                  final DateTime? selectedDate =
                                      await showDatePicker(
                                        context: context,
                                        initialDate: dateValue,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2100),
                                      );
                                  if (selectedDate != null) {
                                    setState(() {
                                      dateValue = selectedDate;
                                    });
                                  }
                                },
                                child: Text(
                                  "Tanggal Event",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () async {
                                  final TimeOfDay? selectedTime =
                                      await showTimePicker(
                                        context: context,
                                        initialTime: timeValue,
                                      );
                                  if (selectedTime != null) {
                                    setState(() {
                                      timeValue = selectedTime;
                                    });
                                  }
                                },
                                child: Text(
                                  "Jam Event",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: updateData,
                    child: Text(
                      "Update Data",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
