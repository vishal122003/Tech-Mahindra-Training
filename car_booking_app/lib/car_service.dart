import 'package:cloud_firestore/cloud_firestore.dart';

class CarService {
  Future<void> addCarDetails(String carType, String carModel, String carImage, String carNumber) async {
    CollectionReference carDetails = FirebaseFirestore.instance.collection('car_details');

    await carDetails.add({
      'carType': carType,
      'carModel': carModel,
      'carImage': carImage, // URL to image
      'carNumber': carNumber,
    }).then((value) {
      print("Car Details Added");
    }).catchError((error) {
      print("Failed to add car details: $error");
    });
  }
}
