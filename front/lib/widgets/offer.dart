// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/icon_text.dart';

class OfferRequestWidget extends StatelessWidget {
  String title;
  String disponibility;
  String price;
  String category;
  String description;

  //, price, dateTime, category;
  OfferRequestWidget({Key? key, required this.title,required this.description,required this.disponibility,required this.price,required this.category}) : super(key: key);
  /*  required this.dateTime,
      required this.price,
      required this.category
  });*/
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 112,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFC2BFBF).withOpacity(0.2),
                  blurRadius: 20, // soften the shadow
                  offset: Offset(
                    0, // Move to right 10  horizontally
                    10, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF424E5E)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: IconText(
                                text: disponibility,
                                path: "assets/offer_icons/schedule.png")),
                        Expanded(
                            flex: 1,
                            child: IconText(
                                text: price,
                                path: "assets/offer_icons/pricing.png"))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: IconText(
                                text: category,
                                path: "assets/offer_icons/opened_folder.png")),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              20.0,
                                            ),
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.only(
                                          top: 10.0,
                                        ),
                                        title: Text(
                                          "Details",
                                          style: TextStyle(fontSize: 24.0),
                                        ),
                                        content: SingleChildScrollView(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Container(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text('Title',style: TextStyle(fontSize: 20,fontFamily:"Gilroy",color: Colors.orange),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  title,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              ),

                                              Container(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text('Description',style: TextStyle(fontSize: 20,fontFamily:"Gilroy",color: Colors.orange),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  description,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text('Disponibility',style: TextStyle(fontSize: 20,fontFamily:"Gilroy",color: Colors.orange),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  disponibility,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text('Price',style: TextStyle(fontSize: 20,fontFamily:"Gilroy",color: Colors.orange),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                 price,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions:
                                        <Widget>[
                                          TextButton(
                                            child: const Text('Cancel',style:TextStyle(fontFamily: "Gilroy",color: Colors.black)),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Message',style:TextStyle(fontFamily: "Gilroy",color:  Colors.black)),
                                            onPressed: () {
                                              //create channel with user
                                            },
                                          ),

                                        ],

                                      );
                                    });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset("assets/offer_icons/arrow.png")
                                ],
                              ),
                            ))
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
