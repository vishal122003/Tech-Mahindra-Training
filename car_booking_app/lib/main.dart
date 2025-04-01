import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:car_booking_app/app_localizations.dart';
import 'package:car_booking_app/screens/driver_login.dart';
import 'package:car_booking_app/screens/customer_login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    MyAppState? state = context.findAncestorStateOfType<MyAppState>();
    state?.setLocale(newLocale);
  }
}

class MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Booking App',
      locale: _locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('ta', ''), // Tamil
        const Locale('hi', ''), // Hindi
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/driver_login': (context) => DriverLogin(),
        '/customer_login': (context) => CustomerLogin(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('appTitle')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo at the top
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Image.asset(
                'assets/logo.jpg', // Replace with your actual logo asset path
                height: 100,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/driver_login');
              },
              child: Text(AppLocalizations.of(context).translate('driverDashboard')),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/customer_login');
              },
              child: Text(AppLocalizations.of(context).translate('customerDashboard')),
            ),
            // Language selection section
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                AppLocalizations.of(context).translate('selectLanguage'),
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    MyApp.setLocale(context, Locale('ta', '')); // Set locale to Tamil
                  },
                  child: Text('தமிழ்'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    MyApp.setLocale(context, Locale('hi', '')); // Set locale to Hindi
                  },
                  child: Text('हिन्दी'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    MyApp.setLocale(context, Locale('en', '')); // Set locale to English
                  },
                  child: Text('English'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
