
import 'package:ecommerce_app/cart/services/cart_services.dart';
import 'package:ecommerce_app/products/model/product_model.dart';
import 'package:ecommerce_app/products/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductService _productService = ProductService();
  final CartService _cartService = CartService();
  late Future<Product> _productFuture;
  bool _addingToCart = false;

  @override
  void initState() {
    super.initState();
    _productFuture = _productService.getProductById(widget.productId);
  }

  Future<void> _addToCart(int productId) async {
    setState(() => _addingToCart = true);
    try {
      await _cartService.addToCart(productId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Added to cart!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _addingToCart = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<Product>(
        future: _productFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          final product = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product.thumbnail,
                    width: double.infinity,
                    height: 280,
                    fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text('\$${product.price}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '-${product.discountPercentage.toStringAsFixed(0)}%',
                              style: const TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          Text(' ${product.rating}  ·  ${product.stock} in stock'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(product.description,
                          style: TextStyle(color: Colors.grey[700])),
                      const SizedBox(height: 16),
                      const Text('Reviews',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      ...product.reviews.map((review) => Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(review.rating.toString()),
                              ),
                              title: Text(review.reviewerName),
                              subtitle: Text(review.comment),
                            ),
                          )),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: _addingToCart
                              ? null
                              : () => _addToCart(product.id),
                          icon: _addingToCart
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : const Icon(Icons.add_shopping_cart),
                          label: const Text('Add to Cart',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

