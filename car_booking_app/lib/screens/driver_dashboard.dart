import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import '../app_localizations.dart';
import 'bookings_list.dart'; // Import the BookingsList screen
import './confirm_bookings_list.dart'; // Import the ConfirmedBookingsList screen
import 'car_detail_list.dart'; // Import the CarDetailsList screen

class DriverDashboard extends StatelessWidget {
  const DriverDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('driverDashboard')),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              // Navigate to the BookingsList screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingsList()),
              );
            },
            child: Text('View Bookings'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the ConfirmedBookingsList screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfirmedBookingsList()),
              );
            },
            child: Text('View Confirmed Bookings'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the CarDetailsList screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CarDetailsList()),
              );
            },
            child: Text('View Car Details'),
          ),
        ],
      ),
    );
  }
}
