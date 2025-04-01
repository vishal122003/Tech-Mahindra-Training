import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/car_model.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/custom_button.dart';

class CustomerBookingScreen extends StatefulWidget {
  @override
  _CustomerBookingScreenState createState() => _CustomerBookingScreenState();
}

class _CustomerBookingScreenState extends State<CustomerBookingScreen> {
  final _boardingLocationController = TextEditingController();
  final _dropLocationController = TextEditingController();
  List<Car> _availableCars = [];
  bool _isLoading = false;
  String _errorMessage = '';

  void _searchCars() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('cars').get();
      List<Car> cars = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Car.fromMap(data);
      }).toList();
      setState(() {
        _availableCars = cars;
      });
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

  void _bookCar(Car car) async {
    try {
      await FirebaseFirestore.instance.collection('bookings').add({
        'carId': car.id,
        'boardingLocation': _boardingLocationController.text,
        'dropLocation': _dropLocationController.text,
        'status': 'pending',
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booking request sent')));
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Booking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomInputField(
              controller: _boardingLocationController,
              label: 'Boarding Location',
            ),
            CustomInputField(
              controller: _dropLocationController,
              label: 'Drop Location',
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Search Cars',
              onPressed: _searchCars,
            ),
            if (_isLoading)
              CircularProgressIndicator(),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: _availableCars.length,
                itemBuilder: (context, index) {
                  Car car = _availableCars[index];
                  return Card(
                    child: ListTile(
                      title: Text(car.name),
                      subtitle: Text(car.type),
                      leading: Image.network(car.imageUrl),
                      trailing: CustomButton(
                        text: 'Book',
                        onPressed: () => _bookCar(car),
                      ),
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

  @override
  void dispose() {
    _boardingLocationController.dispose();
    _dropLocationController.dispose();
    super.dispose();
  }
}
