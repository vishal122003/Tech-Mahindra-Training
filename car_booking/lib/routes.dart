import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/driver/driver_login_screen.dart';
import 'screens/driver/driver_register_screen.dart';
import 'screens/driver/driver_home_screen.dart';
import 'screens/customer/customer_booking_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => HomeScreen(),
  '/driverLogin': (context) => DriverLoginScreen(),
  '/driverRegister': (context) => DriverRegisterScreen(),
  '/driverHome': (context) => DriverHomeScreen(),
  '/customerBooking': (context) => CustomerBookingScreen(),
};
