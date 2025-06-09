import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/tugas/tugas_12/db_helper_12.dart';
import 'package:flutter_app1/tugas/tugas_12/edit_page.dart';
import 'package:flutter_app1/tugas/tugas_12/participant_model.dart';
import 'package:flutter_app1/tugas/tugas_12/text_form_field_12.dart';
import 'package:intl/intl.dart';

class TugasDuaBelasFlutter extends StatefulWidget {
  static String id = "/tugas_12";
  const TugasDuaBelasFlutter({super.key});

  @override
  State<TugasDuaBelasFlutter> createState() => _TugasDuaBelasFlutterState();
}

class _TugasDuaBelasFlutterState extends State<TugasDuaBelasFlutter> {
  Future<void> loadData() async {
    final data = await DbHelperDuaBelas.getAllData();
    setState(() {
      if (data.isNotEmpty) {
        listParticipant = data;
      } else {
        listParticipant = [];
      }
    });
  }

  Future<void> deleteData(int id) async {
    await DbHelperDuaBelas.deleteData(id);
  }

  void insertData() async {
    FocusManager.instance.primaryFocus!.unfocus();
    if (_formKey.currentState!.validate()) {
      await DbHelperDuaBelas.insertData(
        ParticipantModel(
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
                "Data Berhasil di submit",
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
      loadData();
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
  void initState() {
    loadData();
    super.initState();
  }

  List<ParticipantModel> listParticipant = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int genderValue = 0;
  DateTime dateValue = DateTime.now();
  TimeOfDay timeValue = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAE4D5),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pendaftaran Event",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Color(0xff000000),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Formulir Pendaftaran Event",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextFormFieldDuaBelas(
                    controller: nameController,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 26,
                    ),
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
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 26,
                    ),
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
                    prefixIcon: Icon(
                      Icons.event,
                      color: Colors.black,
                      size: 26,
                    ),
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
                      onPressed: insertData,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  listParticipant.isNotEmpty
                      ? Column(
                        children: [
                          Text(
                            "List Peserta & Event",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 20),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: listParticipant.length,
                            itemBuilder: (context, index) {
                              ParticipantModel participant =
                                  listParticipant[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 10,
                                ),
                                child: Card(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          participant.eventName,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Divider(
                                          thickness: 4,
                                          color: Color(0xffB6B09F),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "Nama Peserta :",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(participant.name),
                                        SizedBox(height: 12),
                                        Text(
                                          "Kota : ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(participant.city),
                                        SizedBox(height: 12),
                                        Text(
                                          "Jenis Kelamin : ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          participant.gender == 0
                                              ? "Laki-laki"
                                              : "Perempuan",
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Email :",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(participant.email),
                                        SizedBox(height: 12),
                                        Text(
                                          "Nomor Telepon : ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          participant.phoneNumber.isEmpty
                                              ? "--"
                                              : participant.phoneNumber,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Tanggal Registrasi : ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          DateFormat(
                                            "EEEE, d MMMM yyyy hh:mm",
                                            "ID_id",
                                          ).format(participant.registeredAt),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Tanggal Event : ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "${DateFormat("EEEE, d MMMM yyyy", "ID_id").format(participant.eventDate)} ${participant.eventTime.hour.toString()}:${participant.eventTime.minute.toString().padLeft(2, '0')}",
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (context) => EditPage(
                                                          data:
                                                              listParticipant[index],
                                                        ),
                                                  ),
                                                ).then(
                                                  (value) => setState(() {
                                                    loadData();
                                                  }),
                                                );
                                              },
                                              child: Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                                size: 25,
                                              ),
                                            ),
                                            SizedBox(width: 12),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                              ),
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (context) => AlertDialog(
                                                        title: Text(
                                                          "Hapus Data",
                                                        ),
                                                        content: Text(
                                                          "Apakah anda yakin ingin menghapus '${participant.eventName}'?",
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                            },
                                                            child: Text(
                                                              "Tidak",
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () async {
                                                              setState(() {});
                                                              await deleteData(
                                                                participant.id!,
                                                              );
                                                              ScaffoldMessenger.of(
                                                                context,
                                                              ).showSnackBar(
                                                                SnackBar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .green,
                                                                  content: Center(
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                            12,
                                                                          ),
                                                                      child: Text(
                                                                        "Data Berhasil di hapus",
                                                                        style: TextStyle(
                                                                          fontFamily:
                                                                              "Poppins",
                                                                          fontSize:
                                                                              24,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                              await loadData();
                                                              setState(() {});
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                            },
                                                            child: Text("Ya"),
                                                          ),
                                                        ],
                                                      ),
                                                );
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                      : Text(
                        "List Peserta & Event Kosong",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
