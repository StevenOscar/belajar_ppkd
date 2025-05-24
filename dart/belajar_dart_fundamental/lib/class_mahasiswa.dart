class Mahasiswa {
  // nama lengkap
  String nama;

  //umur
  int umur;

  //tinggi badan
  double tinggi;

  //status aktif mahasiswa
  bool statusAktif;

  //buku
  List<String> bukuFavorit;

  // ingfo tambahan
  Map<String, dynamic> ingfo;

  Mahasiswa({
    this.nama = "default name",
    this.umur = 999,
    this.tinggi = 999.9,
    this.statusAktif = true,
    this.bukuFavorit = const ["Buku 1","Buku 2"],
    this.ingfo = const {"alamat":"default alamat", "telp" : "9999999"},
  });


  void tampilkanBiodata(){
    print("====== BIODATA ANGGOTA ======");
    print("Nama saya $nama");
    print("Umur saya $umur tahun");
    print("Tinggi saya $tinggi cm");
    print("Saya ${statusAktif == true ? "adalah" : "bukan"} mahasiswa aktif");
    print("\nBuku favorit saya :");
    for(int i = 0; i< bukuFavorit.length; i++){
      print("${i+1}. ${bukuFavorit[i]}");
    }
    print("\nIngfo tambahan :");
    for(dynamic info in ingfo.entries){
      print("${info.key} :  ${info.value}");
    }

    print("\n\n");
  }
}