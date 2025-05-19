
import 'package:belajar_dart_fundamental/class_mahasiswa.dart';
import 'package:belajar_dart_fundamental/function_return_value.dart';
import 'package:belajar_dart_fundamental/tugas2.dart';

void main(List<String> arguments) {
  // nama lengkap
  String nama = "Steven Oscar";

  //umur
  int umur = 22;

  //tinggi badan
  double tinggi = 165;

  //status aktif mahasiswa
  bool statusAktif = false;

  //buku
  List<String> bukuFavorit = [
    "heri poter",
    "lord o de ring",
    "belajar huruf & angka untuk anak 5 tahun",
  ];

  // ingfo tambahan
  Map<String, dynamic> ingfo = {
    "telp" : "081210443108",
    "email" : "stevenoscar458@gmail.com",
    "profesi" : "Nganggur",
    "alamat" : "Bekasi",
    "biji" : 2,
  };

  // Membuat object mahasiswa dengan value dari variabel yang telah didefinisikan
  Mahasiswa mahasiswa1 = Mahasiswa(
    nama : nama,
    umur : umur,
    tinggi : tinggi,
    bukuFavorit : bukuFavorit,
    statusAktif : statusAktif,
    ingfo : ingfo,
  );

  // Membuat object mahasiswa dengan value yang didefiniskan langsung
  Mahasiswa mahasiswa2 = Mahasiswa(
    nama : "sokdaodkosakdsaod",
    umur : 34,
    tinggi : 177.8,
    statusAktif : false,
    bukuFavorit : ["seni adalah ledakan", "tidur yang cukup untuk kesehatan"],
    ingfo : {
      "alamat" : "pluto"
    },
  );

  // Membuat object mahasiswa dengan default value dari constructor
  Mahasiswa mahasiswa3 = Mahasiswa();

  List<Mahasiswa> listMahasiswa = [mahasiswa1,mahasiswa2,mahasiswa3];

  for(Mahasiswa mahasiswa in listMahasiswa){
    mahasiswa.tampilkanBiodata();
  }

  print("Hasil pengurangan : ${kurang(8, 3)}");

  int uts = 90;
  int uas = 60;
  double kehadiran = 0.75;

  cekKelulusan(
    uts: uts,
    uas: uas,
    kehadiran: kehadiran,
  );
  // int bil1 = int.parse(stdin.readLineSync()!);
  // int bil2 = int.parse(stdin.readLineSync()!);
  // print("jumlah : ${bil1+bil2}");
}
