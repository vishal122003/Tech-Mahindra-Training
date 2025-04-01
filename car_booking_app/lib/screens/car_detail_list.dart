import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:car_booking_app/app_localizations.dart'; // Import localization

class CarDetailsList extends StatelessWidget {
  const CarDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('carDetails')), // Localized title
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('car_details').get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${AppLocalizations.of(context).translate('error')}: ${snapshot.error}', // Localized error message
              ),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return ListTile(
                leading: document['carImage'] != null
                    ? Image.network(document['carImage'], width: 50, height: 50)
                    : Icon(Icons.car_rental), // Placeholder if no photo URL
                title: Text(document['carModel']), // Car type remains dynamic
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppLocalizations.of(context).translate('carModel')}: ${document['carType']}', // Localized label
                    ),
                    Text(
                      '${AppLocalizations.of(context).translate('carNumber')}: ${document['carNumber']}', // Localized label
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
