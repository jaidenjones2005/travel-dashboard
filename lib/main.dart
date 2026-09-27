import 'package:flutter/material.dart';

void main() {
  runApp(const TravelDashboardApp());
}

// --------------------
// DATA MODELS
// --------------------

class Destination {
  final String name;
  final IconData icon;

  const Destination({
    required this.name,
    required this.icon,
  });
}

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

// --------------------
// APP
// --------------------

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

// --------------------
// MAIN PAGE
// --------------------

class TravelHomePage extends StatelessWidget {
  const TravelHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Centralized navigation data
    const List<Destination> destinations = [
      Destination(
        name: 'Home',
        icon: Icons.home,
      ),
      Destination(
        name: 'Explore',
        icon: Icons.explore,
      ),
      Destination(
        name: 'Bookings',
        icon: Icons.book,
      ),
      Destination(
        name: 'Profile',
        icon: Icons.person,
      ),
    ];

    // Measure the window width
    final double width = MediaQuery.sizeOf(context).width;

    // Choose the correct layout
    if (width < 600) {
      return const MobileLayout(
        destinations: destinations,
      );
    } else {
      return const DesktopLayout(
        destinations: destinations,
      );
    }
  }
}

// --------------------
// MOBILE LAYOUT
// --------------------

class MobileLayout extends StatelessWidget {
  final List<Destination> destinations;

  const MobileLayout({
    super.key,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> navItems = [];

    for (Destination destination in destinations) {
      navItems.add(
        Expanded(
          child: ListTile(
            leading: Icon(destination.icon),
            onTap: () {},
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Dashboard'),
      ),
      body: Center(
        child: Text(
          'Tropical Beach',
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: navItems,
        ),
      ),
    );
  }
}

// --------------------
// DESKTOP LAYOUT
// --------------------

class DesktopLayout extends StatelessWidget {
  final List<Destination> destinations;

  const DesktopLayout({
    super.key,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> navItems = [];

    for (Destination destination in destinations) {
      navItems.add(
        ListTile(
          leading: Icon(destination.icon),
          title: Text(destination.name),
          onTap: () {},
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Dashboard'),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: Column(
              children: navItems,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Tropical Beach',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}