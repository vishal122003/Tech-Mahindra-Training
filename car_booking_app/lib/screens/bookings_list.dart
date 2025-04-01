import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // For formatting dates
import 'package:car_booking_app/app_localizations.dart'; // Localization

class BookingsList extends StatelessWidget {
  const BookingsList({super.key});

  Future<void> confirmBooking(BuildContext context, DocumentSnapshot bookingDocument) async {
    try {
      // Fetch all cars from car_details collection
      final carsSnapshot = await FirebaseFirestore.instance.collection('car_details').get();

      final List<DocumentSnapshot> allCars = carsSnapshot.docs;

      if (allCars.isEmpty) {
        // Show a message if there are no cars available
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).translate('noCarsAvailable')),
          ),
        );
        return;
      }

      // Display a dialog to select a car
      String? selectedCarNumber;
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context).translate('selectCar')),
            content: DropdownButton<String>(
              isExpanded: true,
              value: selectedCarNumber,
              items: allCars.map((car) {
                String carNumber = car['carNumber'];
                return DropdownMenuItem(
                  value: carNumber,
                  child: Text('${car['carType']} - $carNumber'), // Show car type and number
                );
              }).toList(),
              onChanged: (String? newValue) {
                selectedCarNumber = newValue!;
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: Text(AppLocalizations.of(context).translate('cancel')),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedCarNumber != null) {
                    Navigator.of(context).pop(); // Confirm and close dialog
                  }
                },
                child: Text(AppLocalizations.of(context).translate('confirm')),
              ),
            ],
          );
        },
      );

      if (selectedCarNumber != null) {
        // Update the booking with the selected car number
        await FirebaseFirestore.instance.collection('bookings').doc(bookingDocument.id).update({
          'isConfirmed': true,
          'carNumber': selectedCarNumber,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).translate('bookingConfirmed')),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${AppLocalizations.of(context).translate('error')}: $error'),
        ),
      );
    }
  }

  void rejectBooking(BuildContext context, DocumentSnapshot bookingDocument) {
    FirebaseFirestore.instance
        .collection('bookings')
        .doc(bookingDocument.id)
        .update({'isConfirmed': false}).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).translate('bookingRejected')),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${AppLocalizations.of(context).translate('error')}: $error'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('bookings')), // Localized title
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('bookings')
            .where('isConfirmed', isEqualTo: false) // Only show non-confirmed bookings
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${AppLocalizations.of(context).translate('error')}: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final bookings = snapshot.data!.docs;

          if (bookings.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context).translate('noBookings')),
            );
          }

          return ListView(
            children: bookings.map((document) {
              Timestamp timestamp = document['dateTime'];
              DateTime dateTime = timestamp.toDate();
              String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);

              return ListTile(
                title: Text(document['customerName']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${AppLocalizations.of(context).translate('pickupLocation')}: ${document['pickupLocation']}'),
                    Text('${AppLocalizations.of(context).translate('dropLocation')}: ${document['dropLocation']}'),
                    Text('${AppLocalizations.of(context).translate('carTypeRequired')}: ${document['carTypeRequired']}'),
                    Text('${AppLocalizations.of(context).translate('dateTime')}: $formattedDate'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () => confirmBooking(context, document),
                      child: Text(AppLocalizations.of(context).translate('confirmBooking')),
                    ),
                    SizedBox(width: 8), // Space between buttons
                    ElevatedButton(
                      onPressed: () => rejectBooking(context, document),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Red color for reject button
                      ),
                      child: Text(AppLocalizations.of(context).translate('rejectBooking')),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
