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
  runApp(MaterialApp(home: MyBids(),));
}
class MyBids extends StatefulWidget {
  @override
  _MyBidsState createState() => _MyBidsState();
}

class _MyBidsState extends State<MyBids>  {
  PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Bids",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.pop(context);

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          },
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  height: 120, // Increased height to accommodate the additional text
                  decoration: BoxDecoration(
                    color: Colors.yellow[100], // Background color of the container
                    borderRadius: BorderRadius.circular(10), // Border radius of the container
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/potato.jpeg', // Replace with your actual image asset
                          width: 100, // Adjust the size as needed
                          height: 100, // Adjust the size as needed
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0,right: 10),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/1.png'), // Your avatar image
                          radius: 10, // Adjust the size of the avatar
                        ),
                      ),
                      Expanded( // Expanded widget is used to ensure the texts take up the remaining space
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                'Darrell Steward', // Your seller name text
                                style: TextStyle(
                                  fontSize: 18, // Adjust the font size as needed
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold// Adjust the text color as needed
                                ),
                              ),
                              Text(
                                'Potato', // Your first text
                                style: TextStyle(
                                  fontSize: 20, // Adjust the font size as needed
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold, // Adjust the text color as needed
                                ),
                                overflow: TextOverflow.ellipsis, // Prevents the text from overflowing
                              ),
                              Text(
                                'Qty:-25kgs', // Your second text goes here
                                style: TextStyle(
                                  fontSize: 14, // Adjust the font size as needed
                                  color: Colors.grey, // Adjust the text color as needed
                                ),
                              ),
                                Text(
                                  '₹400', // Your second text goes here
                                  style: TextStyle(
                                    fontSize: 14, // Adjust the font size as needed
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold// Adjust the text color as needed
                                  ),
                                //overflow: TextOverflow.ellipsis, // Prevents the text from overflowing
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle your auction functionality
                      print('Auction clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Button background color
                      onPrimary: Colors.redAccent, // Text color
                      shape: RoundedRectangleBorder( // Button shape
                        borderRadius: BorderRadius.circular(20), // Button border radius
                        side: BorderSide(color: Colors.redAccent), // Button border color
                      ),
                    ),
                    child: Text('You Lost'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  height: 120, // Increased height to accommodate the additional text
                  decoration: BoxDecoration(
                    color: Colors.pink[50], // Background color of the container
                    borderRadius: BorderRadius.circular(10), // Border radius of the container
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/tomato.jpeg', // Replace with your actual image asset
                          width: 100, // Adjust the size as needed
                          height: 100, // Adjust the size as needed
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0,right: 10),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/1.png'), // Your avatar image
                          radius: 10, // Adjust the size of the avatar
                        ),
                      ),
                      Expanded( // Expanded widget is used to ensure the texts take up the remaining space
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Darrell Steward', // Your seller name text
                                style: TextStyle(
                                    fontSize: 18, // Adjust the font size as needed
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold// Adjust the text color as needed
                                ),
                              ),
                              Text(
                                'Tomato', // Your first text
                                style: TextStyle(
                                  fontSize: 20, // Adjust the font size as needed
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold, // Adjust the text color as needed
                                ),
                                overflow: TextOverflow.ellipsis, // Prevents the text from overflowing
                              ),
                              // Text(
                              //   'Fresh and Organic', // Your second text goes here
                              //   style: TextStyle(
                              //     fontSize: 14, // Adjust the font size as needed
                              //     color: Colors.grey, // Adjust the text color as needed
                              //   ),
                              //   overflow: TextOverflow.ellipsis, // Prevents the text from overflowing
                              // ),
                              Text(
                                'Qty:-25kgs', // Your second text goes here
                                style: TextStyle(
                                  fontSize: 14, // Adjust the font size as needed
                                  color: Colors.grey, // Adjust the text color as needed
                                ),
                              ),
                              Text(
                                '₹400', // Your second text goes here
                                style: TextStyle(
                                    fontSize: 14, // Adjust the font size as needed
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold// Adjust the text color as needed
                                ),
                                //overflow: TextOverflow.ellipsis, // Prevents the text from overflowing
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle your auction functionality
                      print('Auction clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Button background color
                      onPrimary: Colors.lightGreen, // Text color
                      shape: RoundedRectangleBorder( // Button shape
                        borderRadius: BorderRadius.circular(20), // Button border radius
                        side: BorderSide(color: Colors.lightGreen), // Button border color
                      ),
                    ),
                    child: Text('You Win'),
                  ),
                ),
              ],
            )
          ],
        ),
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
}

