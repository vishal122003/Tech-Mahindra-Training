import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:car_booking_app/app_localizations.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('bookings')), // Localized AppBar
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('bookings')
            .where('isConfirmed', isEqualTo: true)
            .where('customerName', isEqualTo: 'John Doe')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${AppLocalizations.of(context).translate('error')}: ${snapshot.error}', // Localized error message
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(), // Loading spinner
            );
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                AppLocalizations.of(context).translate('noBookingsFound'), // Placeholder text
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              Timestamp timestamp = document['dateTime'];
              DateTime dateTime = timestamp.toDate();
              String formattedDate = DateFormat('EEE, MMM d, yyyy – hh:mm a').format(dateTime);

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 3,
                child: ListTile(
                  title: Text(
                    document['customerName'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${AppLocalizations.of(context).translate('pickupLocation')}: ${document['pickupLocation']}'),
                      Text('${AppLocalizations.of(context).translate('dropLocation')}: ${document['dropLocation']}'),
                      Text('${AppLocalizations.of(context).translate('carTypeRequired')}: ${document['carTypeRequired']}'),
                      Text('${AppLocalizations.of(context).translate('dateTime')}: $formattedDate'),
                      Text('${AppLocalizations.of(context).translate('carNumber')}: ${document['carNumber']}'),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
