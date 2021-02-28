import 'package:flutter/material.dart';
import 'package:discover_kenya/onboard.dart';
import 'package:discover_kenya/res/architecture.dart';
import 'package:discover_kenya/res/beach.dart';
import 'package:discover_kenya/res/creative.dart';
import 'package:discover_kenya/res/culture.dart';
import 'package:discover_kenya/res/fashion.dart';
import 'package:discover_kenya/res/food.dart';
import 'package:discover_kenya/res/landscape.dart';
import 'package:discover_kenya/res/night.dart';
import 'package:discover_kenya/res/wildlife.dart';
import 'package:discover_kenya/tools/tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class grid extends StatelessWidget {

      var categories_list = [
      "Wildlife",
      "Architecture",
      "Landscape",
      "Beach",
      "Creative",
      "Fashion",
      "Food",
      "Culture",
      "Night"
    ];

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
                        // length: 5,
                        length: categories_list.length,
                        child: TabBar(
                            labelPadding: EdgeInsets.all(0),
                            indicatorPadding: EdgeInsets.all(0),
                            isScrollable: true,
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            indicator: RoundedRectangleTabIndicator(
                              width: 28,
                              weight: 2,
                              color: Colors.red,
                            ),
                            tabs: [
                              Tab(
                                child: Container(
                                  margin: EdgeInsets.only(right: 20.0),
                                  child: Text(categories_list[0]),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: EdgeInsets.only(right: 20.0),
                                  child: Text(categories_list[1]),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: EdgeInsets.only(right: 20.0),
                                  child: Text(categories_list[2]),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: EdgeInsets.only(right: 20.0),
                                  child: Text(categories_list[3]),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: EdgeInsets.only(right: 20.0),
                                  child: Text(categories_list[4]),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: EdgeInsets.only(right: 20.0),
                                  child: Text(categories_list[5]),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: EdgeInsets.only(right: 20.0),
                                  child: Text(categories_list[6]),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: EdgeInsets.only(right: 20.0),
                                  child: Text(categories_list[7]),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: EdgeInsets.only(right: 20.0),
                                  child: Text(categories_list[8]),
                                ),
                              ),
                            ]),
                            
                      );
    
  }
}