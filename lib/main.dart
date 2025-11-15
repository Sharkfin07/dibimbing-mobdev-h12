import 'package:flutter/material.dart';
import './screens/second_screen.dart';
import './screens/third_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/second': (context) => const SecondScreen(),
        // '/third': (context) => const ThirdScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/third') {
          final String message = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => ThirdScreen(message: message),
          );
        }
        return null;
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              // * Ini routing biasa
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                ),
                child: const Text('Go to Second Screen'),
              ),

              // * Ini routing named
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/third',
                  arguments: "Ini dari main.dart!",
                ),
                child: Text('Go to Third Screen'),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(children: [DrawerHeader(child: Text("Menu"))]),
      ),
      appBar: AppBar(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [BottomNavigationBarItem(icon: Icon(Icons.home))],
      // ),
    );
  }
}
