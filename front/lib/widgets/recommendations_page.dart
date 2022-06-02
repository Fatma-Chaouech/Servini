import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servini_app/handlers/recommendation_backend.dart';
import 'package:servini_app/widgets/person_card.dart';


class RecommendationsPage extends StatefulWidget {
  String username;
  RecommendationsPage({Key? key,required this.username}) : super(key: key);
  @override
  State<RecommendationsPage> createState() => _MyRecommendationsPage();
}

class _MyRecommendationsPage extends State<RecommendationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text("Recommendations page",style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body:
      FutureBuilder(
          future: getRecommendationsByUser(widget.username),
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
                    return PersonCard(
                        fullname: '${snapshot.data[index]["giver"]["username"]}',

                        description:
                        '${snapshot.data[index]["description"]}',
                        nbStars: double.parse('${snapshot.data[index]["rating"]}'),
                        pic: "assets/user.png");
                  },

                );
              }}
            else {return CircularProgressIndicator();}
          }
      ),
    );
  }

}