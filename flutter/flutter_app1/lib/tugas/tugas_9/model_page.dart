import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_9/product_model.dart';
import 'package:intl/intl.dart';

class ModelPage extends StatefulWidget {
  const ModelPage({super.key});

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Map  (Barang Bekas)",
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
        itemCount: productList.length,
        padding: EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (BuildContext context, int index) {
          final product = productList[index];
          return Card(
            elevation: 2,
            shadowColor: Colors.red,
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.asset(
                        product.productImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 24,
                    ),
                    child: Text(
                      "Rp. ${NumberFormat('###,###,###', 'id_ID').format(product.productPrice).toString()}",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      product.productName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Divider(thickness: 3, color: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    child: Text(
                      product.productDescription,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
