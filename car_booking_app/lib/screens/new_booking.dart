import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../app_localizations.dart'; // Import for localization

class NewBooking extends StatefulWidget {
  const NewBooking({super.key});

  @override
  _NewBookingState createState() => _NewBookingState();
}

class _NewBookingState extends State<NewBooking> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropController = TextEditingController();
  DateTime? _selectedDateTime;

  void _submitBooking() {
  if (_formKey.currentState!.validate()) {
    print('Pickup Location: ${_pickupController.text}');
    print('Drop Location: ${_dropController.text}');
    print('Selected DateTime: $_selectedDateTime');
    
    FirebaseFirestore.instance.collection('bookings').add({
      'pickupLocation': _pickupController.text,
      'dropLocation': _dropController.text,
      'dateTime': _selectedDateTime,
      'customerName': 'John Doe', // Replace with actual customer name
      'carTypeRequired': 'Sedan', // Replace with actual car type
      'carNumber': '', // Set carNumber as empty (null)
      'isConfirmed': false,
    }).then((docRef) {
      print('Booking added successfully: ${docRef.id}');
      Navigator.pop(context); // Navigate back after booking
    }).catchError((error) {
      print('Error adding booking: $error');
    });
  } else {
    print('Form validation failed');
  }
}


  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (time != null) {
        setState(() {
          _selectedDateTime = DateTime(
              picked.year, picked.month, picked.day, time.hour, time.minute);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('newBooking')), // Localized title
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _pickupController,
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context).translate('pickupLocation'), // Localized text
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)
                        .translate('pleaseEnterPickupLocation'); // Localized error
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dropController,
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context).translate('dropLocation'), // Localized text
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)
                        .translate('pleaseEnterDropLocation'); // Localized error
                  }
                  return null;
                },
              ),
              ListTile(
                title: Text(
                  '${AppLocalizations.of(context).translate('dateAndTime')}: ${_selectedDateTime != null ? DateFormat('yyyy-MM-dd – kk:mm').format(_selectedDateTime!) : AppLocalizations.of(context).translate('select')}',
                ),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDateTime(context),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submitBooking,
                child: Text(
                    AppLocalizations.of(context).translate('confirmBooking')), // Localized button text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
