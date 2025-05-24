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
    print("Nama saya ${nama}");
    print("Umur saya $umur tahun");
    print("Tinggi saya $tinggi cm");
    print("Saya ${statusAktif == true ? "adalah" : "bukan"} mahasiswa aktif");
    print("\nBuku favorit saya :");
    for(int i = 0; i< bukuFavorit.length; i++){
      print("${i+1}. ${bukuFavorit[i]}");
    };
    print("\nIngfo tambahan :");
    for(dynamic info in ingfo.entries){
      print("${info.key} :  ${info.value}");
    };

    print("\n\n");
  }
}

void main() {
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
  };
}


