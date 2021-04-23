import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key2iqassignment/QuizScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
            TopBar(size: size),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What do you want to do...",
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.75,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => QuizScreen(),
                              ));
                            },
                            child: CategoryTile(
                              title: "Compete Now",
                              description: "Challenge for uh",
                              iconData: FontAwesome5.trophy,
                            ),
                          ),
                          CategoryTile(
                              title: "Meet new rappers",
                              description: "Chat with other rappers",
                              iconData: FontAwesome5.envelope_open_text),
                          CategoryTile(
                            title: "Explore",
                            description: "See rappers like uh",
                            iconData: Icons.explore,
                          ),
                          CategoryTile(
                            title: "Play and learn",
                            description: "Learn with fun",
                            iconData: FontAwesome5.gamepad,
                          ),
                          CategoryTile(
                            title: "Learn Rap",
                            description: "Challenge for uh",
                            iconData: FontAwesome5.school,
                          ),
                          CategoryTile(
                            title: "Practice Rap",
                            description: "Challenge for uh",
                            iconData: FontAwesome5.brain,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.deepPurple,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: 'community'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.amber,
          child: Icon(Icons.edit),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String title;
  final String description;
  final IconData iconData;
  const CategoryTile({
    Key? key,
    required this.title,
    required this.description,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 14, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Colors.deepPurple.shade900,
                  Colors.black,
                ], stops: [
                  0.05,
                  0.5
                ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    color: Colors.white,
                    size: 50,
                  ),
                  Text(
                    description,
                    style: GoogleFonts.montserrat(color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: TopTile(
                backgroundColor: Colors.purple.shade200.withOpacity(0.5),
                label: 'Home',
                icon: Icon(Icons.menu),
                size: size),
          ),
          Expanded(
            child: TopTile(
                label: 'Compete', icon: Icon(FontAwesome5.trophy), size: size),
          ),
          Expanded(
            child: TopTile(
                label: 'Explore', icon: Icon(Icons.explore), size: size),
          ),
          Expanded(
            child: TopTile(
                label: 'FeedBack',
                icon: Icon(Icons.feedback_rounded),
                size: size),
          ),
        ],
      ),
    );
  }
}

class TopTile extends StatelessWidget {
  final Color backgroundColor;
  final Icon icon;
  final String label;
  final TextStyle? labelStyle;
  const TopTile({
    Key? key,
    required this.size,
    this.backgroundColor = Colors.white,
    required this.icon,
    required this.label,
    this.labelStyle,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.075,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          icon,
          Expanded(child: SizedBox()),
          Text(
            label,
            style: labelStyle ?? GoogleFonts.montserrat(fontSize: 12),
          )
        ],
      ),
    );
  }
}
