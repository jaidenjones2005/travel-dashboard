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

    // Window-level measurement
    final double width = MediaQuery.sizeOf(context).width;

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

      // Phase 3 content
      body: const DealDashboard(),

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

          // Phase 3 content
          const Expanded(
            child: DealDashboard(),
          ),
        ],
      ),
    );
  }
}

// --------------------
// DEAL DASHBOARD
// --------------------

class DealDashboard extends StatelessWidget {
  const DealDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    const List<TravelDeal> deals = [
      TravelDeal(
        title: 'Beach Getaway',
        price: 499.99,
        description: 'Enjoy a relaxing trip to a tropical beach.',
        isPremium: false,
      ),
      TravelDeal(
        title: 'Mountain Adventure',
        price: 699.99,
        description: 'Explore the mountains and enjoy the outdoors.',
        isPremium: false,
      ),
      TravelDeal(
        title: 'City Escape',
        price: 399.99,
        description: 'Experience an exciting weekend in the city.',
        isPremium: false,
      ),
      TravelDeal(
        title: 'Island Vacation',
        price: 899.99,
        description: 'Spend your vacation on a beautiful island.',
        isPremium: true,
      ),
    ];

    List<Widget> dealCards = [];

    for (TravelDeal deal in deals) {
      dealCards.add(
        DealCard(deal: deal),
      );
    }

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Widget-level responsive breakpoint
          if (constraints.maxWidth > 400) {
            return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: dealCards,
            );
          } else {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: dealCards,
            );
          }
        },
      ),
    );
  }
}

// --------------------
// DEAL CARD
// --------------------

class DealCard extends StatelessWidget {
  final TravelDeal deal;

  const DealCard({
    super.key,
    required this.deal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              deal.title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '\$${deal.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}