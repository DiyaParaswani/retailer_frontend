import 'package:flutter/material.dart';
import 'package:retailer/retailer/dashboard.dart';
import 'package:retailer/retailer/notification.dart';
import 'package:retailer/retailer/auctiontoday.dart';
import 'package:retailer/retailer/payment.dart';
import 'package:retailer/retailer/mybids.dart';
import 'package:retailer/retailer/bids.dart';
import 'package:retailer/retailer/loading.dart';
import 'package:retailer/retailer/wonauction.dart';
import 'package:retailer/retailer/lostauction.dart';
import 'package:retailer/retailer/auctionhouse.dart';
import 'package:retailer/retailer/deliveryscreen.dart';
import 'package:retailer/retailer/adddelivery.dart';
import 'package:retailer/retailer/paymentscreen.dart';
import 'package:retailer/retailer/paymentdonescreen.dart';
import 'package:retailer/retailer/trackorder.dart';
import 'package:retailer/retailer/oneprofile.dart';
import 'package:retailer/retailer/profileinfo.dart';
import 'package:retailer/retailer/mybizz.dart';
import 'package:retailer/retailer/namegeneralinfo.dart';
import 'package:retailer/retailer/documents.dart';
import 'package:retailer/retailer/imagepicker.dart';
import 'package:retailer/retailer/weeklyoff.dart';

void main() {
  runApp(MaterialApp(home: AuctionHouse(),));
}

class AuctionHouse extends StatefulWidget {
  @override
  _AuctionHouseState createState() => _AuctionHouseState();
}

class _AuctionHouseState extends State<AuctionHouse> {
  int _currentIndex = 0;
  bool _showTodayAuctions = false; // Track if Today tab is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Auction House",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.orange[300],
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Dashboard()),
              );

            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showTodayAuctions = true;
                    });
                  },
                  child: Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _showTodayAuctions ? Colors.lightGreen : Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 20),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showTodayAuctions = false;
                    });
                  },
                  child: Text(
                    "Upcoming",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _showTodayAuctions ? Colors.black : Colors.lightGreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: _showTodayAuctions
                      ? _buildTodayAuctionItems()
                      : _buildUpcomingAuctionItems(),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: '',
          ),
        ],
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Dashboard(),
              ));
              break;
            case 1:
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => AuctionHouse(),
              ));
              break;
            case 2:
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => BidNow(),
              ));
              break;
            case 3:
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ));
              break;
          }
        },
      ),
    );
  }

  List<Widget> _buildTodayAuctionItems() {
    // Example of building Today auction items
    return [
      Container(

          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.yellow[100],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        // Displaying an example avatar image
                        backgroundImage: AssetImage('assets/1.png'),
                        radius: 10,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Seller: John Doe",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.orange[300]),
                      SizedBox(width: 4),
                      Text(
                        "01:23min Remaining",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20), // Add some space between the row and the image
              Image.asset(
                'assets/potato.jpeg',
                height: 200, // Adjust the size as needed
                width: MediaQuery.of(context).size.width * 0.8, // Making the image larger
              ),
              SizedBox(height: 20),
              Text(
                "Potato",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Qty:-25kgs",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Text(
                "₹400",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BidNow(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.green,
                  side: BorderSide(color: Colors.green),
                ),
                child: Text(
                  "Bid Now",
                  style: TextStyle(color: Colors.green),
                ),
              ),

            ],
          ),
        ),
        SizedBox(height: 20), // Spacing between the containers
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red[100], // Different color to distinguish between the containers
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/1.png'), // Assume you have an image named 1.png in your assets
                        radius: 10,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Seller: Jane Doe",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.orange[300]),
                      SizedBox(width: 4),
                      Text(
                        "Starts in 1hr",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/tomato.jpeg', // Assume you have an image named tomato.jpeg in your assets
                height: 200,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(height: 20),
              Text(
                "Tomato",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Qty:-30kgs",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Text(
                "₹500",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.green,
                  side: BorderSide(color: Colors.green),
                ),
                child: Text(
                  "Bid Now",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple[50], // Different color to distinguish between the containers
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/1.png'), // Assume you have an image named 1.png in your assets
                        radius: 10,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Seller: Jane Doe",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.orange[300]),
                      SizedBox(width: 4),
                      Text(
                        "Starts in 1hr",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/onion.jpeg', // Assume you have an image named tomato.jpeg in your assets
                height: 200,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              SizedBox(height: 20),
              Text(
                "Onion",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Qty:-30kgs",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Text(
                "₹500",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.green,
                  side: BorderSide(color: Colors.green),
                ),
                child: Text(
                  "Bid Now",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ),


    ];
  }

  List<Widget> _buildUpcomingAuctionItems() {
    // Example of building Upcoming auction items
    return [
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.yellow[100],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      // Displaying an example avatar image
                      backgroundImage: AssetImage('assets/1.png'),
                      radius: 10,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Seller: John Doe",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.timer, color: Colors.orange[300]),
                    SizedBox(width: 4),
                    Text(
                      "Starts in 38hrs 42min",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20), // Add some space between the row and the image
            Image.asset(
              'assets/potato.jpeg',
              height: 200, // Adjust the size as needed
              width: MediaQuery.of(context).size.width * 0.8, // Making the image larger
            ),
            SizedBox(height: 20),
            Text(
              "Potato",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "Qty:-25kgs",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Text(
              "₹400",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.green,
                side: BorderSide(color: Colors.green),
              ),
              child: Text(
                "Bid Now",
                style: TextStyle(color: Colors.green),
              ),
            ),

          ],
        ),
      ),
      SizedBox(height: 20), // Spacing between the containers
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red[100], // Different color to distinguish between the containers
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/1.png'), // Assume you have an image named 1.png in your assets
                      radius: 10,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Seller: Jane Doe",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.timer, color: Colors.orange[300]),
                    SizedBox(width: 4),
                    Text(
                      "Starts in 38hrs 42min",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/tomato.jpeg', // Assume you have an image named tomato.jpeg in your assets
              height: 200,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            SizedBox(height: 20),
            Text(
              "Tomato",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "Qty:-30kgs",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Text(
              "₹500",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.green,
                side: BorderSide(color: Colors.green),
              ),
              child: Text(
                "Bid Now",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple[50], // Different color to distinguish between the containers
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/1.png'), // Assume you have an image named 1.png in your assets
                      radius: 10,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Seller: Jane Doe",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.timer, color: Colors.orange[300]),
                    SizedBox(width: 4),
                    Text(
                      "Starts in 38hrs 42min",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/onion.jpeg', // Assume you have an image named tomato.jpeg in your assets
              height: 200,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(height: 20),
            Text(
              "Onion",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "Qty:-30kgs",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Text(
              "₹500",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.green,
                side: BorderSide(color: Colors.green),
              ),
              child: Text(
                "Bid Now",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),

      ),

    ];

  }
}
