import 'package:flutter/material.dart'; //provides widgets implementing the Material Design structure

void main() {             // entry point of the application
  runApp(const MyApp());       // root of the flutter app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(           //root widget for a Material Design application
      title: 'Basic App',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),

      initialRoute: '/splash', // Set initial route to splash
      routes: {
        '/splash': (context) => const SplashScreen(), // Define splash screen route
        '/login': (context) => const LoginPage(), // Define login page route
        '/home': (context) =>  const HomePage(), // Define home page route
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Navigate to login page and replace the current route
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      backgroundColor: Colors.blue, // Set background color here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'My Item App', //  app title
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 20),
            Image.asset('images/da.jpg',
              width: 300.0,
              height: 300.0,
              fit: BoxFit.cover, 
            ),
            const SizedBox(height: 20),
            const Text(
              'This is a Flutter app with a list of items',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20), //add vertical spacing between the text fields and the login button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key}); // Corrected constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item $index'),
            onTap: () {
              // Do something when item is tapped
            },
          );
        },
      ),
    );
  }
}