import 'package:flutter/material.dart';
import './driver_dashboard.dart';

class DriverLogin extends StatelessWidget {
  final TextEditingController _driverIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  DriverLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _driverIdController,
              decoration: InputDecoration(labelText: 'Driver ID (driver123)'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password (123)'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                if (_driverIdController.text == 'driver123' && _passwordController.text == '123') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DriverDashboard()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Driver ID or Password')));
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
