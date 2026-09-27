import 'package:flutter/material.dart';

void main() {
  runApp(const TravelDashboardApp());
}

// Destination data model
class Destination {
  final String name;
  final IconData icon;

  const Destination({
    required this.name,
    required this.icon,
  });
}

// Travel Deal data model
class TravelDeal {
  final String title;
  final double price;
  final String description;
  final bool isPremium;

  const TravelDeal({
    required this.title,
    required this.price,
    required this.description,
    required this.isPremium,
  });
}

class TravelDashboardApp extends StatelessWidget {
  const TravelDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Dashboard',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),

        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
          ),
        ),
      ),

      home: const TravelHomePage(),
    );
  }
}

class TravelHomePage extends StatelessWidget {
  const TravelHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Destination destination = Destination(
      name: 'Tropical Beach',
      icon: Icons.beach_access,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Dashboard'),
      ),
      body: Center(
        child: Text(
          destination.name,
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}