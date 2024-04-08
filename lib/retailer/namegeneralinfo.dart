import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
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
  runApp(MaterialApp(home: NameInfo()));
}

class NameInfo extends StatefulWidget {

  @override
  _NameInfoState createState() => _NameInfoState();
}

class _NameInfoState extends State<NameInfo> {
  int _currentIndex=0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _businessStoreController = TextEditingController();
  final TextEditingController _businessTypeController = TextEditingController();
  final TextEditingController _establishmentYearController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;

  Future getImage() async {
    final pickedFile =
    await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Information'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: getImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null
                        ? FileImage(_image!) as ImageProvider<Object>
                        : AssetImage('assets/1.png'),
                  ),
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Business Store',
                  prefixIcon: Icon(Icons.store, color: Colors.lightGreen),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _contactController,
                decoration: InputDecoration(
                  labelText: 'Business Type',
                  prefixIcon: Icon(Icons.business, color: Colors.lightGreen),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _establishmentYearController,
                decoration: InputDecoration(
                  labelText: 'Establishment Year',
                  prefixIcon: Icon(Icons.date_range, color: Colors.lightGreen),
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description (Optional)',
                  prefixIcon: Icon(Icons.description, color: Colors.lightGreen),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Implement save functionality
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                  minimumSize: Size(double.infinity, 30),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
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
