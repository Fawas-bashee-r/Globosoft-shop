import 'package:flutter/material.dart';
import 'package:globosoft_shop/constant.dart';
import 'package:provider/provider.dart';
import '../controllers/product_controller.dart';
import '../model/products.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int productID = ModalRoute.of(context)!.settings.arguments as int;
    final productController = Provider.of<ProductController>(context);
    final Product product = productController.getProductById(productID);

    return Scaffold(
      appBar: AppBar(backgroundColor: primaryColor,
        title:const Padding(
          padding:  EdgeInsets.only(left: 30),
          child: Text(
            'GLOBOSOFT SHOP',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
       child: Image.network(
  product.image,
  fit: BoxFit.cover,
  
               
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              'Rs.${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, color: primaryColor),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width, 
              child: ElevatedButton(
                onPressed: () {
              
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor:primaryColor, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
