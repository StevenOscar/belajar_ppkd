import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> kategori = [
      "Buah-buahan",
      "Sayuran",
      "Elektronik",
      "Pakaian Pria",
      "Pakaian Wanita",
      "Alat Tulis Kantor",
      "Buku & Majalah",
      "Peralatan Dapur",
      "Makanan Ringan",
      "Minuman",
      "Mainan Anak",
      "Peralatan Olahraga",
      "Produk Kesehatan",
      "Kosmetik",
      "Obat-obatan",
      "Aksesoris Mobil",
      "Perabot Rumah",
      "Sepatu & Sandal",
      "Barang Bekas",
      "Voucher & Tiket",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: kategori.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              "${index + 1}. ${kategori[index]}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
