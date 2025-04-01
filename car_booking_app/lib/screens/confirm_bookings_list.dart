import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:car_booking_app/app_localizations.dart';

class ConfirmedBookingsList extends StatelessWidget {
  const ConfirmedBookingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('confirmedBookings')), // Localized title
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('bookings')
            .where('isConfirmed', isEqualTo: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${AppLocalizations.of(context).translate('error')}: ${snapshot.error}', // Localized error
              ),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                semanticsLabel: AppLocalizations.of(context).translate('loading'), // Localized loading message
              ),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
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
                    Text('${AppLocalizations.of(context).translate('dateAndTime')}: $formattedDate'),
                    Text('${AppLocalizations.of(context).translate('carNumber')}: ${document['carNumber']}'),
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
