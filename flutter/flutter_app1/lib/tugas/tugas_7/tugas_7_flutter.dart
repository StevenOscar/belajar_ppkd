import 'package:flutter/material.dart';
import 'package:flutter_app1/helper/preference_handler.dart';
import 'package:flutter_app1/tugas/tugas_7/checkbox_page.dart';
import 'package:flutter_app1/tugas/tugas_7/date_picker_page.dart';
import 'package:flutter_app1/tugas/tugas_7/dropdown_page.dart';
import 'package:flutter_app1/tugas/tugas_7/switch_page.dart';
import 'package:flutter_app1/tugas/tugas_7/time_picker_page.dart';

class TugasTujuhFlutter extends StatefulWidget {
  const TugasTujuhFlutter({super.key});

  @override
  State<TugasTujuhFlutter> createState() => _TugasTujuhFlutterState();
}

class _TugasTujuhFlutterState extends State<TugasTujuhFlutter> {
  final List<Widget> _screen = [
    CheckboxPage(),
    SwitchPage(),
    DropdownPage(),
    DatePickerPage(),
    TimePickerPage(),
  ];
  final List<String> title = [
    "Syarat & Ketentuan",
    "Atur Mode Gelap",
    "PIlih Kategori Produk",
    "Pilih Tanggal Lahir",
    "Atur Pengingat",
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title[currentIndex],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu, color: Colors.white),
              ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 240,
              child: DrawerHeader(
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.lightBlueAccent,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/harirawr.jpg",
                        ),
                        radius: 50,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Steven Oscar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "Form Input Interaktif dengan Navigasi Drawer",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.check,
                      size: 30,
                      color: currentIndex == 0 ? Colors.lightBlueAccent : null,
                    ),
                    title: Text(
                      "Syarat & Ketentuan",
                      style: TextStyle(
                        color: currentIndex == 0 ? Colors.blue : null,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.toggle_on,
                      size: 30,

                      color: currentIndex == 1 ? Colors.lightBlueAccent : null,
                    ),
                    title: Text(
                      "Mode Gelap",
                      style: TextStyle(
                        color: currentIndex == 1 ? Colors.blue : null,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.category,
                      size: 30,

                      color: currentIndex == 2 ? Colors.lightBlueAccent : null,
                    ),
                    title: Text(
                      "Pilih Kategori Produk",
                      style: TextStyle(
                        color: currentIndex == 2 ? Colors.blue : null,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentIndex = 2;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.calendar_month,
                      size: 30,

                      color: currentIndex == 3 ? Colors.lightBlueAccent : null,
                    ),
                    title: Text(
                      "Pilih Tanggal Lahir",
                      style: TextStyle(
                        color: currentIndex == 3 ? Colors.blue : null,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.alarm,
                      size: 30,

                      color: currentIndex == 4 ? Colors.lightBlueAccent : null,
                    ),
                    title: Text(
                      "Atur Pengingat",
                      style: TextStyle(
                        color: currentIndex == 4 ? Colors.blue : null,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentIndex = 4;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, size: 30, color: Colors.red),
                    title: Text("Logoout", style: TextStyle(color: Colors.red)),
                    onTap: () {
                      setState(() {
                        PreferenceHandler.setLogin(false);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/tugas_6",
                          (route) => false,
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _screen[currentIndex],
    );
  }
}
