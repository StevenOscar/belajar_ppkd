/*
Studi Kasus: Sistem Penilaian Mahasiswa

Sebuah perguruan tinggi ingin membuat sistem sederhana untuk menilai kelulusan mahasiswa berdasarkan nilai UTS, UAS, dan kehadiran.

Mahasiswa akan lulus jika:
- Rata-rata nilai UTS dan UAS minimal 70
- Kehadiran minimal 75%
- DAN salah satu nilai (UTS atau UAS) tidak boleh di bawah 60

Instruksi Tugas:
Buat variabel untuk menyimpan:
int uts → nilai UTS
int uas → nilai UAS
double kehadiran → nilai kehadiran dalam persen


Hitung:
Rata-rata nilai akhir dari UTS dan UAS
Gunakan relational operator untuk mengecek syarat kelulusan.
Gunakan logical operator untuk menggabungkan semua kondisi.
Cetak apakah mahasiswa LULUS atau TIDAK LULUS.

*/


void cekKelulusan({
  required int uts,
  required int uas,
  required double kehadiran,
}){
  double average = (uts+uas)/2;

  print("=========== CEK KELULUSAN ===========");
  print("Nilai UTS : $uts (Minimal 60)");
  print("Nilai UAS : $uas (Minimal 60)");
  print("Rata-rata Nilai UTS & UAS : $average (Minimal 70)");
  print("Tingkat kehadiran : ${(kehadiran * 100).toInt()}%  (Minimal 75%)");
  print("=====================================");


  if(
    average >= 70 &&              // Rata-rata nilai UTS dan UAS
    kehadiran >= 0.75 &&          // Kehadiran
    !(uts < 60 || uas < 60)       // Salah satu nilai (UTS atau UAS) tidak boleh di bawah 60
  ){
    print("Selamat, anda LULUS");
  } else {
    print("Mohon maaf, anda TIDAK LULUS");
  }
}
