import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  DetailsPage({this.heroTag, this.foodName, this.foodPrice});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'Weight';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7A9BEE),
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Details',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white,
            ),
          ]),
      body: ListView(
        children: [
          Stack(children: [
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height - 82.0,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: 75,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0),
                  ),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height - 100.0,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              top: 30.0,
              left: (MediaQuery.of(context).size.width / 2) - 100.0,
              child: Hero(
                tag: widget.heroTag,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.heroTag),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Positioned(
              top: 250.0,
              left: 25.0,
              right: 25.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.foodName,
                      style: GoogleFonts.montserrat(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.foodPrice,
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.grey,
                          )),
                      Container(
                        height: 25.0,
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      Container(
                        width: 125.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.0),
                          color: Color(0xFF7A9BEE),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Color(0xFF7A9BEE),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "2",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xFF7A9BEE),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 160.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        _buildInfoCard("WEIGHT", '300', 'G'),
                        SizedBox(
                          width: 10.0,
                        ),
                        _buildInfoCard("CALORIES", '267', 'CAL'),
                        SizedBox(
                          width: 10.0,
                        ),
                        _buildInfoCard("VITAMIN", 'A, B6', 'VIT'),
                        SizedBox(
                          width: 10.0,
                        ),
                        _buildInfoCard("AVAIL", 'NO', 'AV'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black,
                      ),
                      height: 60.0,
                      child: Center(
                        child: Text(widget.foodPrice,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

Widget _buildInfoCard(String cardTitle, String info, String unit) {
  var selectedCard=cardTitle;
  return InkWell(
    onTap: () {
      selectedCard = selectCard(cardTitle);
    },
    child: AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
        border: Border.all(
          color: cardTitle == selectedCard
              ? Colors.transparent
              : Colors.grey.withOpacity(0.3),
        ),
      ),
      height: 100.0,
      width: 100.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(selectedCard,
              style: GoogleFonts.montserrat(
                fontSize: 15.0,
                color: cardTitle == selectedCard ? Colors.white : Colors.black,
              )),
          SizedBox(height: 90,),
          Text(info,
              style: GoogleFonts.montserrat(
                fontSize: 15.0,
                color: cardTitle == selectedCard ? Colors.white : Colors.black,
              )),
          Text(unit,
              style: GoogleFonts.montserrat(
                fontSize: 15.0,
                color: cardTitle == selectedCard ? Colors.white : Colors.black,
              )),
        ],
      ),
    ),
  );
}

selectCard(cardTitle) {
  var selectedCard;
  setState() {
    selectedCard = cardTitle;
  }
}
