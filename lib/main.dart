import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/screens/checkout_Screen.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'screens/new_deals_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/food_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/all_products_screen.dart';
import 'screens/splash_screen.dart';
import 'provider/cart_provider.dart';
import 'models/cart_item.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: FoodDeliveryApp(),
    ),
  );
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitezi',
      theme: ThemeData(
        primaryColor: const Color(0xFF006400), // premiumGreen
        hintColor: const Color(0xFFFFD700), // gold
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
          bodyLarge: TextStyle(fontSize: 16),
          labelLarge: TextStyle(fontSize: 16),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFFFD700), // gold
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFD700), // gold accent color
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF006400), // premiumGreen
        ),
      ),
      home: const SplashScreenHandler(),
      routes: {
        // '/home': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/details': (context) => const FoodDetailScreen(),
        '/cart': (context) => const CartScreen(),
        '/new-deals': (context) => const NewDealsScreen(),
        '/checkout': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return CheckoutScreen(
            cartItems: args['cartItems'] as List<CartItem>,
            totalAmount: args['totalAmount'] as double,
          );
        },
        '/all-products': (context) => const AllProductsScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}

class SplashScreenHandler extends StatefulWidget {
  const SplashScreenHandler({super.key});

  @override
  _SplashScreenHandlerState createState() => _SplashScreenHandlerState();
}

class _SplashScreenHandlerState extends State<SplashScreenHandler> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
