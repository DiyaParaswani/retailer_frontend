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



class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Payment",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);

            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => OrderStatus()),
            // );
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
            // Container for a single person's details
            Container(
              height: 80,
              width: 450,
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Image
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/1.png'),
                      radius: 25,
                    ),
                    SizedBox(width: 20),
                    // Name and product details
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ronald Smith",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Potato",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          // Price
                          Row(
                            children: [
                              Icon(Icons.attach_money, size: 13),
                              SizedBox(width: 1),
                              Text(
                                "600",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Button
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle your Start functionality
                    print('Successful clicked');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Button background color
                    onPrimary: Colors.lightGreen, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Button border radius
                      side: BorderSide(color: Colors.lightGreen), // Button border color
                    ),
                  ),
                  child: Text('Successful'),
                ),
              ),
                  ],
                ),
              ),
            ),
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
