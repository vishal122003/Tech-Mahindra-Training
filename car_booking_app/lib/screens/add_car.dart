import 'package:flutter/material.dart';
import '../car_service.dart';

class AddCarScreen extends StatelessWidget {
  final TextEditingController _carTypeController = TextEditingController();
  final TextEditingController _carModelController = TextEditingController();
  final TextEditingController _carImageController = TextEditingController(); // URL to the image
  final TextEditingController _carNumberController = TextEditingController();

  AddCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carService = CarService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Car Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _carTypeController,
              decoration: InputDecoration(labelText: 'Car Type'),
            ),
            TextField(
              controller: _carModelController,
              decoration: InputDecoration(labelText: 'Car Model'),
            ),
            TextField(
              controller: _carImageController,
              decoration: InputDecoration(labelText: 'Car Image URL'),
            ),
            TextField(
              controller: _carNumberController,
              decoration: InputDecoration(labelText: 'Car Number'),
            ),
            ElevatedButton(
              onPressed: () {
                carService.addCarDetails(
                  _carTypeController.text,
                  _carModelController.text,
                  _carImageController.text,
                  _carNumberController.text,
                );
              },
              child: Text('Add Car Details'),
            ),
          ],
        ),
      ),
    );
  }
}
