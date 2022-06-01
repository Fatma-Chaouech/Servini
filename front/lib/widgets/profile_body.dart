import 'package:flutter/material.dart';
import 'package:servini_app/constants/colors.dart';
import 'package:servini_app/handlers/request_backend.dart';
import 'package:servini_app/widgets/person_card.dart';
import 'package:servini_app/widgets/requests_page.dart';
import 'package:servini_app/widgets/title_row.dart';
import 'package:servini_app/widgets/offer.dart';
import 'package:servini_app/widgets/offers_page.dart';
import '../handlers/offer_backend.dart';
import '../handlers/user_backend.dart';

class ProfileBody extends StatelessWidget {
  String username;
  ProfileBody({Key? key,required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(size.height * 0.03,0,size.height * 0.03,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.04),

              const Text(
                "About",
                style: TextStyle(
                  color: writingBlue,
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              FutureBuilder(
                  future: getUser(username),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(snapshot.connectionState==ConnectionState.done){
                      if (snapshot.data == null) {
                        return Text('no data');
                      }
                      else {

                        return Text(snapshot.data["bio"],
                            style: TextStyle(fontSize: 16, fontFamily: "Gilroy"));
                      }

                    }
                    else {return CircularProgressIndicator();}
                  }
              ),

            ],
          ),
          SizedBox(height: size.height * 0.03),
          titleRow("Offers",OffersPage(username: username),context),
          FutureBuilder(
            future: getOffersByUsername(username),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              print(snapshot.hasData);
              if(snapshot.hasData){
                if(snapshot.data.length==0){
                  return Center(
                    child: Text('no data',style:TextStyle(fontSize: 20)),
                  );
                }
                else{
                  print(snapshot.data);
                  return OfferRequestWidget(disponibility: snapshot.data[0]["disponibility"].toString(), description: snapshot.data[0]["description"].toString(), price: snapshot.data[0]["price"].toString(), title: snapshot.data[0]["title"].toString(), category: snapshot.data[0]["category"].toString(),

                  );
                }

              }
              else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),


          SizedBox(height: size.height * 0.03),
          titleRow("Requests",RequestsPage(username: username),context),
          FutureBuilder(
            future: getRequestsByUsername(username),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              print(snapshot.hasData);
              if(snapshot.hasData){
                if(snapshot.data.length==0){
                  return Center(
                    child: Text('no data',style:TextStyle(fontSize: 20)),
                  );
                }
                else{
                  print(snapshot.data);
                  return OfferRequestWidget(disponibility: snapshot.data[0]["disponibility"].toString(), description: snapshot.data[0]["description"].toString(), price: snapshot.data[0]["price"].toString(), title: snapshot.data[0]["title"].toString(), category: snapshot.data[0]["category"].toString(),

                  );
                }

              }
              else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),

          SizedBox(height: size.height * 0.03),
       // titleRow("Recommendations",RecommendationsPage(username:username),context),
          SizedBox(height: size.height * 0.025),
          PersonCard(
              name: "Foulen",
              lastName: "Fouleni",
              description:
                  "Firas is a very professional science tutor. Highly recommend!",
              nbStars: 4.5,
              pic: "assets/user.png"),
          SizedBox(height: size.height * 0.025),
          PersonCard(
              name: "Foulen",
              lastName: "Fouleni",
              description:
                  "Firas is a very professional science tutor. Highly recommend!",
              nbStars: 4,
              pic: "assets/user.png"),
        ],
      ),
    );
  }
}
