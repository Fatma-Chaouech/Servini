import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:servini_app/screens/categories_page.dart';
import 'package:servini_app/providers/user.dart';
import 'package:servini_app/widgets/user_container.dart';
import 'package:servini_app/screens/profile_page.dart';
import 'package:servini_app/widgets/home_bar.dart';
import 'package:servini_app/constants/colors.dart';
import '../widgets/search_bar.dart';
import 'package:servini_app/widgets/appbar.dart';
import 'package:servini_app/widgets/small_category.dart';
import '../widgets/title_row.dart';
import '../widgets/see_more.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _MySearchPage();
}

class _MySearchPage extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    String name = Provider.of<User>(context).name;
    String surname = Provider.of<User>(context).surname;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Center(
            child: customAppBar(),
          ),
        ),
        backgroundColor: coldBackground,
        body: Container(
            margin: EdgeInsets.fromLTRB(
                size.width * 0.05, size.height * 0.03, size.width * 0.05, 0),
            child: Stack(
              children: [
                ListView(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "Welcome",
                                    style: TextStyle(
                                      color: writingBlue,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    name + ' ' + surname,
                                    style: const TextStyle(
                                      color: writingBlue,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (
                                        context) => const ProfilePage()),
                                  );
                                },
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/user.png",
                                    width: 43,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      child: searchBar(context),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, size.height * 0.03, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          smallCategory(
                              context, "Transporter", "assets/transporter.png",
                              darkBlue, lightBlue),
                          smallCategory(
                              context, "Babysitter", "assets/babysitter.png",
                              darkYellow, lightYellow),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Categories()),
                              );
                            },
                            child: seeMore(context, darkRed, lightRed),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    titleRow("Top Rated"),
                    SizedBox(height: size.height * 0.01),
                    userContainer(context),
                    SizedBox(height: size.height * 0.01),
                    userContainer(context),
                    SizedBox(height: size.height * 0.01),
                    userContainer(context),
                    SizedBox(height: size.height * 0.01),
                    userContainer(context),
                    SizedBox(height: size.height * 0.01),
                    userContainer(context),
                    SizedBox(height: size.height * 0.01),
                    userContainer(context),
                    SizedBox(height: size.height * 0.01),
                  ],
                ),
                Positioned(
                  left: size.width * 0.075,
                  top: size.height * 0.75,
                  height: size.height * 0.1,
                  width: size.width * 0.75,
                  child: homeBar(context),
                ),
              ],
            )
        ),
      ),
    );
  }
}