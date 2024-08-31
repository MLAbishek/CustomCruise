import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ECommerceScreen extends StatelessWidget {
  const ECommerceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop', style: GoogleFonts.raleway(color: Colors.orange[300], fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.orange[300]),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Cart functionality coming soon!')),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return _buildProductCard(context, index);
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, int index) {
    final List<String> categories = ['Wheels', 'Performance', 'Engine Parts', 'Exterior'];
    final List<double> prices = [249.95, 299.94, 349.93, 399.92];
    final category = categories[index % categories.length];
    final price = prices[index % prices.length];

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product_details',
          arguments: {
            'productName': category,
            'price': price,
            'imageAsset': 'assets/images/product_${index + 1}.jpg',
          },
        );
      },
      child: Card(
        color: Colors.grey[900],
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                'assets/images/product_${index + 1}.jpg',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: GoogleFonts.poppins(color: Colors.orange[300], fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Premium',
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: GoogleFonts.roboto(color: Colors.orange[300], fontSize: 16, fontWeight: FontWeight.bold),
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