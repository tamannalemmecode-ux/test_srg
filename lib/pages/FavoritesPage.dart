<<<<<<< HEAD
// ✅ lib/pages/favorites_page.dart - FULLY RESPONSIVE WITH SIZER + DARK/LIGHT MODE
=======
// ✅ lib/pages/favorites_page.dart - FULLY RESPONSIVE WITH SIZER
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:new_suvarnraj_group/controller/wishlist_controller.dart';
import 'package:new_suvarnraj_group/controller/cart_controller.dart';
import 'package:new_suvarnraj_group/controller/user_controller.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late WishlistController wishlistCtrl;
  late CartController cartCtrl;
  late UserController userCtrl;

  @override
  void initState() {
    super.initState();
    wishlistCtrl = Get.find<WishlistController>();
    cartCtrl = Get.find<CartController>();
    userCtrl = Get.find<UserController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      wishlistCtrl.loadWishlist();
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface.withOpacity(0.3),
      appBar: AppBar(
        title: Text('My Favorites', style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.onSurface)),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
=======
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('My Favorites', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        elevation: 1,
        centerTitle: true,
        actions: [
          IconButton(
<<<<<<< HEAD
            icon: Icon(Icons.refresh, color: colorScheme.primary),
=======
            icon: const Icon(Icons.refresh, color: Colors.blue),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            onPressed: () {
              wishlistCtrl.loadWishlist();
              Get.snackbar(
                "Refreshed",
                "Favorites updated",
                snackPosition: SnackPosition.BOTTOM,
<<<<<<< HEAD
                backgroundColor: colorScheme.primary.withOpacity(0.1),
                colorText: colorScheme.primary,
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                duration: const Duration(seconds: 1),
              );
            },
          ),
          Obx(() => wishlistCtrl.wishlistItems.isNotEmpty
              ? IconButton(
<<<<<<< HEAD
            icon: Icon(Icons.delete_sweep, color: colorScheme.error),
            onPressed: () => _showClearDialog(colorScheme),
=======
            icon: const Icon(Icons.delete_sweep, color: Colors.red),
            onPressed: () => _showClearDialog(),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          )
              : const SizedBox()),
        ],
      ),
      body: Obx(() {
        if (wishlistCtrl.isLoading.value && wishlistCtrl.wishlistItems.isEmpty) {
<<<<<<< HEAD
          return Center(child: CircularProgressIndicator(color: colorScheme.primary));
        }

        if (wishlistCtrl.wishlistItems.isEmpty) {
          return _buildEmptyState(colorScheme);
=======
          return const Center(child: CircularProgressIndicator());
        }

        if (wishlistCtrl.wishlistItems.isEmpty) {
          return _buildEmptyState();
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        }

        return RefreshIndicator(
          onRefresh: () => wishlistCtrl.loadWishlist(),
<<<<<<< HEAD
          color: colorScheme.primary,
          child: LayoutBuilder(
            builder: (context, constraints) {
=======
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Responsive grid - 3 columns on tablets, 2 on phones
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
              final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

              return GridView.builder(
                padding: EdgeInsets.all(3.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 3.w,
                  childAspectRatio: 0.7,
                ),
                itemCount: wishlistCtrl.wishlistItems.length,
                itemBuilder: (context, index) {
                  final item = wishlistCtrl.wishlistItems[index];
<<<<<<< HEAD
                  return _buildFavoriteCard(item, colorScheme);
=======
                  return _buildFavoriteCard(item);
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                },
              );
            },
          ),
        );
      }),
    );
  }

