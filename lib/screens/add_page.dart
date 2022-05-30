import 'package:flutter/material.dart';
import 'package:servini_app/constants/colors.dart';
import 'package:servini_app/widgets/bubble_button.dart';

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
    final TextEditingController categoryController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController titleController = TextEditingController();

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: coldBackground,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(
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
                   child: SizedBox(
                     height: size.height * 0.07,
                     width: size.width * 0.75,
                     child: TextField(
                       controller: titleController,
                       style: const TextStyle(
                         color: writingBlue,
                       ),
                       decoration: InputDecoration(
                         labelText: "Title",
                         enabledBorder: OutlineInputBorder(
                           borderSide: const BorderSide(width: 0, color: Colors.white),
                           borderRadius: BorderRadius.circular(11),
                         ),
                         fillColor: Colors.white,
                         filled: true,
                       ),
                     ),
                   ),
                 ),
                SizedBox(height: size.height * 0.05),
                Center(
                  child: SizedBox(
                    height: size.height * 0.07,
                    width: size.width * 0.75,
                    child: TextField(
                      controller: categoryController,
                      style: const TextStyle(
                        color: writingBlue,
                      ),
                      decoration: InputDecoration(
                          labelText: "Category",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 0, color: Colors.white),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                 Center(
                   child: SizedBox(
                     height: size.height * 0.07,
                     width: size.width * 0.75,
                     child: TextField(
                       controller: descriptionController,
                       style: const TextStyle(
                         color: writingBlue,
                       ),
                       decoration: InputDecoration(
                         labelText: "Description",
                         enabledBorder: OutlineInputBorder(
                           borderSide: const BorderSide(width: 0, color: Colors.white),
                           borderRadius: BorderRadius.circular(11),
                         ),
                         fillColor: Colors.white,
                         filled: true,
                       ),
                     ),
                   ),
                 ),
                SizedBox(height: size.height * 0.05),
                 Center(
                   child: SizedBox(
                     height: size.height * 0.07,
                     width: size.width * 0.75,
                     child: TextField(
                       controller: passwordController,
                       style: const TextStyle(
                         color: writingBlue,
                       ),
                       decoration: InputDecoration(
                         labelText: "Password",
                         enabledBorder: OutlineInputBorder(
                           borderSide: const BorderSide(width: 0, color: Colors.white),
                           borderRadius: BorderRadius.circular(11),
                         ),
                         fillColor: Colors.white,
                         filled: true,
                       ),
                     ),
                   ),
                 ),
               SizedBox(height: size.height * 0.07),
               GestureDetector(
                   child:bubbleButton(context),
                   onTap: (){
                     print("tapped");
                   },
               ),
            ],
          ),
        )
      ),
    );

  }

}





