import 'dart:io';

void tampilkanGanjil(int limit) {
  List<int> listGanjil = [];
  for (int i = 0; i < limit; i++) {
    if (i % 2 == 1) {
      listGanjil.add(i);
    }
  }

  print("Bilangan Ganjil dari 1 - $limit adalah : $listGanjil");
}

void cetakKarakter(int bintang) {
  for (int i = 0; i < bintang; i++) {
    stdout.write("* ");
  }
}

void namaBerulang(String nama, int pengulangan) {
  for (int i = 0; i < pengulangan; i++) {
    print(nama);
  }
}

void perulanganDalamList(List<String> objects) {
  for (String object in objects) {
    print("Saya suka $object");
  }
}

void daftarBelanja(List<String> shoppingList) {
  for (int i = 0; i < shoppingList.length; i++) {
    print("Item ke-${i + 1}: ${shoppingList[i]}");
  }
}

void main() {
  List<String> buah = ["Apel", "Jeruk", "Mangga", "Anggur"];
  List<String> hewan = ["Kucing", "Anjing", "Burung", "Ikan"];
  List<String> shoppingList = ["Kecap", "Garam", "Beras", "Minyak", "bBawang"];

  print("Soal Nomor 1");
  tampilkanGanjil(20);
  print("\nSoal Nomor 2");
  cetakKarakter(5);
  print("\nSoal Nomor 3");
  namaBerulang("Steven Oscar", 4);
  print("\nSoal Nomor 4");
  perulanganDalamList(buah);
  print("\nSoal Nomor 5");
  daftarBelanja(shoppingList);
}
