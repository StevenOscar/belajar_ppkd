import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListMapPage extends StatelessWidget {
  const ListMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> kategori = [
      {"nama": "Buah-buahan", "icon": FaIcon(FontAwesomeIcons.lemon, size: 20)},
      {"nama": "Sayuran", "icon": FaIcon(FontAwesomeIcons.carrot, size: 20)},
      {"nama": "Elektronik", "icon": FaIcon(FontAwesomeIcons.bolt, size: 20)},
      {
        "nama": "Pakaian Pria",
        "icon": FaIcon(FontAwesomeIcons.shirt, size: 20),
      },
      {
        "nama": "Pakaian Wanita",
        "icon": FaIcon(FontAwesomeIcons.personDress, size: 20),
      },
      {
        "nama": "Alat Tulis Kantor",
        "icon": FaIcon(FontAwesomeIcons.pencil, size: 20),
      },
      {
        "nama": "Buku & Majalah",
        "icon": FaIcon(FontAwesomeIcons.book, size: 20),
      },
      {
        "nama": "Peralatan Dapur",
        "icon": FaIcon(FontAwesomeIcons.utensils, size: 20),
      },
      {
        "nama": "Makanan Ringan",
        "icon": FaIcon(FontAwesomeIcons.cookie, size: 20),
      },
      {"nama": "Minuman", "icon": FaIcon(FontAwesomeIcons.mugHot, size: 20)},
      {
        "nama": "Mainan Anak",
        "icon": FaIcon(FontAwesomeIcons.gamepad, size: 20),
      },
      {
        "nama": "Peralatan Olahraga",
        "icon": FaIcon(FontAwesomeIcons.volleyball, size: 20),
      },
      {
        "nama": "Produk Kesehatan",
        "icon": FaIcon(FontAwesomeIcons.suitcaseMedical, size: 20),
      },
      {
        "nama": "Kosmetik",
        "icon": FaIcon(FontAwesomeIcons.faceSmileBeam, size: 20),
      },
      {"nama": "Obat-obatan", "icon": FaIcon(FontAwesomeIcons.pills, size: 20)},
      {
        "nama": "Aksesoris Mobil",
        "icon": FaIcon(FontAwesomeIcons.carSide, size: 20),
      },
      {
        "nama": "Perabot Rumah",
        "icon": FaIcon(FontAwesomeIcons.couch, size: 20),
      },
      {
        "nama": "Sepatu & Sandal",
        "icon": FaIcon(FontAwesomeIcons.shoePrints, size: 20),
      },
      {
        "nama": "Barang Bekas",
        "icon": FaIcon(FontAwesomeIcons.recycle, size: 20),
      },
      {
        "nama": "Voucher & Tiket",
        "icon": FaIcon(FontAwesomeIcons.ticket, size: 20),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Map",
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
              "${kategori[index]["nama"]}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: kategori[index]["icon"],
          );
        },
      ),
    );
  }
}
