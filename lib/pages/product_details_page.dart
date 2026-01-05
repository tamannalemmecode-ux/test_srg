import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD

import '../controller/wishlist_controller.dart';

=======
import 'package:get/get_core/src/get_main.dart';

import '../controller/wishlist_controller.dart';
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
class ProductDetailsPage extends StatefulWidget {
  final int productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late WishlistController wishlistController;
  bool _isInWishlist = false;

  @override
  void initState() {
    super.initState();
    wishlistController = Get.put(WishlistController());
    _checkWishlistStatus();
  }

  Future<void> _checkWishlistStatus() async {
    final isIn = await wishlistController.isInWishlist(widget.productId);
<<<<<<< HEAD
    if (mounted) {
      setState(() {
        _isInWishlist = isIn;
      });
    }
=======
    setState(() {
      _isInWishlist = isIn;
    });
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details", style: TextStyle(color: colorScheme.onSurface)),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        actions: [
          IconButton(
            icon: Icon(
              _isInWishlist ? Icons.favorite : Icons.favorite_border,
              color: _isInWishlist ? colorScheme.error : colorScheme.onSurface.withOpacity(0.6),
            ),
            onPressed: () async {
              await wishlistController.toggleWishlist(widget.productId);
              if (mounted) {
                setState(() {
                  _isInWishlist = !_isInWishlist;
                });
              }
=======
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        actions: [
          IconButton(
            icon: Icon(_isInWishlist ? Icons.favorite : Icons.favorite_border),
            color: _isInWishlist ? Colors.red : null,
            onPressed: () async {
              await wishlistController.toggleWishlist(widget.productId);
              setState(() {
                _isInWishlist = !_isInWishlist;
              });
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
<<<<<<< HEAD
            Text(
              "Product ID: ${widget.productId}",
              style: TextStyle(color: colorScheme.onSurface, fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isInWishlist ? colorScheme.error : colorScheme.primary,
              ),
              onPressed: () async {
                await wishlistController.toggleWishlist(widget.productId);
                if (mounted) {
                  setState(() {
                    _isInWishlist = !_isInWishlist;
                  });
                }
              },
              child: Text(
                _isInWishlist ? "Remove from Wishlist" : "Add to Wishlist",
                style: TextStyle(
                  color: _isInWishlist ? colorScheme.onError : colorScheme.onPrimary,
                ),
              ),
=======
            Text("Product ID: ${widget.productId}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await wishlistController.toggleWishlist(widget.productId);
                setState(() {
                  _isInWishlist = !_isInWishlist;
                });
              },
              child: Text(_isInWishlist ? "Remove from Wishlist" : "Add to Wishlist"),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            ),
          ],
        ),
      ),
    );
  }
}