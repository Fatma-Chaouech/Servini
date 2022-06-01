import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servini_app/handlers/offer_backend.dart';
import 'package:servini_app/handlers/request_backend.dart';

import '../modals/offer.dart';
import '../widgets/choice.dart';
import '../widgets/offer.dart';

class CategoryOfferRequest extends StatefulWidget {
  String title;
  bool ticked1=true,ticked2=false;
   CategoryOfferRequest({Key? key,required this.title}) : super(key: key);
  @override
  State<CategoryOfferRequest> createState() => _CategoryOfferRequest();
}

class _CategoryOfferRequest extends State<CategoryOfferRequest> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:20),
            Row(

              children: [
                GestureDetector(child: Icon(Icons.arrow_back),
                    onTap: ()=> Navigator.pop(context)),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Color(0xFF424E5E),
                      fontFamily: "Gilroy",
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap:(){
                        setState(() {
                          widget.ticked1=true;
                          widget.ticked2=false;
                        });
                    },
                      child: Choice(text:"Offers",ticked:widget.ticked1)),
                  SizedBox(width: 20,),
                  GestureDetector(onTap:(){
                    setState(() {
                      widget.ticked2=true;
                      widget.ticked1=false;
                    });
                  },child: Choice(text:"Requests",ticked:widget.ticked2))
                ],
              ),
            ),
            Stack(
              children: [
                Offstage(
                  offstage: widget.ticked1==true,
                  child: FutureBuilder(
                    future: getRequestsByCategory(widget.title),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      print(snapshot.hasData);
                      if(snapshot.hasData){
                        if(snapshot.data.length==0){
                          return Padding(
                            padding: const EdgeInsets.all(50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Image.asset("assets/underconstruction.png"),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:40,vertical:20),
                                  child: Text("Oops! it looks like there are no options available yet",textAlign:TextAlign.center,style:TextStyle(fontFamily: "Gilroy",fontSize: 20)),
                                )],
                            ),
                          );
                        }
                        else{
                          return  ListView.builder(

                              shrinkWrap: true,
                              itemCount:  snapshot.data.length,
                              itemBuilder: (context, index) {

                                return OfferRequestWidget(title: snapshot.data[index]["title"], description:snapshot.data[index]["description"],price: snapshot.data[index]["price"], disponibility: snapshot.data[index]["disponibility"], category: widget.title,);
                              });
                        }

                      }
                      else{
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                Offstage(
                  offstage: widget.ticked2==true,
                  child: FutureBuilder(
                    future: getOffersByCategory(widget.title),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      print(snapshot.hasData);
                      if(snapshot.hasData){
                        if(snapshot.data.length==0){
                          return Padding(
                            padding: const EdgeInsets.all(50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Image.asset("assets/underconstruction.png"),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:40,vertical:20),
                                  child: Text("Oops! it looks like there are no options available yet",textAlign:TextAlign.center,style:TextStyle(fontFamily: "Gilroy",fontSize: 20)),
                                )],
                            ),
                          );
                        }
                        else{
                          return  ListView.builder(

                              shrinkWrap: true,
                              itemCount:  snapshot.data.length,
                              itemBuilder: (context, index) {

                                return OfferRequestWidget(title: snapshot.data[index]["title"], description:snapshot.data[index]["description"],price: snapshot.data[index]["price"], disponibility: snapshot.data[index]["disponibility"], category: widget.title,);
                              });
                        }

                      }
                      else{
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

}