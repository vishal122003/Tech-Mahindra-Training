import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/car_model.dart';
//import '../../widgets/custom_button.dart';

class DriverCarDetailsScreen extends StatefulWidget {
  final String carId;

  DriverCarDetailsScreen({required this.carId});

  @override
  _DriverCarDetailsScreenState createState() => _DriverCarDetailsScreenState();
}

class _DriverCarDetailsScreenState extends State<DriverCarDetailsScreen> {
  late Car _car;
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchCarDetails();
  }

  void _fetchCarDetails() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('cars').doc(widget.carId).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        setState(() {
          _car = Car.fromMap(data);
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Car not found';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Car Details')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage, style: TextStyle(color: Colors.red)))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_car.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(_car.type, style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      Image.network(_car.imageUrl),
                      SizedBox(height: 20),
                      Text('Bookings:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _car.bookings.length,
                          itemBuilder: (context, index) {
                            Booking booking = _car.bookings[index];
                            return ListTile(
                              title: Text('Booking ID: ${booking.id}'),
                              subtitle: Text('Status: ${booking.status}'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.check),
                                    onPressed: () => _updateBookingStatus(booking.id, 'confirmed'),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () => _updateBookingStatus(booking.id, 'rejected'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

  void _updateBookingStatus(String bookingId, String status) async {
    try {
      await FirebaseFirestore.instance.collection('bookings').doc(bookingId).update({
        'status': status,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booking $status')));
      _fetchCarDetails(); // Refresh car details after updating booking status
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }
}
