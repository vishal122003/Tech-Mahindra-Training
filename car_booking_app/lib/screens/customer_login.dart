import 'package:flutter/material.dart';
import 'customer_dashboard.dart';
class CustomerLogin extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  CustomerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username (customer)'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password (123)'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text == 'customer' &&
                    _passwordController.text == '123') {
                  // Login successful
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerDashboard(),
                    ),
                  );
                } else {
                  // Login failed
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid Username or Password')),
                  );
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/customer_register');
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
