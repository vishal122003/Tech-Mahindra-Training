import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String id;
  final String name;
  final String type;
  final String imageUrl;
  final String driverId;
  final List<Booking> bookings;

  Car({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.driverId,
    required this.bookings,
  });

  factory Car.fromMap(Map<String, dynamic> data) {
    return Car(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      type: data['type'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      driverId: data['driverId'] ?? '',
      bookings: (data['bookings'] as List<dynamic>?)
              ?.map((item) => Booking.fromMap(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'imageUrl': imageUrl,
      'driverId': driverId,
      'bookings': bookings.map((booking) => booking.toMap()).toList(),
    };
  }
}

class Booking {
  final String id;
  final String status;

  Booking({
    required this.id,
    required this.status,
  });

  factory Booking.fromMap(Map<String, dynamic> data) {
    return Booking(
      id: data['id'] ?? '',
      status: data['status'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
    };
  }
}

// Example of fetching data from Firestore and converting it to a Car object
Future<List<Car>> getAvailableCars() async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('cars').get();
  return snapshot.docs.map((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Car.fromMap(data);
  }).toList();
}
