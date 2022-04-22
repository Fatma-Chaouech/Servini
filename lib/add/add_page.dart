import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../colors.dart';
import 'simple_input_field.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);
  @override
  State<AddPage> createState() => _MyAddPage();
}

class _MyAddPage extends State<AddPage> {
  final gradient = const LinearGradient(
      colors: [darkRed, darkOrange],
      begin: Alignment.centerLeft,
      end: Alignment.center
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: coldBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Container(
          margin: EdgeInsets.fromLTRB(size.width * 0.05,size.width * 0.05,0,0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(""),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               ShaderMask(
                 shaderCallback: (Rect bounds) {
                   return gradient.createShader(const Rect.fromLTWH(20, 120, 120, 80));
                 },
                 child: const Text(
                  "Add Offer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                 ),
               ),
              SizedBox(height: size.height * 0.05),
              Center(
                child: simpleInputField(
                  size.width * 0.75,
                  size.height * 0.07,
                  "Title*",
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Center(
                child: simpleInputField(
                  size.width * 0.75,
                  size.height * 0.07,
                  "Category*",
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Center(
                child: simpleInputField(
                  size.width * 0.75,
                  size.height * 0.07,
                  "Description",
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Center(
                child: simpleInputField(
                  size.width * 0.75,
                  size.height * 0.07,
                  "Password",
                ),
              ),
              /*DropdownButton<String>(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  value: 'One',
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                onChanged: (String? newValue) {
                  setState(() {

                  });
                },
              )*/
          ],
        ),
      )
    );

  }
}

