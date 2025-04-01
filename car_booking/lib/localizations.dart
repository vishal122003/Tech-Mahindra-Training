import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'hello': 'Hello',
      'login': 'Login',
      'register': 'Register',
      'email': 'Email',
      'password': 'Password',
      'name': 'Name',
      'carName': 'Car Name',
      'carType': 'Car Type',
      'bookCar': 'Book a Car',
      'boardLocation': 'Boarding Location',
      'dropLocation': 'Drop Location',
      'pickImage': 'Pick Car Image',
      'bookingRequestSent': 'Booking request sent',
    },
    'hi': {
      'hello': 'नमस्ते',
      'login': 'लॉगिन',
      'register': 'रजिस्टर',
      'email': 'ईमेल',
      'password': 'पासवर्ड',
      'name': 'नाम',
      'carName': 'कार का नाम',
      'carType': 'कार का प्रकार',
      'bookCar': 'कार बुक करें',
      'boardLocation': 'चढ़ने का स्थान',
      'dropLocation': 'उतरने का स्थान',
      'pickImage': 'कार की छवि चुनें',
      'bookingRequestSent': 'बुकिंग अनुरोध भेजा गया',
    },
    'ta': {
      'hello': 'வணக்கம்',
      'login': 'உள் நுழை',
      'register': 'பதிவு செய்யவும்',
      'email': 'மின்னஞ்சல்',
      'password': 'கடவுச்சொல்',
      'name': 'பெயர்',
      'carName': 'கார் பெயர்',
      'carType': 'கார் வகை',
      'bookCar': 'கார் முன்பதிவு செய்யவும்',
      'boardLocation': 'ஏறும் இடம்',
      'dropLocation': 'இறங்கும் இடம்',
      'pickImage': 'கார் படத்தைத் தேர்ந்தெடுக்கவும்',
      'bookingRequestSent': 'முன்பதிவு கோரிக்கை அனுப்பப்பட்டது',
    },
    // Add more languages here if needed
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]![key] ?? key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'hi', 'ta'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
