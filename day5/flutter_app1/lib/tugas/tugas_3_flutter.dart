import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TugasTigaFlutter extends StatelessWidget {
  const TugasTigaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [
      Color(0xFFAA60C8),
      Color(0xFFD69ADE),
      Color(0xFFEABDE6),
      Color(0xFFFFDFEF),
      Color(0xFF8F87F1),
      Color(0xFFC68EFD),
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
          "Form and Gallery",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
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
                  SizedBox(height: 12),
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
                            spacing: 5,
                            children: [
                              Text(
                                "Name : ${nameController.text.isEmpty ? "No data" : nameController.text}",
                              ),
                              Text(
                                "Email : ${emailController.text.isEmpty ? "No data" : emailController.text}",
                              ),
                              Text(
                                "Phone Number : ${phoneController.text.isEmpty ? "No data" : phoneController.text}",
                              ),
                              Text(
                                "Description : ${descController.text.isEmpty ? "No data" : descController.text}",
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
            GridView.count(
              shrinkWrap: true,
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 24,
                horizontal: 8,
              ),
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              childAspectRatio: 3 / 4,
              mainAxisSpacing: 8,
              crossAxisCount: 2,
              children: <Widget>[
                for (int i = 0; i < colorList.length; i++)
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: colorList[i],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1.2, 0.5),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Color ${i + 1}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
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
      style: TextStyle(color: Colors.deepPurple),
      onChanged: onChanged,
      inputFormatters: inputFormatters,
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
