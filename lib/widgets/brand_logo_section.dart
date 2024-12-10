import 'package:flutter/material.dart';

class BrandLogoSection extends StatelessWidget {
  final List<String> brandLogoUrls;

  const BrandLogoSection({super.key, required this.brandLogoUrls});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Top Brands",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100, // Increased height for a larger card space
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brandLogoUrls.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12), // Increased spacing between logos
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 249, 247, 198)
                              .withOpacity(0.9),
                          const Color.fromARGB(255, 218, 231, 184)
                              .withOpacity(0.5),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            8.0), // Added padding to prevent logo from being too close to the border
                        child: Image.asset(
                          brandLogoUrls[index],
                          fit: BoxFit
                              .contain, // Better fit for logos to maintain aspect ratio
                          height:
                              80, // Keep the size manageable but with more breathing room
                          width:
                              120, // Slightly adjusted width for better proportions
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
