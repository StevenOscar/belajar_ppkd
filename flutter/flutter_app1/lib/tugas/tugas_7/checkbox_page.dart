import 'package:flutter/material.dart';
import 'package:flutter_app1/helper/preference_handler.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  activeColor: Colors.blue,
                  value: isChecked,
                  onChanged: (val) {
                    setState(() {
                      isChecked = val!;
                    });
                  },
                ),
                Expanded(
                  child: Text("Saya menyetujui semua persyaratan yang berlaku"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              isChecked
                  ? "Lanjutkan pendaftaran diperbolehkan"
                  : "Anda belum bisa melanjutkan",
            ),
          ],
        ),
      ),
    );
  }
}
