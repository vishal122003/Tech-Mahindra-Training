import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:car_booking_app/app_localizations.dart';

class CarSelection extends StatelessWidget {
  final Function(String) onCarSelected;

  const CarSelection({super.key, required this.onCarSelected});

  void selectCar(BuildContext context, DocumentSnapshot car) {
    Navigator.pop(context); // Go back to the previous screen after selection
    onCarSelected(car['carNumber']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('selectCarTitle')),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('car_details').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${AppLocalizations.of(context).translate('errorMessage')} ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                semanticsLabel: AppLocalizations.of(context).translate('loadingMessage'),
              ),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return ListTile(
                title: Text(document['carModel']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type: ${document['carType']}'),
                    Text('Car Number: ${document['carNumber']}'),
                  ],
                ),
                onTap: () => selectCar(context, document),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
