import 'package:flutter/material.dart';
import 'package:myapp/models/cart_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  final double totalAmount;

  const CheckoutScreen({
    super.key,
    required this.cartItems,
    required this.totalAmount,
  });

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedPaymentMethod = 'credit';

  void selectPaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Full-screen background image
          Positioned.fill(
            child: Image.asset(
              'assets/login_register_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Spacer(),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Complete your purchase",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // List of Items
                          Text(
                            "Items",
                            style: TextStyle(
                              color: Colors.green.shade400,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ...widget.cartItems.map(
                            (cartItem) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                "- ${cartItem.name} x${cartItem.quantity} - \$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Total Price
                          Text(
                            "Total: \$${widget.totalAmount.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Address Field
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.green.withOpacity(0.1),
                              prefixIcon: const Icon(
                                Icons.location_on,
                                color: Colors.green,
                              ),
                              hintText: "Delivery Address",
                              hintStyle:
                                  TextStyle(color: Colors.green.shade400),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Payment Method Selector
                          Text(
                            "Payment Method",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.credit_card,
                                  color: selectedPaymentMethod == 'credit'
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  selectPaymentMethod('credit');
                                },
                              ),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.paypal,
                                  color: selectedPaymentMethod == 'paypal'
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  selectPaymentMethod('paypal');
                                },
                              ),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.applePay,
                                  color: selectedPaymentMethod == 'apple'
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  selectPaymentMethod('apple');
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Place Order Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "This feature is not available yet. The app is currently under development.",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: const Text(
                                "Place Order",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
