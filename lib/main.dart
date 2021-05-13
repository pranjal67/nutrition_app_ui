
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detailspage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 15, left: 10),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  SizedBox(width: 190),
                  Container(
                    width: 125,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.filter_list),
                            color: Colors.white,
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(Icons.menu),
                            color: Colors.white,
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Healthy',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25.0,
                    )),
                SizedBox(
                  width: 10.0,
                ),
                Text('Food',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 25.0,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                  )),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 300.0,
                      child: ListView(
                        children: [
                          _buildFoodItem(context,
                              'assets/images (1).jpg', 'Pizza', 'Rs.400'),
                          SizedBox(
                            height: 15,
                          ),
                          _buildFoodItem(context,'assets/images (2).jpg',
                              'Crispy Chicken', 'Rs.300'),
                          SizedBox(
                            height: 15,
                          ),
                          _buildFoodItem(context,'assets/images.jpg',
                              'Chicken Leg Pieces', 'Rs.800'),
                          SizedBox(
                            height: 15,
                          ),
                          _buildFoodItem(context,
                              'assets/adhd-foods-to-avoid_thumb-732x549.jpg',
                              'Donuts',
                              'Rs.400'),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                            icon: Icon(Icons.search),
                            color: Colors.black,
                            onPressed: () {}),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                            icon: Icon(Icons.wallet_giftcard),
                            color: Colors.black,
                            onPressed: () {}),
                      ),
                      SizedBox(width: 80),
                      Container(
                        height: 60,
                        width: 120,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

Widget _buildFoodItem(context,String imgPath, String foodName, String price) {
  return Padding(
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsPage(
                heroTag: imgPath, foodName: foodName, foodPrice: price)));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Hero(
                  tag: imgPath,
                  child: Image(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover,
                    height: 75.0,
                    width: 75.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: GoogleFonts.montserrat(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      price,
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
            color: Colors.black,
          ),
        ],
      ),
    ),
  );
}
