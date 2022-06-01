import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../handlers/offer_backend.dart';
import '../handlers/request_backend.dart';
import 'offer.dart';

class RequestsPage extends StatefulWidget {
  String username;
  RequestsPage({Key? key,required this.username}) : super(key: key);
  @override
  State<RequestsPage> createState() => _MyRequestsPage();
}

class _MyRequestsPage extends State<RequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(widget.username+"'s Requests page",style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body:
      FutureBuilder(
          future: getRequestsByUsername(widget.username),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState==ConnectionState.done){
              if (snapshot.data == null) {
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
              else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return OfferRequestWidget(disponibility: snapshot.data[index]["disponibility"].toString(),
                      description: snapshot.data[index]["description"].toString(),
                      price: snapshot.data[index]["price"].toString(),
                      title: snapshot.data[index]["title"].toString(),
                      category: snapshot.data[index]["category"].toString(),);
                  },

                );
              }}
            else {return CircularProgressIndicator();}
          }
      ),
    );
  }

}