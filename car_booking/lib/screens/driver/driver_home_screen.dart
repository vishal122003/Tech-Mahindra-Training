import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/car_model.dart';
import '../../services/auth_service.dart';
//import '../../widgets/custom_button.dart';

class DriverHomeScreen extends StatefulWidget {
  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Car> _driverCars = [];
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchDriverCars();
  }

  void _fetchDriverCars() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        QuerySnapshot snapshot = await _firestore
            .collection('cars')
            .where('driverId', isEqualTo: currentUser.uid)
            .get();
        List<Car> cars = snapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return Car.fromMap(data);
        }).toList();
        setState(() {
          _driverCars = cars;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _logout(BuildContext context) async {
    await AuthService().signOut();
    Navigator.pushReplacementNamed(context, '/driverLogin');
  }

  void _confirmBooking(String bookingId) async {
    try {
      await _firestore.collection('bookings').doc(bookingId).update({
        'status': 'confirmed',
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booking confirmed')));
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  void _rejectBooking(String bookingId) async {
    try {
      await _firestore.collection('bookings').doc(bookingId).update({
        'status': 'rejected',
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booking rejected')));
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage, style: TextStyle(color: Colors.red)))
              : ListView.builder(
                  itemCount: _driverCars.length,
                  itemBuilder: (context, index) {
                    Car car = _driverCars[index];
                    return Card(
                      child: ListTile(
                        title: Text(car.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(car.type),
                            Image.network(car.imageUrl),
                            Text('Bookings:'),
                            for (var booking in car.bookings)
                              ListTile(
                                title: Text('Booking ID: ${booking.id}'),
                                subtitle: Text('Status: ${booking.status}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.check),
                                      onPressed: () => _confirmBooking(booking.id),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () => _rejectBooking(booking.id),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
