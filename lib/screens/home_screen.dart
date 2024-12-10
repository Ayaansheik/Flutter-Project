import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // To control system UI (status bar)
import 'package:myapp/screens/CategoryProducts_Screen.dart';
import 'package:myapp/screens/new_deals_screen.dart';
import 'package:myapp/widgets/brand_logo_section.dart';
import '../services/mock_data.dart';
import '../widgets/food_card.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/carousel_banner.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/carousel/001.png',
    'assets/carousel/002.png',
    'assets/carousel/003.png',
    'assets/carousel/004.png',
    'assets/carousel/005.png',
  ];

  final List<String> brandLogoUrls = [
    'assets/brandlogo/burgerking.png',
    'assets/brandlogo/kfc.png',
    'assets/brandlogo/mcd.png',
    'assets/brandlogo/starbucks.png',
    'assets/brandlogo/kababjees.png',
    'assets/brandlogo/dunkindonut.png',
  ];

  final List<Map<String, String>> categories = [
    {'name': 'Offers', 'iconPath': 'assets/icons/offers.png'},
    {'name': 'Cake', 'iconPath': 'assets/icons/cake.png'},
    {'name': 'Biryani', 'iconPath': 'assets/icons/biryani.png'},
    {'name': 'Burger', 'iconPath': 'assets/icons/burger.png'},
    {'name': 'Pizza', 'iconPath': 'assets/icons/pizza.png'},
    {'name': 'Coffee', 'iconPath': 'assets/icons/coffee.png'},
    {'name': 'Donut', 'iconPath': 'assets/icons/donut.png'},
    {'name': 'Salad', 'iconPath': 'assets/icons/fruitsalad.png'},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const premiumGreen = Color(0xFF006400); // Dark Green for AppBar background

    // Set the status bar color and icon brightness to match AppBar's color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: premiumGreen, // Match AppBar's background color
      statusBarIconBrightness:
          Brightness.light, // Light icons for dark background
    ));

    final newDeals = mockFoodItems.where((item) => item.isNewDeal).toList();
    final topSelling =
        mockFoodItems.where((item) => item.isTopSelling).toList();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const CustomAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Carousel Banner Section
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: CarouselBanner(imageUrls: imageUrls),
                        ),

                        // Category Grid Section
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 10),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                            ),
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              return GestureDetector(
                                onTap: () {
                                  // Navigate to the CategoryProductsScreen with the selected category
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryProductsScreen(
                                        categoryName: category['name']!,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            blurRadius: 10,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Image.asset(
                                          category['iconPath']!,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      category['name']!,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        // Banner Section
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  Colors.green[400], // Banner background color
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Free Delivery On First Two Orders!',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/all-products');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 5,
                                  ),
                                  child: const Text(
                                    'Order Now',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Top Brands Section
                        BrandLogoSection(brandLogoUrls: brandLogoUrls),
                        // New Deals Section
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "New Deals",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward,
                                    color: Colors.green),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NewDealsScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 2.3,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemCount: newDeals.length,
                            itemBuilder: (ctx, index) {
                              final foodItem = newDeals[index];
                              return FoodCard(foodItem: foodItem);
                            },
                          ),
                        ),

                        // Top Selling Section
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 10),
                          child: Text(
                            "Top Selling",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 2.3,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemCount: topSelling.length,
                            itemBuilder: (ctx, index) {
                              final foodItem = topSelling[index];
                              return FoodCard(foodItem: foodItem);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
