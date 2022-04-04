import 'package:flutter/material.dart';
import 'package:servini_app/usercontainer.dart';
import 'HomeBar.dart';
import 'colors.dart';
import 'searchbar.dart';
import 'appbar.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _MySearchPage();
}

class _MySearchPage extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coldBackground,
      body: Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: CustomAppBar(),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex : 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "Welcome",
                                    style: TextStyle(
                                      color: writingBlue,
                                      fontFamily: 'GilroyBold',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "John Wattson",
                                    style: TextStyle(
                                      color: writingBlue,
                                      fontFamily: 'GilroyExtraBold',
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/user.png",
                                  width: 55,
                                  fit: BoxFit.cover,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: SearchBar(),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SmallCategory("Babysitter","assets/baby.png",darkRed,lightRed),
                        SmallCategory("Transporter","assets/truck.png",darkBlue, lightBlue),
                        SeeMore(darkYellow, lightYellow),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(25, 30, 20, 0),
                    child: TopRated(),
                  ),
                  const SizedBox(height: 10),
                  UserContainer(),
                  const SizedBox(),
                  UserContainer(),
                  const SizedBox(),
                  UserContainer(),
                  const SizedBox(),
                ],
              ),
              Positioned(
                left: 50,
                top: 700,
                height: 80,
                width: 300,
                child: HomeBar(),
              )
            ],
          )
      ),
    );
  }
}

Widget SmallCategory(String category, String icon, Color dark, Color light){
  return Stack(
    children: [
      Container(
          width: 78,
          height: 111,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: dark.withOpacity(0.35),
                spreadRadius: 0,
                blurRadius: 30,
                offset: const Offset(0, 15), // changes position of shadow
              ),
            ],
          ),
          child: Column(children: [])
      ),
      Container(
        // margin: const EdgeInsets.all(10),
        // replace with expanded and flex with constant space
        width: 92,
        height: 111,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              dark,
              light,
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Image.asset(
                icon,
                height : 40,
              ),
            ),
            Text(
              category,
              style: const TextStyle(
                fontFamily: 'GilroyMedium',
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}


Widget SeeMore(Color dark, Color light){
  return Stack(
    children: [
      Container(
          width: 78,
          height: 111,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: dark.withOpacity(0.35),
                spreadRadius: 0,
                blurRadius: 30,
                offset: const Offset(0, 15), // changes position of shadow
              ),
            ],
          ),
          child: Column(children: [])
      ),
      Container(
        width: 92,
        height: 111,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              dark,
              light,
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "See More",
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Image.asset(
                "assets/dots.png",
                height : 15,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}


Widget TopRated(){
  return Row(
    children:const [
      Expanded(
        flex: 5,
        child: Text(
          "Top Rated",
          style: TextStyle(
            fontFamily: "GilroySemiBold",
            fontSize: 20,
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Text(
          "See All",
          style: TextStyle(
            fontFamily: "GilroyLight",
            fontSize: 13,
          ),
        ),
      )
    ],
  );
}