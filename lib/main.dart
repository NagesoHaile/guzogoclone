import 'package:flutter/material.dart';
import 'package:guzogoclone/domain/model/cabin_class.dart';
import 'package:guzogoclone/presentation/providers/airport_provider.dart';
import 'package:guzogoclone/presentation/providers/bottom_nav_provider.dart';
import 'package:guzogoclone/presentation/providers/cabin_class_provider.dart';
import 'package:guzogoclone/presentation/providers/passenger_provider.dart';
import 'package:guzogoclone/presentation/providers/trip_way_provider.dart';
import 'package:guzogoclone/presentation/ui/home_screen/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CabinClassProvider()),
        ChangeNotifierProvider(create: (_) => DepartureAirportProvider()),
        ChangeNotifierProvider(create: (_) => DestinationAirportProvider()),
        ChangeNotifierProvider(create: (_) => PassengerProvider()),
        ChangeNotifierProvider(create: (_) => TripWayProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Guzogo Clone',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Home()),
    );
  }
}
