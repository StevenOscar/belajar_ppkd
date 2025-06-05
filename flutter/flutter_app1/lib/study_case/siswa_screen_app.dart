import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/study_case/db_helper_siswa.dart';
import 'package:flutter_app1/study_case/siswa_model.dart';

class SiswaScreenApp extends StatefulWidget {
  static String id = "/siswa_screen_app";
  const SiswaScreenApp({super.key});

  @override
  State<SiswaScreenApp> createState() => _SiswaScreenAppState();
}

class _SiswaScreenAppState extends State<SiswaScreenApp> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController umurController = TextEditingController();

  List<SiswaModel> daftarSiswa = [];

  @override
  void initState() {
    muatData();
    super.initState();
  }

  Future<void> muatData() async {
    final data = await DbHelperSiswa.getAllSiswa();
    setState(() {
      daftarSiswa = data;
    });
  }

  Future<void> simpanData() async {
    final nama = namaController.text;
    final umur = int.tryParse(umurController.text) ?? 0;

    if (nama.isNotEmpty && umur > 0) {
      await DbHelperSiswa.insertSiswa(SiswaModel(nama: nama, umur: umur));
      namaController.clear();
      umurController.clear();
      muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pendaftaran Siswa")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: "nama"),
            ),
            TextField(
              controller: umurController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(labelText: "umur"),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: simpanData, child: Text("Simpan")),
            Divider(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: daftarSiswa.length,
                itemBuilder: (context, index) {
                  final siswa = daftarSiswa[index];
                  return ListTile(
                    tileColor: Colors.lightBlueAccent,
                    leading: CircleAvatar(
                      radius: 30,
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(siswa.nama),
                    subtitle: Text("Umur: ${siswa.umur}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
