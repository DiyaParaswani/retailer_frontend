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
  runApp(MaterialApp(home: AddDeliveryScreen()));
}

class AddDeliveryScreen extends StatefulWidget {
  AddDeliveryScreen({Key? key}) : super(key: key);

  @override
  State<AddDeliveryScreen> createState() => _AddDeliveryScreenState();
}

class _AddDeliveryScreenState extends State<AddDeliveryScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _houseNameController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Delivery"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contact Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _contactController,
                decoration: InputDecoration(labelText: 'Contact Number'),
              ),
              SizedBox(height: 80),
              Text(
                "Address Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: _houseNameController,
                decoration: InputDecoration(labelText: 'House Name/Building Name'),
              ),
              TextField(
                controller: _streetController,
                decoration: InputDecoration(labelText: 'Street'),
              ),
              TextField(
                controller: _pincodeController,
                decoration: InputDecoration(labelText: 'Pincode'),
              ),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 300, // Set your desired width
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      // Save button pressed
                      String name = _nameController.text;
                      String contact = _contactController.text;
                      String houseName = _houseNameController.text;
                      String street = _streetController.text;
                      String pincode = _pincodeController.text;
                      String city = _cityController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeliveryScreen(),
                        ),
                      );

                      // Use the entered data as needed
                    },
                    child: Text('Save'),
                  ),
                ),
              ),

            ],
          ),
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
