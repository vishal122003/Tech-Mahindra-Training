import 'package:flutter/material.dart';
import 'new_booking.dart'; // Import the NewBooking screen
import 'bookings_page.dart'; // Import the BookingsPage screen
import 'package:car_booking_app/app_localizations.dart'; // Import for localization

class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('customerDashboard')), // Localized title
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              // Navigate to the NewBooking screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewBooking()),
              );
            },
            child: Text(AppLocalizations.of(context).translate('newBooking')), // Localized text
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the BookingsPage screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingsPage()),
              );
            },
            child: Text(AppLocalizations.of(context).translate('viewBookings')), // Localized text
          ),
        ],
      ),
    );
  }
}
