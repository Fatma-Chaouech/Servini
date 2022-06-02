import 'package:flutter/material.dart';
import 'package:servini_app/constants/colors.dart';
import 'package:servini_app/handlers/category_backend.dart';
import 'package:servini_app/screens/welcome_page.dart';
import 'package:servini_app/widgets/bubble_button.dart';
import 'package:servini_app/modals/category.dart';
import '../modals/request.dart';
import '../modals/offer.dart';
import '../handlers/offer_backend.dart';
import '../handlers/request_backend.dart';
class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);
  @override
  State<AddPage> createState() => _MyAddPage();
}

class _MyAddPage extends State<AddPage> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController disponibilityController = TextEditingController();
  NetworkHelper networkHelper = NetworkHelper("http://10.0.2.2:3000/category");
  String? dropdownValue;
  String dropdownValue2 = 'Offer';
  late List categories;
  _MyAddPage(){
    convertFutureListToList();
  }
  final gradient = const LinearGradient(
      colors: [darkRed, darkOrange],
      begin: Alignment.centerLeft,
      end: Alignment.center
  );
  void convertFutureListToList() async {
    Future<List<Category>> _futureOfList = networkHelper.fetchCategory();
    List list = await _futureOfList ;
    categories=list;
    dropdownValue=list.first.title;
  }
  @override
  Widget build(BuildContext context) {

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
        resizeToAvoidBottomInset: true,
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   ShaderMask(
                     shaderCallback: (Rect bounds) {
                       return gradient.createShader(const Rect.fromLTWH(20, 120, 120, 80));
                     },
                     child: const Text(
                      "Add Offer/Request",
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
                         width: size.width * 0.7,
                         child:
                         DropdownButton<String>(
                           value: dropdownValue2,
                           icon: const Icon(Icons.arrow_downward),
                           iconSize: 24,
                           elevation: 16,
                           isExpanded:true,
                           style: const TextStyle(
                               color: Colors.black
                           ),
                           underline: Container(
                             height: 2,
                             color: Colors.orange,
                           ),
                           onChanged: (String? newValue) {
                             setState(() {
                               dropdownValue2 = newValue!;
                             });
                           },
                           items: <String>['Offer', 'Request']
                               .map<DropdownMenuItem<String>>((String value) {
                             return DropdownMenuItem<String>(
                               value: value,
                               child: Text(value),
                             );
                           })
                               .toList(),
                         )
                     ),
                   ),
                   SizedBox(height: size.height * 0.05),
                   Center(
                     child: SizedBox(
                       // height: size.height * 0.07,
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
                     // height: size.height * 0.07,
                      width: size.width * 0.7,
                      child:FutureBuilder<List<Category>>(
                            future: networkHelper.fetchCategory(),
                             builder: (context, AsyncSnapshot<List> snapshot) {
                            if (snapshot.hasData) {
                             Iterable<String>? data=snapshot.data?.map((e) => e.title).cast<String>();
                            // dropdownValue=data?.first;
                             return DropdownButton<String>(
                               menuMaxHeight: MediaQuery.of(context).size.height*0.4,
                               value: dropdownValue,
                               icon: const Icon(Icons.arrow_downward),
                               iconSize: 24,
                               elevation: 16,
                               isExpanded:true,
                               style: const TextStyle(
                                   color: Colors.black
                               ),
                               underline: Container(
                                 height: 2,
                                 color: Colors.orange,
                               ),
                               onChanged: (String? newValue) {
                                 setState(() {
                                   dropdownValue = newValue!;
                                 });
                               },
                               items: data
                                   ?.map<DropdownMenuItem<String>>((String value) {
                                 return DropdownMenuItem<String>(
                                   value: value,
                                   child: Text(value),
                                 );
                               })
                                   .toList(),
                             );
                               Text(dropdownValue!);
                            } else {
                              return CircularProgressIndicator();
                            }
                          }
                      ),
                  )),// the dropdown!!!!
                  SizedBox(height: size.height * 0.05),
                   Center(
                     child: SizedBox(
                       //height: size.height * 0.07,
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
                       //height: size.height * 0.07,
                       width: size.width * 0.75,
                       child: TextField(
                         controller: disponibilityController,
                         style: const TextStyle(
                           color: writingBlue,
                         ),
                         decoration: InputDecoration(
                           labelText: "Disponibility",
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
                       //height: size.height * 0.07,
                       width: size.width * 0.75,
                       child: TextField(
                         controller: priceController,
                         style: const TextStyle(
                           color: writingBlue,
                         ),
                         decoration: InputDecoration(
                           labelText: "Price",
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
                 GestureDetector(
                     child:bubbleButton(context),
                     onTap: (){

                       String dropdown1=dropdownValue as String;
                       String dropdown2=dropdownValue2 as String;
                          if(dropdown2=='Offer'){

                            Offer offer= Offer(username:"fatma laribi",title: titleController.text,
                                category: dropdown1, disponibility: disponibilityController.text, description: descriptionController.text, price: priceController.text);
                            addOffer(offer);
                            showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Congratulations'),
                                content: Container(
                                  height:MediaQuery.of(context).size.height*0.05,
                                  width:MediaQuery.of(context).size.width*0.7,
                                  child:
                                  Text("New offer added"),

                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },

                                    child: const Text('Ok'),
                                  ),
                                ],
                              );});
                          }
                          else{
                            Request request= new Request(username:"fatma laribi",title: titleController.text,
                                category: dropdown1, disponibility: disponibilityController.text,
                                description: descriptionController.text, price: priceController.text);
                            addRequest(request);
                            showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Congratulations'),
                                content: Container(
                                  height:MediaQuery.of(context).size.height*0.05,
                                  width:MediaQuery.of(context).size.width*0.7,
                                  child:
                                  Text("New request added"),

                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },

                                    child: const Text('Ok'),
                                  ),
                                ],
                              );});
                          }
                       //input fera8 wallé, control
                     },
                 ),
              ],
            ),
          ),
        )
      ),
    );

  }

}





