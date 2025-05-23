import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TugasEmpatFlutter extends StatelessWidget {
  const TugasEmpatFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> itemList = [
      Product(
        imageUrl: "assets/images/tugas_4/energen_cokelat.jpeg",
        name: "Energen Cokelat 1 Renceng isi 10 Sachet",
        price: 19850,
      ),
      Product(
        imageUrl: "assets/images/tugas_4/gentle_gen.jpeg",
        name: "Gentle Gen Detergent Cair 1 Renceng 14 Sachet",
        price: 10950,
      ),
      Product(
        imageUrl: "assets/images/tugas_4/garam.jpeg",
        name: "4 bungkus Garam Daun Beryodium 250 gram",
        price: 8850,
      ),
      Product(
        imageUrl: "assets/images/tugas_4/energen_kacang.jpeg",
        name: "Energen Kacang Hijau 1 renceng isi 10 sachet",
        price: 19850,
      ),
      Product(
        imageUrl: "assets/images/tugas_4/m150.jpeg",
        name: "M 150 Energi Drink 150 ml Kemasan Botol",
        price: 4900,
      ),
    ];
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 0.8],
            ),
          ),
        ),
        title: Text(
          "Form and Product List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.all(6),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback:
                  (bounds) => LinearGradient(
                    colors: [Colors.pink, Colors.deepPurple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.2, 0.8],
                  ).createShader(bounds),
              child: Icon(Icons.shopping_cart_checkout_outlined),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 28, bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  offset: Offset(1.2, 0.5),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: TextFormFieldWidget(
                    hintText: "Name",
                    controller: nameController,
                    prefixIcon: Icons.person_outline,
                    onChanged: (p0) {
                      print("Nama : $p0");
                    },
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: TextFormFieldWidget(
                    hintText: "Email",
                    controller: emailController,
                    prefixIcon: Icons.mail_outline,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (p0) {
                      print("Email : $p0");
                    },
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: TextFormFieldWidget(
                    hintText: "Phone Number",
                    controller: phoneController,
                    prefixIcon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (p0) {
                      print("Phone : $p0");
                    },
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: TextFormFieldWidget(
                    hintText: "Add desciption here...",
                    controller: descController,
                    maxLines: 6,
                    borderRadius: BorderRadius.circular(16),
                    onChanged: (p0) {
                      print("Description : $p0");
                    },
                  ),
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.2, 0.8],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Center(
                          child: Text(
                            "Form Data",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "Name : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text:
                                        nameController.text.isEmpty
                                            ? "No data"
                                            : nameController.text,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: "Email : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text:
                                        emailController.text.isEmpty
                                            ? "No data"
                                            : emailController.text,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: "Phone Number : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text:
                                        phoneController.text.isEmpty
                                            ? "No data"
                                            : phoneController.text,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: "Desciption : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text:
                                        descController.text.isEmpty
                                            ? "No data"
                                            : descController.text,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                );
              },
              child: Text(
                "Submit",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "Product List",
              style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: itemList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.deepPurpleAccent,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {},
                    splashColor: Colors.deepPurple[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    tileColor: Colors.white,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(itemList[index].imageUrl),
                    ),
                    trailing: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.deepPurple,
                    ),
                    title: Text(
                      itemList[index].name,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    subtitle: Text(
                      "Rp. ${NumberFormat('###,###,###', 'id_ID').format(itemList[index].price).toString()}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final int? maxLines;
  final TextInputType? keyboardType;
  final BorderRadius? borderRadius;
  final Function(String) onChanged;
  final List<TextInputFormatter>? inputFormatters;
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    this.prefixIcon,
    required this.controller,
    this.maxLines,
    this.keyboardType,
    this.borderRadius,
    required this.onChanged,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      inputFormatters: inputFormatters,
      style: TextStyle(color: Colors.deepPurple),
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(fontStyle: FontStyle.italic),
        prefixIcon:
            prefixIcon != null
                ? Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.pink, Colors.deepPurple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.2, 0.8],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(prefixIcon, color: Colors.white, size: 24),
                )
                : null,
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class Product {
  String imageUrl;
  String name;
  int price;

  Product({required this.imageUrl, required this.name, required this.price});
}
