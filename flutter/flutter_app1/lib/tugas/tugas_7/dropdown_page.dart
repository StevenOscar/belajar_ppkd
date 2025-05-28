import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  final List<String> productCategories = [
    "Elektronik",
    "Pakaian",
    "Makanan",
    "Lainnya",
  ];
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButton(
                hint: Text("Pilih kategori"),
                borderRadius: BorderRadius.circular(10),
                value: selectedItem,
                items:
                    productCategories
                        .map(
                          (String e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              selectedItem == null
                  ? "Silahkan pilih kategori terlebih dahulu"
                  : "Anda memilih kategori : $selectedItem",
            ),
          ],
        ),
      ),
    );
  }
}
