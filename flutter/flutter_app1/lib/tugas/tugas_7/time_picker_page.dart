import 'package:flutter/material.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({super.key});

  @override
  State<TimePickerPage> createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  TimeOfDay? selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () async {
                  TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: selectedTime!,
                    builder:
                        (context, child) => Localizations.override(
                          context: context,
                          locale: const Locale('en', 'US'),
                          child: child!,
                        ),
                  );
                  if (picked != null) {
                    setState(() {
                      selectedTime = picked;
                    });
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Pengingat diatur pukul: ${selectedTime?.format(context)}",
                        ),
                      ),
                    );
                  }
                },
                child: Text("Atur Pengingat", style: TextStyle(color: Colors.white),),
              ),
            ),
            SizedBox(height: 20,),
            Text("Pengingat diatur pukul ${selectedTime?.format(context)}"),
          ],
        ),
      ),
    );
  }
}