<<<<<<< HEAD
  Widget _buildFavoriteCard(Map<String, dynamic> item, ColorScheme colorScheme) {
    final price = _parseDouble(item['price']);
    final comparePrice = _parseDouble(item['compare_price']);
    final hasDiscount = comparePrice > 0 && comparePrice > price;
    final discountPercent = hasDiscount ? ((comparePrice - price) / comparePrice * 100).round() : 0;
=======
  // ✅ FAVORITE CARD - RESPONSIVE WITH SIZER
  Widget _buildFavoriteCard(Map<String, dynamic> item) {
    final price = _parseDouble(item['price']);
    final comparePrice = _parseDouble(item['compare_price']);
    final hasDiscount = comparePrice > 0 && comparePrice > price;
    final discountPercent = hasDiscount
        ? ((comparePrice - price) / comparePrice * 100).round()
        : 0;
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    final imageUrl = _normalizeImageUrl(item['image'] ?? item['image_url']);
    final productId = item['id'] ?? item['product_id'];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
<<<<<<< HEAD
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
=======
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
<<<<<<< HEAD
=======
          // Image Section - Fixed aspect ratio
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Container(
<<<<<<< HEAD
                      color: colorScheme.surface.withOpacity(0.5),
=======
                      color: Colors.grey[200],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (_, __, ___) => Container(
<<<<<<< HEAD
                      color: colorScheme.surface.withOpacity(0.5),
                      child: Icon(
                        Icons.image_not_supported,
                        color: colorScheme.onSurface.withOpacity(0.4),
=======
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[400],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                        size: 40,
                      ),
                    ),
                  ),
                ),

<<<<<<< HEAD
=======
                // Discount Badge
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                if (hasDiscount && discountPercent > 0)
                  Positioned(
                    top: 2.w,
                    left: 2.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
<<<<<<< HEAD
                          colors: [colorScheme.error, colorScheme.error.withOpacity(0.7)],
=======
                          colors: [Colors.red[600]!, Colors.red[400]!],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "$discountPercent% OFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

<<<<<<< HEAD
=======
                // Favorite Button
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                Positioned(
                  top: 2.w,
                  right: 2.w,
                  child: GestureDetector(
                    onTap: () async {
                      if (productId != null) {
                        await wishlistCtrl.removeFromWishlist(productId);
                        Get.snackbar(
                          "Removed",
                          "Item removed from favorites",
                          snackPosition: SnackPosition.BOTTOM,
<<<<<<< HEAD
                          backgroundColor: colorScheme.secondary.withOpacity(0.1),
                          colorText: colorScheme.secondary,
=======
                          backgroundColor: Colors.orange[100],
                          colorText: Colors.orange[900],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                          duration: const Duration(seconds: 2),
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
<<<<<<< HEAD
                        color: colorScheme.surface,
=======
                        color: Colors.white.withOpacity(0.95),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite,
<<<<<<< HEAD
                        color: colorScheme.error,
=======
                        color: Colors.red[600],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                        size: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

<<<<<<< HEAD
=======
          // Details Section - Flexible with min size
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
<<<<<<< HEAD
=======
                  // Title - Takes available space
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  Flexible(
                    flex: 2,
                    child: Text(
                      item['title'] ?? item['name'] ?? 'Unknown',
                      style: TextStyle(
                        fontSize: 10.5.sp,
                        fontWeight: FontWeight.w600,
<<<<<<< HEAD
                        color: colorScheme.onSurface,
=======
                        color: Colors.black87,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  SizedBox(height: 0.5.h),

<<<<<<< HEAD
=======
                  // Price Row
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  Row(
                    children: [
                      Text(
                        "₹${price.toStringAsFixed(0)}",
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
<<<<<<< HEAD
                          color: colorScheme.primary,
=======
                          color: Colors.red[600],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                        ),
                      ),
                      if (hasDiscount) ...[
                        SizedBox(width: 1.w),
                        Flexible(
                          child: Text(
                            "₹${comparePrice.toStringAsFixed(0)}",
                            style: TextStyle(
                              fontSize: 9.sp,
<<<<<<< HEAD
                              color: colorScheme.onSurface.withOpacity(0.6),
=======
                              color: Colors.grey[500],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                              decoration: TextDecoration.lineThrough,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),

                  SizedBox(height: 1.h),

<<<<<<< HEAD
=======
                  // Add to Cart Button - Fixed height
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  SizedBox(
                    width: double.infinity,
                    height: 4.5.h,
                    child: ElevatedButton(
<<<<<<< HEAD
                      onPressed: () => _addToCart(item, colorScheme),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
=======
                      onPressed: () => _addToCart(item),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        foregroundColor: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
<<<<<<< HEAD
                          Icon(Icons.shopping_cart, size: 11.sp, color: colorScheme.onPrimary),
=======
                          Icon(Icons.shopping_cart, size: 11.sp),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                          SizedBox(width: 1.w),
                          Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
<<<<<<< HEAD
                              color: colorScheme.onPrimary,
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildEmptyState(ColorScheme colorScheme) {
=======
  // ✅ EMPTY STATE
  Widget _buildEmptyState() {
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 80,
<<<<<<< HEAD
              color: colorScheme.onSurface.withOpacity(0.3),
=======
              color: Colors.grey[300],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            ),
            SizedBox(height: 2.h),
            Text(
              'No Favorites Yet',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
<<<<<<< HEAD
                color: colorScheme.onSurface.withOpacity(0.6),
=======
                color: Colors.grey[600],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              'Add items to your favorites to see them here',
              style: TextStyle(
                fontSize: 13.sp,
<<<<<<< HEAD
                color: colorScheme.onSurface.withOpacity(0.5),
=======
                color: Colors.grey[500],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 3.h),
            ElevatedButton.icon(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.shopping_bag),
              label: const Text('Continue Shopping'),
              style: ElevatedButton.styleFrom(
<<<<<<< HEAD
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
=======
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.5.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

<<<<<<< HEAD
  Future<void> _addToCart(Map<String, dynamic> item, ColorScheme colorScheme) async {
=======
  // ✅ ADD TO CART
  Future<void> _addToCart(Map<String, dynamic> item) async {
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    try {
      if (!userCtrl.isLoggedIn.value || userCtrl.token.value.isEmpty) {
        Get.snackbar(
          "Login Required",
          "Please login to add items to cart",
          snackPosition: SnackPosition.BOTTOM,
<<<<<<< HEAD
          backgroundColor: colorScheme.error.withOpacity(0.1),
          colorText: colorScheme.onError,
=======
          backgroundColor: Colors.orange[600],
          colorText: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          duration: const Duration(seconds: 3),
        );
        return;
      }

      Get.dialog(
        PopScope(
          canPop: false,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
<<<<<<< HEAD
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: colorScheme.primary),
                    SizedBox(height: 16),
                    Text("Adding to cart...", style: TextStyle(fontSize: 16, color: colorScheme.onSurface)),
=======
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: Colors.blue),
                    SizedBox(height: 16),
                    Text("Adding to cart...", style: TextStyle(fontSize: 16)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  ],
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );

      await cartCtrl.addToCart(item, qty: 1);

      if (Get.isDialogOpen == true) {
        Navigator.of(Get.overlayContext!).pop();
      }

      await Future.delayed(const Duration(milliseconds: 300));

      if (Get.context != null) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "${item['title']} added to cart!",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
<<<<<<< HEAD
                    style: const TextStyle(color: Colors.white),
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  ),
                ),
              ],
            ),
<<<<<<< HEAD
            backgroundColor: colorScheme.primary,
=======
            backgroundColor: Colors.green[600],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    } catch (e) {
      if (Get.isDialogOpen == true) {
        Navigator.of(Get.overlayContext!).pop();
      }

      await Future.delayed(const Duration(milliseconds: 200));

      if (Get.context != null) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
<<<<<<< HEAD
            content: Text(
              "Error: ${e.toString().replaceAll('Exception: ', '')}",
              style: const TextStyle(color: Colors.white), // ✅ याऐवजी contentTextStyle वापरू नका
            ),
            backgroundColor: colorScheme.error,
=======
            content: Text("Error: ${e.toString().replaceAll('Exception: ', '')}"),
            backgroundColor: Colors.red[600],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

<<<<<<< HEAD
  void _showClearDialog(ColorScheme colorScheme) {
=======
  // ✅ CLEAR ALL FAVORITES DIALOG
  void _showClearDialog() {
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    Get.defaultDialog(
      title: "Clear All Favorites?",
      middleText: "This action cannot be undone.",
      textConfirm: "Clear",
      textCancel: "Cancel",
<<<<<<< HEAD
      confirmTextColor: colorScheme.onPrimary,
      buttonColor: colorScheme.error,
=======
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
      onConfirm: () {
        wishlistCtrl.clearWishlist();
        Get.back();
      },
    );
  }

<<<<<<< HEAD
=======
  // ✅ HELPER: Parse double
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
  double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

<<<<<<< HEAD
=======
  // ✅ HELPER: Normalize image URL
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
  String _normalizeImageUrl(dynamic rawImage) {
    if (rawImage == null || rawImage.toString().trim().isEmpty) {
      return 'https://via.placeholder.com/300?text=No+Image';
    }
    String url = rawImage.toString().trim();
    if (url.startsWith('http://') || url.startsWith('https://')) return url;
    return 'https://portfolio2.lemmecode.in$url';
  }
}