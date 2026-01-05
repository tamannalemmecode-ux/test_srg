<<<<<<< HEAD
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../api/api_service.dart';
import '../controller/user_controller.dart';
import '../controller/cart_controller.dart';
import '../pages/cart_page.dart';
import '../pages/login.dart';
=======
import 'package:flutter/material.dart';
import 'package:new_suvarnraj_group/controller/cart_controller.dart';
import 'package:new_suvarnraj_group/controller/home_page_controller.dart';
import 'package:get/get.dart';
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38

class UnfurnishedFlatPage extends StatefulWidget {
  const UnfurnishedFlatPage({super.key});

  @override
  State<UnfurnishedFlatPage> createState() => _UnfurnishedFlatPageState();
}

class _UnfurnishedFlatPageState extends State<UnfurnishedFlatPage> {
<<<<<<< HEAD
  List<Map<String, dynamic>> unfurnishedFlats = [];
  bool isLoading = true;
  String? errorMessage;
  final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    _loadUnfurnishedFlats();
  }

  Future<void> _loadUnfurnishedFlats() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      final response = await ApiService.getUnfurnishedFlats();

      if (response['status'] == true && response['data'] != null) {
        final products = response['data']['products'] as List;
        setState(() {
          unfurnishedFlats = products.map((e) => e as Map<String, dynamic>).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
      Get.snackbar(
        "Error",
        "Failed to load unfurnished flats",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Theme.of(context).colorScheme.error.withOpacity(0.1),
        colorText: Theme.of(context).colorScheme.error,
      );
    }
  }

  Future<void> _addToCart(int productId, int quantity, String productTitle, Map<String, dynamic> productData) async {
    final colorScheme = Theme.of(context).colorScheme;

    try {
      final token = userController.token.value;

      if (token.isEmpty) {
        Get.snackbar(
          "Login Required",
          "Please login to add items to cart",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: colorScheme.secondary.withOpacity(0.1),
          colorText: colorScheme.onSecondary,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(12),
          borderRadius: 8,
          mainButton: TextButton(
            onPressed: () {
              Get.back();
              Get.to(() => const LoginPage());
            },
            child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        );
        return;
      }

      final cartCtrl = Get.find<CartController>();

      Get.dialog(
        Center(child: CircularProgressIndicator(color: colorScheme.primary)),
        barrierDismissible: false,
      );

      await cartCtrl.addToCart(productData, qty: quantity);

      if (Get.isDialogOpen == true) {
        Get.back();
      }

      Get.snackbar(
        "✅ Success!",
        "$productTitle added to cart!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colorScheme.primary,
        colorText: colorScheme.onPrimary,
        icon: Icon(Icons.check_circle, size: 20, color: colorScheme.onPrimary), // ✅ const काढले
        duration: const Duration(seconds: 2),
        margin: EdgeInsets.all(12),
        borderRadius: 8,
      );

      await Future.delayed(const Duration(milliseconds: 400));
      Get.to(() => const CartPage());

    } catch (e) {
      if (Get.isDialogOpen == true) {
        Get.back();
      }

      Get.snackbar(
        "❗ Error",
        e.toString().replaceAll('Exception: ', ''),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colorScheme.error,
        colorText: colorScheme.onError,
        icon: Icon(Icons.error, size: 20, color: colorScheme.onError), // ✅ const काढले
        margin: EdgeInsets.all(12),
        borderRadius: 8,
      );
    }
  }

  void _log(String message) {
    if (kDebugMode) print('🏠 UnfurnishedFlat: $message');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isLoading) {
      return Scaffold(
        backgroundColor: colorScheme.background,
        body: Center(child: CircularProgressIndicator(color: colorScheme.primary)),
      );
    }

    if (errorMessage != null) {
      return Scaffold(
        backgroundColor: colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 60, color: colorScheme.error),
              SizedBox(height: 2.h),
              Text(
                "Failed to load data",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
              ),
              SizedBox(height: 1.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  "Please check your connection and try again.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.sp, color: colorScheme.onSurface.withOpacity(0.7)),
                ),
              ),
              SizedBox(height: 3.h),
              ElevatedButton.icon(
                onPressed: _loadUnfurnishedFlats,
                icon: const Icon(Icons.refresh),
                label: const Text("Retry"),
                style: ElevatedButton.styleFrom(backgroundColor: colorScheme.primary),
              ),
            ],
          ),
        ),
      );
    }

    if (unfurnishedFlats.isEmpty) {
      return Scaffold(
        backgroundColor: colorScheme.background,
        body: Center(
          child: Text(
            "No unfurnished flats available",
            style: TextStyle(fontSize: 16.sp, color: colorScheme.onSurface.withOpacity(0.6)),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: RefreshIndicator(
        onRefresh: _loadUnfurnishedFlats,
        color: colorScheme.primary,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select your flat type and get professional cleaning service (Unfurnished)",
                style: TextStyle(fontSize: 14.sp, color: colorScheme.onSurface.withOpacity(0.7)),
              ),
              SizedBox(height: 2.h),
              Text(
                "Choose Your Flat Type",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
              ),
              SizedBox(height: 2.h),
              ...unfurnishedFlats.map((flat) => Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: _buildFlatTypeCard(flat, colorScheme),
              )),
            ],
          ),
=======
  String? selectedFlat;
  int quantity = 1;
  int unitPrice = 0;

  final Map<String, int> flatPrices = {
    "1 BHK": 1200,
    "2 BHK": 1800,
    "3 BHK": 2500,
    "4 BHK": 3200,
    "5 BHK": 4000,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select your flat type and get professional cleaning service (Unfurnished)",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            const Text(
              "Choose Your Flat Type",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _buildFlatTypeCard(
                title: "1 BHK",
                description: "1 Bedroom, 1 Hall, 1 Kitchen",
                price: "₹ 1200",
                image: "assets/images/1bhk.png"),
            const SizedBox(height: 15),
            _buildFlatTypeCard(
                title: "2 BHK",
                description: "2 Bedrooms, 1 Hall, 1 Kitchen",
                price: "₹ 1800",
                image: "assets/images/2bhk.png"),
            const SizedBox(height: 15),
            _buildFlatTypeCard(
                title: "3 BHK",
                description: "3 Bedrooms, 1 Hall, 1 Kitchen",
                price: "₹ 2500",
                image: "assets/images/3bhk.png"),
            const SizedBox(height: 15),
            _buildFlatTypeCard(
                title: "4 BHK",
                description: "4 Bedrooms, 1 Hall, 1 Kitchen",
                price: "₹ 3200",
                image: "assets/images/3bhk.png"),
            const SizedBox(height: 15),
            _buildFlatTypeCard(
                title: "5 BHK",
                description: "5 Bedrooms, 1 Hall, 1 Kitchen",
                price: "₹ 4000",
                image: "assets/images/3bhk.png"),
          ],
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildFlatTypeCard(Map<String, dynamic> flat, ColorScheme colorScheme) {
    final int productId = flat['id'];
    final String title = flat['title'] ?? 'Unknown';
    final int price = flat['price'] ?? 0;
    final int comparePrice = flat['compare_price'] ?? 0;
    final String imageUrl = flat['image_url'] ?? '';

    return GestureDetector(
      onTap: () => _showFlatDialog(flat, colorScheme),
      child: Container(
        height: 18.h,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(3.w),
          border: Border.all(color: colorScheme.outline, width: 0.5.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3.w),
                bottomLeft: Radius.circular(3.w),
              ),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                imageUrl,
                width: 30.w,
                height: 18.h,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholderImage(colorScheme),
                loadingBuilder: (_, child, progress) => progress == null
                    ? child
                    : Container(
                  width: 30.w,
                  height: 18.h,
                  color: colorScheme.surface.withOpacity(0.5),
                  child: Center(child: CircularProgressIndicator(color: colorScheme.primary)),
                ),
              )
                  : _placeholderImage(colorScheme),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 0.5.h),
                    Row(
                      children: [
                        Text(
                          "₹ $price",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                        if (comparePrice > price) ...[
                          SizedBox(width: 2.w),
                          Text(
                            "₹ $comparePrice",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: colorScheme.onSurface.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                    if (comparePrice > price)
                      Text(
                        "Save ₹ ${comparePrice - price}",
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: colorScheme.onSurface.withOpacity(0.6), size: 5.w),
            SizedBox(width: 4.w),
          ],
        ),
      ),
    );
  }

  Widget _placeholderImage(ColorScheme colorScheme) {
    return Container(
      width: 30.w,
      height: 18.h,
      color: colorScheme.surface.withOpacity(0.5),
      child: Icon(Icons.home, color: colorScheme.onSurface.withOpacity(0.4)),
    );
  }

  void _showFlatDialog(Map<String, dynamic> flat, ColorScheme colorScheme) {
    int quantity = 1;
    final int productId = flat['id'];
    final String title = flat['title'] ?? 'Unknown';
    final int price = flat['price'] ?? 0;
    final int comparePrice = flat['compare_price'] ?? 0;
    final String imageUrl = flat['image_url'] ?? '';
    final String description = flat['description'] ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              backgroundColor: colorScheme.surface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
              title: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3.w),
                        child: imageUrl.isNotEmpty
                            ? Image.network(
                          imageUrl,
                          width: 40.w,
                          height: 40.w,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) {
                            return Container(
                              width: 40.w,
                              height: 40.w,
                              color: colorScheme.surface.withOpacity(0.5),
                              child: Icon(Icons.home, color: colorScheme.onSurface.withOpacity(0.4)),
                            );
                          },
                        )
                            : Container(
                          width: 40.w,
                          height: 40.w,
                          color: colorScheme.surface.withOpacity(0.5),
                          child: Icon(Icons.home, color: colorScheme.onSurface.withOpacity(0.4)),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "₹ $price",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                        if (comparePrice > price) ...[
                          SizedBox(width: 2.w),
                          Text(
                            "₹ $comparePrice",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: colorScheme.onSurface.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 1) {
                              setStateDialog(() => quantity--);
                            }
                          },
                          icon: Icon(
                            Icons.remove_circle,
                            color: quantity > 1 ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.4),
                            size: 6.w,
                          ),
                        ),
                        Text(
                          "$quantity",
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
                        ),
                        IconButton(
                          onPressed: () {
                            setStateDialog(() => quantity++);
                          },
                          icon: Icon(Icons.add_circle, color: colorScheme.primary, size: 6.w),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Center(
                      child: Text(
                        "Total: ₹ ${price * quantity}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.secondary,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.error,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
                          ),
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.close, color: colorScheme.onError, size: 5.w),
                          label: Text(
                            "Close",
                            style: TextStyle(fontSize: 14.sp, color: colorScheme.onError),
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                            await _addToCart(productId, quantity, title, flat);
                          },
                          icon: Icon(Icons.shopping_cart, color: colorScheme.onPrimary, size: 5.w),
                          label: Text(
                            "Add to Cart",
                            style: TextStyle(fontSize: 14.sp, color: colorScheme.onPrimary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    if (description.isNotEmpty) ...[
                      Text(
                        "🧹 Services Included (Unfurnished):",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        _parseHtmlDescription(description),
                        style: TextStyle(fontSize: 13.sp, height: 1.6, color: colorScheme.onSurface),
                      ),
                    ],
                  ],
                ),
              ),
