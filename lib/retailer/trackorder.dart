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
  runApp(MaterialApp(home: TrackOrderScreen()));
}

class TrackOrderScreen extends StatefulWidget {
  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Order'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
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
                  padding: const EdgeInsets.only(top: 22.0, right: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/1.png'), // Your avatar image
                    radius: 10, // Adjust the size of the avatar
                  ),
                ),
                Expanded(
                  // Expanded widget is used to ensure the texts take up the remaining space
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
                              fontWeight: FontWeight.bold // Adjust the text color as needed
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
                              fontWeight: FontWeight.bold // Adjust the text color as needed
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
          SizedBox(height: 50), // Add space between the container and the text
          Text(
            'Estimated Time: 20 min', // Your estimated time text
            style: TextStyle(
                fontSize: 20, // Adjust the font size as needed
                fontWeight: FontWeight.bold // Adjust the text weight as needed
            ),
          ),
          SizedBox(height: 50), // Add space between the estimated time text and the track status
          Text(
            'Track Status: Out for Delivery', // Your track status text
            style: TextStyle(
              fontSize: 25, // Adjust the font size as needed
              fontWeight: FontWeight.bold, // Adjust the text weight as needed
              color: Colors.green, // Adjust the text color as needed
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
}
