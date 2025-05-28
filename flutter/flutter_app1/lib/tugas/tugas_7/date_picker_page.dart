import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime? selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: selectedDate,
                  lastDate: DateTime.now(),
                  builder:
                      (context, child) => Localizations.override(
                        context: context,
                        locale: Locale("id"),
                        child: child!,
                      ),
                );
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: Text(
                "Pilih Tanggal Lahir",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Tanggal lahir : ${selectedDate == null ? "Pilih tanggal terlebih dahulu!" : DateFormat("dd MMMM yyyy", "id").format(selectedDate!)}",
          ),
        ],
      ),
    );
  }
}