=======
  Widget _buildFlatTypeCard({
    required String title,
    required String description,
    required String price,
    required String image,
  }) {
    final isSelected = selectedFlat == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFlat = title;
          unitPrice = flatPrices[title]!;
          quantity = 1;
        });

        // Show popup dialog
        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setStateDialog) {
                final total = unitPrice * quantity;
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              image,
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Description
                        Text(
                          description,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black87),
                        ),
                        const SizedBox(height: 12),

                        // Price
                        Text(
                          "Unit Price: $price",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        const SizedBox(height: 20),

                        // Quantity Selector
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  setStateDialog(() {
                                    quantity--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.remove_circle,
                                  color: Colors.blue),
                              iconSize: 30,
                            ),
                            Text(
                              "$quantity",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {
                                setStateDialog(() {
                                  quantity++;
                                });
                              },
                              icon: const Icon(Icons.add_circle,
                                  color: Colors.blue),
                              iconSize: 30,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Total
                        Center(
                          child: Text(
                            "Total: ₹ $total",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close, color: Colors.white),
                              label: const Text(
                                "Close",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                final cartController =
                                Get.find<CartController>();
                                cartController.addToCart({
                                  "title": selectedFlat!,
                                  "price": unitPrice,
                                  "quantity": quantity,
                                  "image":
                                  "assets/images/${selectedFlat!.toLowerCase().replaceAll(' ', '')}.png",
                                });

                                // Switch to Cart tab
                                Get.find<HomePageController>().changeTab(6);

                                Get.snackbar(
                                  "Added to Cart",
                                  "$selectedFlat added successfully",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green.shade100,
                                );

                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.shopping_cart,
                                  color: Colors.white),
                              label: const Text(
                                "Add to Cart",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Services Section
                        const Text(
                          "🧹 Services Included (Unfurnished):",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        const SizedBox(height: 12),

                        const Text(
                          "🏠 Hall Cleaning:\n"
                              "• Dusting & Sweeping\n"
                              "• Floor Scrubbing & Mopping\n\n"
                              "🛏 Bedroom Cleaning:\n"
                              "• Dusting & Sweeping\n"
                              "• Floor Scrubbing & Mopping\n\n"
                              "🍳 Kitchen Cleaning:\n"
                              "• Basic Dusting & Mopping\n"
                              "• Platform Cleaning\n\n"
                              "🚿 Bathroom Cleaning:\n"
                              "• Pot, Sink, Tap & Mirror Cleaning\n"
                              "• Floor Scrubbing & Hard Stain Removal\n\n"
                              "🌿 Balcony Cleaning:\n"
                              "• Dusting, Sweeping, Floor Mopping",
                          style: TextStyle(fontSize: 16, height: 1.6),
                        ),
                      ],
                    ),
                  ),
                );
              },
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            );
          },
        );
      },
<<<<<<< HEAD
    );
  }

  String _parseHtmlDescription(String html) {
    return html
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .trim();
  }
=======
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.asset(
                image,
                width: 100,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    const SizedBox(height: 6),
                    Text(description,
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black54)),
                    const SizedBox(height: 6),
                    Text(price,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)),
                  ],
                ),
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? Colors.blue : Colors.grey,
              size: 28,
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
}