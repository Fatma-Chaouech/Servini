import 'package:flutter/material.dart';
import 'package:servini_app/screens/category_offer_request.dart';

import '../modals/category.dart';
import '../widgets/category.dart';
import '../widgets/choice.dart';
import 'package:servini_app/handlers/category_backend.dart';
import 'package:searchfield/searchfield.dart';
class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);
  @override
  State<CategoryWidget> createState() => Categories();
}

class Categories extends State<CategoryWidget> {
 NetworkHelper networkHelper=NetworkHelper("http://10.0.2.2:3000/category");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<String> test=['countries','test','wow'];
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.03, size.width * 0.05, 0),
          children: [
            Row(

              children: [
                GestureDetector(child: Icon(Icons.arrow_back),
                onTap: ()=> Navigator.pop(context)),
                SizedBox(
                  width: size.height * 0.04,
                ),
                const Text(
                  "Categories",
                  style: TextStyle(
                      color: Color(0xFF424E5E),
                      fontFamily: "Gilroy",
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),FutureBuilder(
              future: networkHelper.fetchCategory(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData){
        List<Category> categories=snapshot.data;
                  return SearchField<Category>(
                    suggestions: categories
                        .map(
                          (e) => SearchFieldListItem<Category>(
                        e.title,//e.name
                        item: e,
                      ),
                    )
                        .toList(),
                  );}
                else{
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),

            SearchField<String>(
              suggestions: test
                  .map(
                    (e) => SearchFieldListItem<String>(
                  e,//e.name
                  item: e,
                ),
              )
                  .toList(),
            ),
        FutureBuilder(
            future: networkHelper.fetchCategory(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.hasData){
              return ListView.builder(
                  shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Category category = snapshot.data[index];
                return GestureDetector(
                  onTap: ()=> Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryOfferRequest(title:category.title)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Category2(
                          name: category.title,
                          description:
                          category.description,
                          //Does your house need painting? aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                          image: category.pic,
                          isRight: true),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                    ],
                  ),
                );
              });}
            else{
              return Center(child: CircularProgressIndicator());
              }
      },
      )
          ],
        ),
      ),
    );
  }
}
/*
Category2(
                name: "Painter",
                description:
                    "Does your house need painting?", //Does your house need painting? aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                image: "assets/ice_cream.png",
                isRight: true),
            SizedBox(
              height: size.height * 0.05,
            ),
            Category2(
                name: "Petsitter",
                description:
                    "Are you worried about letting your pet alone for a while?",
                image: "assets/corgi.png",
                isRight: true),
            SizedBox(
              height: size.height * 0.05,
            ),
            Category2(
                name: "Cameraman",
                description:
                    "Do you have an important event that needs to be immortalized?",
                image: "assets/camera.png",
                isRight: true),
            SizedBox(
              height: size.height * 0.05,
            ),
            Category2(
                name: "Caterer",
                description:
                    "Do you need someone to take care of preparing your dinner?",
                image: "assets/cake.png",
                isRight: true),
            SizedBox(height: size.height * 0.05)
*/

/*
Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Choice(text: "Favourite", ticked: false),
                  Choice(text: "Recent", ticked: false),
                  Choice(text: "Trending", ticked: false),
                  Choice(text: "All", ticked: true)
                ]),
            SizedBox(
              height: size.height * 0.07,
            ),
 */