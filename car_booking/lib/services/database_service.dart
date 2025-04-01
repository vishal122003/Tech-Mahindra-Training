import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/car_model.dart';
import '../models/user_model.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new car to the database
  Future<void> addCar(Car car) async {
    try {
      await _firestore.collection('cars').add(car.toMap());
    } catch (e) {
      print('Error adding car: $e');
    }
  }

  // Get all available cars from the database
  Future<List<Car>> getAvailableCars() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('cars').get();
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Car.fromMap(data);
      }).toList();
    } catch (e) {
      print('Error fetching available cars: $e');
      return [];
    }
  }

  // Get the cars of a specific driver
  Future<List<Car>> getDriverCars(String driverId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('cars')
          .where('driverId', isEqualTo: driverId)
          .get();
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Car.fromMap(data);
      }).toList();
    } catch (e) {
      print('Error fetching driver cars: $e');
      return [];
    }
  }

  // Add a new user to the database
  Future<void> addUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set(user.toMap());
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  // Get a user from the database by UID
  Future<UserModel?> getUser(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return UserModel.fromMap(data);
      }
    } catch (e) {
      print('Error fetching user: $e');
    }
    return null;
  }

  // Add a booking to the database
  Future<void> addBooking(String carId, String boardingLocation, String dropLocation) async {
    try {
      await _firestore.collection('bookings').add({
        'carId': carId,
        'boardingLocation': boardingLocation,
        'dropLocation': dropLocation,
        'status': 'pending',
      });
    } catch (e) {
      print('Error adding booking: $e');
    }
  }

  // Update booking status
  Future<void> updateBookingStatus(String bookingId, String status) async {
    try {
      await _firestore.collection('bookings').doc(bookingId).update({
        'status': status,
      });
    } catch (e) {
      print('Error updating booking status: $e');
    }
  }
}
