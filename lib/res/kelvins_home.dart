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

class Home extends StatefulWidget {
  Home({this.uid});

  final String uid;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final buttonSize = MediaQuery.of(context);
    final logo = Image.asset(
      "assets/black-logo.png",
      width: 38.0,
      height: 38.0,
      fit: BoxFit.fill,
    );

    final flag = Image.asset(
      "assets/flag.png",
      width: 38.0,
      height: 38.0,
      fit: BoxFit.fill,
    );

    final square = Container(
      height: 40,
      width: 40,
      // color: Colors.transparent,
      decoration: BoxDecoration(
          color: Colors.lightBlue[700],
          borderRadius: BorderRadius.all(Radius.circular(7.0))),
      child: Center(
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: logo,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),

        // Bottom Navbar items. Added fixed to the type, to ensure we can add more than 3 items.

        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.lightBlue[700],
          selectedLabelStyle: GoogleFonts.raleway(
              fontSize: 15.0, letterSpacing: .3, fontWeight: FontWeight.bold),
          unselectedLabelStyle: GoogleFonts.raleway(
              fontSize: 14.0, letterSpacing: .2, color: Colors.black),
          iconSize: 20.0,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined, color: Colors.black),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline, color: Colors.black),
              label: 'Liked',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 35.0, left: 25.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Discover Kenya",
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                letterSpacing: .4),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: flag,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Beautiful Photos of Kenya",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 19.0,
                            letterSpacing: .4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40.0,
                margin: EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.grey[300],
                ),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      maxLengthEnforced: true,
                      style: GoogleFonts.raleway(fontSize: 15.0),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            bottom: 10,
                          ),
                          border: InputBorder.none,
                          hintText: "Search Great Photos",
                          hintStyle: GoogleFonts.raleway(letterSpacing: .2)),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: square,
                    ),
                  ],
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 25.0,
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.only(left: 28.0),
                      child: Center(),
                    ),
                  ],
                ),
              ),

              // Home grid for displaying pictures of the kenya
              TabBarView(children: [
                Wildlife(),
                Architecture(),
                Landscape(),
                Beach(),
                Creative(),
                Fashion(),
                Food(),
                Culture(),
                Night(),
              ])
            ],
          ),
        ),
        drawer: NavigateDrawer(uid: this.widget.uid));
  }
}

class NavigateDrawer extends StatefulWidget {
  final String uid;

  NavigateDrawer({Key key, this.uid}) : super(key: key);

  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Users")
                    .child(widget.uid)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.value['email'],
                      style: GoogleFonts.raleway(
                          letterSpacing: .3, fontSize: 15.0),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('AW', style: GoogleFonts.raleway(fontSize: 14.0))),
            accountName: FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Users")
                    .child(widget.uid)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.value['name'],
                      style: GoogleFonts.raleway(
                          letterSpacing: .3, fontSize: 15.0),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            decoration: BoxDecoration(
              color: Colors.lightBlue[700],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.home_outlined, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Home',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(uid: widget.uid)),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.search, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Search',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              print(widget.uid);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.explore_outlined, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Discover',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              print(widget.uid);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.upload_outlined, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Upload',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              print(widget.uid);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: new IconButton(
              icon:
                  new Icon(Icons.account_circle_outlined, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Profile',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              print(widget.uid);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.logout, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Sign Out',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Onboard()),
                    (Route<dynamic> route) => false);
              });
            },
          ),
        ],
      ),
    );
  }
}
