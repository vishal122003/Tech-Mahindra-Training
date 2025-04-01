import 'package:flutter/material.dart';
import 'package:car_booking/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Car Booking App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: 'Driver Login',
              onPressed: () {
                Navigator.pushNamed(context, '/driverLogin');
              },
            ),
            SizedBox(height: 10),
            CustomButton(
              text: 'Driver Register',
              onPressed: () {
                Navigator.pushNamed(context, '/driverRegister');
              },
            ),
            SizedBox(height: 10),
            CustomButton(
              text: 'Customer Booking',
              onPressed: () {
                Navigator.pushNamed(context, '/customerBooking');
              },
            ),
          ],
        ),
      ),
    );
  }
}
