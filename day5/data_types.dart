void main() {
  String nama = "oscar";
  print(nama);
  double pi = 3.14;
  print(pi);
  int i = 3;
  print(i);
  bool isTrue = true; // biasa untuk pengambilang keputusan
  print(isTrue);

  String namaDepan = "Steven";
  String namaBelakang = "Oscar";
  int umur = 21;
  List<String> hobi = ["Gaming ", "Baca ", "Tidur "];

  print("Nama saya ${namaDepan + " " + namaBelakang} umur saya ${umur + 2}, hobi saya ${hobi[0] + hobi[1] + hobi[2]}");
}
