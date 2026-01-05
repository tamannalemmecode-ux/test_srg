import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:new_suvarnraj_group/pages/success_animation.dart';
=======
import 'package:new_suvarnraj_group/controller/booking_controller.dart';
import 'package:new_suvarnraj_group/controller/cart_controller.dart';
import 'package:new_suvarnraj_group/controller/home_page_controller.dart';
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
import 'package:table_calendar/table_calendar.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../api/api_service.dart';
<<<<<<< HEAD
import '../controller/booking_controller.dart';
import '../controller/cart_controller.dart';
import '../controller/user_controller.dart';
import 'home_page.dart';
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38

class BillingDetailsPage extends StatefulWidget {
  final Map<String, dynamic> billingData;
  const BillingDetailsPage({super.key, required this.billingData});

  @override
  State<BillingDetailsPage> createState() => _BillingDetailsPageState();
}

class _BillingDetailsPageState extends State<BillingDetailsPage> {
  DateTime? bookingDate;
  String? bookingTime;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
<<<<<<< HEAD
  final TextEditingController addressController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
=======
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController secondaryAddressController = TextEditingController();
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
  final TextEditingController couponController = TextEditingController();

  bool hasCoupon = false;
  double discount = 0.0;
  String appliedCoupon = "";
  String paymentMethod = "cod";
<<<<<<< HEAD
=======
  String? selectedArea;
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
  int? selectedCityId;
  String? selectedCityName;

  bool _isProcessing = false;
  bool _citiesLoading = true;
  List<Map<String, dynamic>> cities = [];

  final List<String> times = ["09:00 AM", "12:00 PM", "03:00 PM", "06:00 PM"];
<<<<<<< HEAD

  late UserController userCtrl;
  late CartController cartCtrl;
  late BookingController bookingCtrl;
=======
  final List<String> areas = ["Downtown", "City Center", "Suburbs", "Others"];
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    userCtrl = Get.find<UserController>();
    cartCtrl = Get.find<CartController>();
    bookingCtrl = Get.find<BookingController>();

=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    _loadUserData();
    _fetchCities();
  }

  Future<void> _loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final fullName = prefs.getString("name") ?? "";
      final email = prefs.getString("email") ?? "";
      final phone = prefs.getString("phone") ?? "";

      final parts = fullName.trim().split(' ');
      firstNameController.text = parts.isNotEmpty ? parts.first : "";
      lastNameController.text = parts.length > 1 ? parts.sublist(1).join(' ') : "";
      emailController.text = email;
      phoneController.text = phone;
<<<<<<< HEAD
    } catch (e) {
      print('❌ Error loading user data: $e');
=======
      setState(() {});
    } catch (e) {
      print('Error loading user data: $e');
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    }
  }

  Future<void> _fetchCities() async {
    try {
      setState(() => _citiesLoading = true);
<<<<<<< HEAD

      final token = userCtrl.token.value;
      final response = await ApiService.fetchCheckoutData(
        token: token.isNotEmpty ? token : null,
      );

      final fetchedCities = response['data']['areas'] as List<dynamic>?;

      if (fetchedCities != null) {
=======
      final response = await ApiService.fetchCheckoutData();

      if (response['data'] != null && response['data']['cities'] != null) {
        final fetchedCities = response['data']['cities'] as List<dynamic>;
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        setState(() {
          cities = fetchedCities.map((c) {
            return {
              'id': c['id'] as int? ?? 0,
              'name': c['name'] as String? ?? 'Unknown',
            };
          }).toList();
          _citiesLoading = false;
        });
<<<<<<< HEAD
      } else {
        setState(() => _citiesLoading = false);
        _showError('No cities available');
      }
    } catch (e) {
      setState(() => _citiesLoading = false);
      _showError('Failed to load cities: ${e.toString()}');
=======
      }
    } catch (e) {
      print('Error fetching cities: $e');
      setState(() => _citiesLoading = false);
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
<<<<<<< HEAD
    addressController.dispose();
    apartmentController.dispose();
    stateController.dispose();
    pinController.dispose();
=======
    stateController.dispose();
    pinController.dispose();
    secondaryAddressController.dispose();
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    couponController.dispose();
    super.dispose();
  }

<<<<<<< HEAD
  late ColorScheme _colorScheme;

  @override
  Widget build(BuildContext context) {
    _colorScheme = Theme.of(context).colorScheme;
=======
  @override
  Widget build(BuildContext context) {
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    final items = widget.billingData["items"] as List<dynamic>;
    final total = (widget.billingData["totalAmount"] as num).toDouble();
    final payable = (total - discount).clamp(0.0, double.infinity);
    final advance = (payable * 0.1).toInt();

    return Scaffold(
<<<<<<< HEAD
      backgroundColor: _colorScheme.background,
=======
      backgroundColor: const Color(0xFFF5F7FB),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
<<<<<<< HEAD
              backgroundColor: _colorScheme.surface,
=======
              backgroundColor: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
              elevation: 1,
              expandedHeight: 12.h,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
<<<<<<< HEAD
                title: Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: FaIcon(FontAwesomeIcons.receipt, size: 18.sp, color: _colorScheme.primary),
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: Text(
                          "Booking & Billing",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: _colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                background: Container(color: _colorScheme.surface),
=======
                title: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.receipt, size: 18.sp, color: Colors.blue),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: Text("Booking & Billing", style: TextStyle(fontSize: 14.sp, color: Colors.black)),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          hasCoupon = false;
                          appliedCoupon = "";
                          discount = 0.0;
                          couponController.clear();
                        });
                        Get.snackbar("Coupon", "Cleared", snackPosition: SnackPosition.BOTTOM);
                      },
                      icon: Icon(Icons.refresh, color: Colors.grey, size: 18.sp),
                    )
                  ],
                ),
                background: Container(color: Colors.white),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(4.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildBookingScheduleCard(),
                  SizedBox(height: 2.h),
                  _buildPersonalInfoCard(),
                  SizedBox(height: 2.h),
                  _buildAddressDetailsCard(),
                  SizedBox(height: 2.h),
                  _buildCouponCard(total),
                  SizedBox(height: 2.h),
                  _buildOrderSummaryCard(items, total, payable, advance),
                  SizedBox(height: 2.h),
                  _buildPaymentMethodCard(),
                  SizedBox(height: 2.h),
                  _buildConfirmButton(payable),
                  SizedBox(height: 3.h),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingScheduleCard() {
    return _fancyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            FaIcon(FontAwesomeIcons.calendarAlt, size: 18.sp, color: Colors.purple),
<<<<<<< HEAD
            SizedBox(width: 3.w),
            Text("Booking Schedule", style: _boldStyle()),
=======
            SizedBox(width: 2.w),
            Text("Booking Schedule", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          ]),
          SizedBox(height: 2.h),
          _calendarDatePicker(),
          SizedBox(height: 2.h),
          _timeDropdown(),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoCard() {
    return _fancyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            FaIcon(FontAwesomeIcons.user, size: 18.sp, color: Colors.teal),
<<<<<<< HEAD
            SizedBox(width: 3.w),
            Text("Personal Information", style: _boldStyle()),
=======
            SizedBox(width: 2.w),
            Text("Personal Information", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          ]),
          SizedBox(height: 2.h),
          Row(
            children: [
<<<<<<< HEAD
              Expanded(child: _buildTextField("First Name *", firstNameController, Icons.person)),
              SizedBox(width: 3.w),
              Expanded(child: _buildTextField("Last Name *", lastNameController, null)),
            ],
          ),
          SizedBox(height: 2.h),
          _buildTextField("Email *", emailController, Icons.email, TextInputType.emailAddress),
=======
              Expanded(
                child: _buildTextField("First Name *", firstNameController, Icons.person),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: _buildTextField("Last Name *", lastNameController, null),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          _buildTextField("Email *", emailController, Icons.email, TextInputType.emailAddress, null),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          SizedBox(height: 2.h),
          _buildTextField("Phone *", phoneController, Icons.phone, TextInputType.phone, 10),
        ],
      ),
    );
  }

  Widget _buildAddressDetailsCard() {
    return _fancyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            FaIcon(FontAwesomeIcons.mapMarkedAlt, size: 18.sp, color: Colors.red),
<<<<<<< HEAD
            SizedBox(width: 3.w),
            Text("Address Details", style: _boldStyle()),
          ]),
          SizedBox(height: 2.h),

          if (_citiesLoading)
            SizedBox(
              height: 5.h,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(_colorScheme.primary),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      "Loading cities...",
                      style: _bodyStyle().copyWith(color: _colorScheme.onSurface.withOpacity(0.6)),
                    ),
                  ],
                ),
              ),
            )
          else if (cities.isEmpty)
            Container(
              padding: EdgeInsets.all(2.h),
              decoration: BoxDecoration(
                color: _colorScheme.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(2.w),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: _colorScheme.error),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Text(
                      "No cities available. Please try again.",
                      style: _bodyStyle().copyWith(color: _colorScheme.error),
                    ),
                  ),
                  TextButton(
                    onPressed: _fetchCities,
                    child: Text(
                      "Retry",
                      style: _bodyStyle().copyWith(color: _colorScheme.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          else
            DropdownButtonFormField<int>(
              value: selectedCityId,
              isExpanded: true,
              items: cities.map((city) {
                return DropdownMenuItem<int>(
                  value: city['id'],
                  child: Text(
                    city['name'],
                    style: _bodyStyle(),
                    overflow: TextOverflow.ellipsis,
                  ),
=======
            SizedBox(width: 2.w),
            Text("Address Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
          ]),
          SizedBox(height: 2.h),
          if (_citiesLoading)
            SizedBox(height: 5.h, child: Center(child: CircularProgressIndicator()))
          else if (cities.isEmpty)
            Text("No cities available", style: TextStyle(color: Colors.red, fontSize: 12.sp))
          else
            DropdownButtonFormField<int>(
              value: selectedCityId,
              items: cities.map((city) {
                return DropdownMenuItem<int>(
                  value: city['id'],
                  child: Text(city['name'], style: TextStyle(fontSize: 12.sp)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) {
                  final city = cities.firstWhere((c) => c['id'] == val);
                  setState(() {
                    selectedCityId = val;
                    selectedCityName = city['name'];
                  });
                }
              },
              decoration: InputDecoration(
<<<<<<< HEAD
                labelText: "Select City / Area *",
                labelStyle: _bodyStyle(),
                prefixIcon: Icon(Icons.location_city, size: 18.sp, color: _colorScheme.onSurface.withOpacity(0.6)),
                contentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w)),
                filled: true,
                fillColor: _colorScheme.surface,
              ),
            ),

          SizedBox(height: 2.h),
          _buildTextField("Address *", addressController, Icons.location_on, TextInputType.text, null, 2),
          SizedBox(height: 2.h),
          _buildTextField("Apartment/Landmark", apartmentController, Icons.home_outlined),
          SizedBox(height: 2.h),
          Row(
            children: [
              Expanded(child: _buildTextField("State *", stateController, null)),
              SizedBox(width: 3.w),
              Expanded(child: _buildTextField("Pin *", pinController, null, TextInputType.number, 6)),
            ],
          ),
=======
                labelText: "City *",
                prefixIcon: Icon(Icons.location_city, size: 18.sp),
                contentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
                labelStyle: TextStyle(fontSize: 12.sp),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w)),
              ),
            ),
          SizedBox(height: 2.h),
          _buildTextField("State *", stateController, null),
          SizedBox(height: 2.h),
          Row(
            children: [
              Expanded(
                child: _buildTextField("Pin *", pinController, null, TextInputType.number, 6),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedArea,
                  items: areas.map((a) => DropdownMenuItem(value: a, child: Text(a, style: TextStyle(fontSize: 12.sp)))).toList(),
                  onChanged: (val) => setState(() => selectedArea = val),
                  decoration: InputDecoration(
                    labelText: "Area *",
                    contentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
                    labelStyle: TextStyle(fontSize: 12.sp),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          _buildTextField("Secondary Address", secondaryAddressController, Icons.home_outlined, TextInputType.text, null, 2),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        ],
      ),
    );
  }

  Widget _buildCouponCard(double total) {
    return _fancyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            FaIcon(FontAwesomeIcons.tag, size: 18.sp, color: Colors.indigo),
<<<<<<< HEAD
            SizedBox(width: 3.w),
            Text("Discount Coupon", style: _boldStyle()),
=======
            SizedBox(width: 2.w),
            Text("Discount Coupon", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          ]),
          SizedBox(height: 1.h),
          CheckboxListTile(
            value: hasCoupon,
            onChanged: (val) {
              setState(() {
                hasCoupon = val ?? false;
                if (!hasCoupon) {
                  discount = 0.0;
                  appliedCoupon = "";
                  couponController.clear();
                }
              });
            },
<<<<<<< HEAD
            title: Text("I have a discount coupon", style: _bodyStyle()),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            activeColor: _colorScheme.primary,
=======
            title: Text("I have a discount coupon", style: TextStyle(fontSize: 12.sp)),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          ),
          if (hasCoupon)
            Row(
              children: [
<<<<<<< HEAD
                Expanded(child: _buildTextField("Coupon Code", couponController, null)),
                SizedBox(width: 3.w),
                ElevatedButton.icon(
                  icon: FaIcon(FontAwesomeIcons.check, size: 14.sp, color: Colors.white),
                  label: Text("Apply", style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () => _applyCoupon(total),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _colorScheme.primary,
                    padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
=======
                Expanded(
                  child: _buildTextField("Coupon Code", couponController, null),
                ),
                SizedBox(width: 2.w),
                ElevatedButton.icon(
                  icon: FaIcon(FontAwesomeIcons.check, size: 14.sp, color: Colors.white),
                  label: Text("Apply", style: TextStyle(fontSize: 12.sp, color: Colors.white)),
                  onPressed: () => _applyCoupon(total),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  ),
                ),
              ],
            ),
          if (appliedCoupon.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: 1.h),
<<<<<<< HEAD
              child: Text(
                "Applied: $appliedCoupon - Saved ₹${discount.toStringAsFixed(0)}",
                style: TextStyle(color: _colorScheme.secondary, fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
=======
              child: Text("Applied: $appliedCoupon - Saved ₹${discount.toStringAsFixed(0)}",
                  style: TextStyle(color: Colors.green, fontSize: 12.sp, fontWeight: FontWeight.bold)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            ),
        ],
      ),
    );
  }

  Widget _buildOrderSummaryCard(List<dynamic> items, double total, double payable, int advance) {
    return _fancyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            FaIcon(FontAwesomeIcons.shoppingCart, size: 18.sp, color: Colors.orange),
<<<<<<< HEAD
            SizedBox(width: 3.w),
            Text("Order Summary", style: _boldStyle()),
          ]),
          SizedBox(height: 2.h),
          ...items.map((item) => Padding(
            padding: EdgeInsets.symmetric(vertical: 0.6.h),
            child: Row(
              children: [
                Expanded(
                  child: Text("${item['title']} × ${item['quantity']}", style: _bodyStyle()),
                ),
                Text(
                  "₹${((item['price'] ?? 0) * (item['quantity'] ?? 1)).toStringAsFixed(0)}",
                  style: _boldStyle(),
                ),
              ],
            ),
          )),
          Divider(color: _colorScheme.outlineVariant, thickness: 0.3.h),
          _summaryRow("Subtotal", "₹${total.toStringAsFixed(0)}"),
          _summaryRow("Discount", "- ₹${discount.toStringAsFixed(0)}"),
          _summaryRow("Service Charge", "₹50"),
          Divider(color: _colorScheme.outlineVariant, thickness: 0.3.h),
          _summaryRowBold("Final Amount", "₹${payable.toStringAsFixed(0)}"),
          SizedBox(height: 1.h),
          Text(
            "Advance (10%): ₹$advance",
            style: TextStyle(color: _colorScheme.secondary, fontSize: 15.sp, fontWeight: FontWeight.bold),
          ),
=======
            SizedBox(width: 2.w),
            Text("Order Summary", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
          ]),
          SizedBox(height: 2.h),
          ...items.map((item) => Padding(
            padding: EdgeInsets.symmetric(vertical: 0.5.h),
            child: Row(
              children: [
                Expanded(
                  child: Text("${item['title']} × ${item['quantity']}", style: TextStyle(fontSize: 12.sp)),
                ),
                Text("₹${(item['price'] * item['quantity']).toStringAsFixed(0)}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
              ],
            ),
          )),
          Divider(thickness: 0.2.h),
          _summaryRow("Subtotal", "₹${total.toStringAsFixed(0)}"),
          _summaryRow("Discount", "- ₹${discount.toStringAsFixed(0)}"),
          _summaryRow("Commuting Charge", "₹0"),
          Divider(thickness: 0.2.h),
          _summaryRowBold("Final Amount", "₹${payable.toStringAsFixed(0)}"),
          SizedBox(height: 1.h),
          Text("Advance (10%): ₹$advance", style: TextStyle(color: Colors.green[700], fontSize: 12.sp, fontWeight: FontWeight.bold)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        ],
      ),
    );
  }

  Widget _buildPaymentMethodCard() {
    return _fancyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            FaIcon(FontAwesomeIcons.moneyCheckAlt, size: 18.sp, color: Colors.brown),
<<<<<<< HEAD
            SizedBox(width: 3.w),
            Text("Payment Method", style: _boldStyle()),
=======
            SizedBox(width: 2.w),
            Text("Payment Method", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          ]),
          SizedBox(height: 1.h),
          RadioListTile<String>(
            value: "cod",
            groupValue: paymentMethod,
            onChanged: (val) => setState(() => paymentMethod = val ?? "cod"),
<<<<<<< HEAD
            title: Text("Cash on Delivery (COD)", style: _bodyStyle()),
            secondary: FaIcon(FontAwesomeIcons.moneyBillWave, size: 16.sp),
            contentPadding: EdgeInsets.zero,
            activeColor: _colorScheme.primary,
          ),
          // RadioListTile<String>(
          //   value: "advance",
          //   groupValue: paymentMethod,
          //   onChanged: (val) => setState(() => paymentMethod = val ?? "advance"),
          //   title: Text("Pay 10% Advance", style: _bodyStyle()),
          //   secondary: FaIcon(FontAwesomeIcons.handHoldingUsd, size: 16.sp),
          //   contentPadding: EdgeInsets.zero,
          //   activeColor: _colorScheme.primary,
          // ),
=======
            title: Text("Cash on Delivery (COD)", style: TextStyle(fontSize: 12.sp)),
            secondary: FaIcon(FontAwesomeIcons.moneyBillWave, size: 16.sp),
            contentPadding: EdgeInsets.zero,
          ),
          RadioListTile<String>(
            value: "advance",
            groupValue: paymentMethod,
            onChanged: (val) => setState(() => paymentMethod = val ?? "advance"),
            title: Text("Pay 10% Advance", style: TextStyle(fontSize: 12.sp)),
            secondary: FaIcon(FontAwesomeIcons.handHoldingUsd, size: 16.sp),
            contentPadding: EdgeInsets.zero,
          ),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        ],
      ),
    );
  }

  Widget _buildConfirmButton(double payable) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
<<<<<<< HEAD
          backgroundColor: _colorScheme.primary,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
        ),
        onPressed: _isProcessing ? null : () => _placeOrder(payable),
        child: Text(
          _isProcessing ? "Processing..." : "Confirm Booking • ₹${payable.toStringAsFixed(0)}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp, color: _colorScheme.onPrimary),
        ),
=======
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(vertical: 1.8.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
        ),
        onPressed: _isProcessing ? null : () => _placeOrder(payable),
        child: Text("Confirm Booking • ₹${payable.toStringAsFixed(0)}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, color: Colors.white)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
      ),
    );
  }

  Widget _buildTextField(
      String label,
      TextEditingController controller,
      IconData? icon, [
        TextInputType type = TextInputType.text,
        int? maxLength,
        int maxLines = 1,
      ]) {
    return TextField(
      controller: controller,
      keyboardType: type,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
<<<<<<< HEAD
        labelStyle: _bodyStyle(),
        prefixIcon: icon != null ? Icon(icon, size: 18.sp, color: _colorScheme.onSurface.withOpacity(0.6)) : null,
        contentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
        counterText: "",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.w),
          borderSide: BorderSide(color: _colorScheme.outline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.w),
          borderSide: BorderSide(color: _colorScheme.primary, width: 2),
        ),
        filled: true,
        fillColor: _colorScheme.surface,
      ),
      style: _bodyStyle(),
=======
        prefixIcon: icon != null ? Icon(icon, size: 18.sp) : null,
        contentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
        labelStyle: TextStyle(fontSize: 12.sp),
        counterText: "",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w)),
      ),
      style: TextStyle(fontSize: 12.sp),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    );
  }

  Widget _fancyCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
<<<<<<< HEAD
        color: _colorScheme.surface,
=======
        color: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        borderRadius: BorderRadius.circular(2.w),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 4.sp, offset: Offset(0, 2.sp))],
      ),
      padding: EdgeInsets.all(3.w),
      child: child,
    );
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
<<<<<<< HEAD
      padding: EdgeInsets.symmetric(vertical: 0.6.h),
      child: Row(
        children: [
          Expanded(child: Text(label, style: _bodyStyle())),
          Text(value, style: _bodyStyle().copyWith(fontWeight: FontWeight.w500)),
        ],
      ),
=======
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(children: [
        Expanded(child: Text(label, style: TextStyle(fontSize: 12.sp))),
        Text(value, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp)),
      ]),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    );
  }

  Widget _summaryRowBold(String label, String value) {
    return Padding(
<<<<<<< HEAD
      padding: EdgeInsets.symmetric(vertical: 0.6.h),
      child: Row(
        children: [
          Expanded(child: Text(label, style: _bodyStyle())),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp, color: _colorScheme.primary)),
        ],
      ),
    );
  }

  TextStyle _bodyStyle() => TextStyle(fontSize: 14.sp, height: 1.3, color: _colorScheme.onSurface);
  TextStyle _boldStyle() => TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, height: 1.3, color: _colorScheme.onSurface);

  Widget _calendarDatePicker() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_colorScheme.primary.withOpacity(0.1), _colorScheme.surface],
            ),
            borderRadius: BorderRadius.circular(2.w),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4.sp, offset: Offset(0, 2.sp))],
          ),
          padding: EdgeInsets.all(3.w),
          child: TableCalendar(
            firstDay: DateTime.now(),
            lastDay: DateTime(DateTime.now().year + 2),
            focusedDay: bookingDate ?? DateTime.now(),
            selectedDayPredicate: (day) => bookingDate != null && isSameDay(bookingDate, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() => bookingDate = selectedDay);
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: _colorScheme.onSurface),
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [_colorScheme.primary, _colorScheme.primary.withOpacity(0.7)]),
              ),
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _colorScheme.primary.withOpacity(0.1),
                border: Border.all(color: _colorScheme.primary),
              ),
              defaultTextStyle: TextStyle(color: _colorScheme.onSurface),
              outsideTextStyle: TextStyle(color: _colorScheme.onSurface.withOpacity(0.4)),
            ),
          ),
        ),
        SizedBox(height: 1.h),
      ],
    );
=======
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(children: [
        Expanded(child: Text(label, style: TextStyle(fontSize: 12.sp))),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp, color: Colors.blue)),
      ]),
    );
  }

  Widget _calendarDatePicker() {
    try {
      final bookingController = Get.find<BookingController>();
      return Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade50, Colors.white],
              ),
              borderRadius: BorderRadius.circular(2.w),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4.sp, offset: Offset(0, 2.sp))],
            ),
            padding: EdgeInsets.all(3.w),
            child: TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime(DateTime.now().year + 2),
              focusedDay: bookingDate ?? DateTime.now(),
              selectedDayPredicate: (day) => bookingDate != null && isSameDay(bookingDate, day),
              onDaySelected: (selectedDay, focusedDay) {
                if (bookingController.isDateFull(selectedDay)) {
                  _showError("This date is already full");
                } else {
                  setState(() => bookingDate = selectedDay);
                }
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.blueGrey[900]),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [Color(0xFF42A5F5), Color(0xFF1E88E5)]),
                ),
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade50,
                  border: Border.all(color: Colors.blue.shade300),
                ),
              ),
            ),
          ),
          SizedBox(height: 1.h),
        ],
      );
    } catch (e) {
      return Text("Error loading calendar: $e");
    }
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
  }

  Widget _timeDropdown() {
    return DropdownButtonFormField<String>(
      value: bookingTime,
<<<<<<< HEAD
      items: times.map((t) => DropdownMenuItem(value: t, child: Text(t, style: _bodyStyle()))).toList(),
      onChanged: (val) => setState(() => bookingTime = val),
      decoration: InputDecoration(
        labelText: "Select Time *",
        labelStyle: _bodyStyle(),
        prefixIcon: Icon(Icons.access_time, size: 18.sp, color: _colorScheme.onSurface.withOpacity(0.6)),
        contentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w)),
        filled: true,
        fillColor: _colorScheme.surface,
=======
      items: times.map((t) => DropdownMenuItem(value: t, child: Text(t, style: TextStyle(fontSize: 12.sp)))).toList(),
      onChanged: (val) => setState(() => bookingTime = val),
      decoration: InputDecoration(
        labelText: "Select Time *",
        prefixIcon: Icon(Icons.access_time, size: 18.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
        labelStyle: TextStyle(fontSize: 12.sp),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
      ),
    );
  }

  void _applyCoupon(double total) {
    final enteredCode = couponController.text.trim().toUpperCase();
    final coupons = {"KITCHEN25": 0.25, "CLEAN20": 0.20, "WELCOME30": 0.30};

    if (enteredCode.isEmpty) {
      _showError("Please enter a coupon code");
      return;
    }

    if (coupons.containsKey(enteredCode)) {
      setState(() {
        appliedCoupon = enteredCode;
        discount = total * coupons[enteredCode]!;
      });
<<<<<<< HEAD
      Get.snackbar(
        "Success",
        "Coupon applied! Saved ₹${discount.toStringAsFixed(0)}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: _colorScheme.secondary.withOpacity(0.1),
        colorText: _colorScheme.secondary,
        duration: Duration(seconds: 3),
      );
=======
      Get.snackbar("Success", "Coupon applied! Saved ₹${discount.toStringAsFixed(0)}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green.shade100);
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    } else {
      setState(() {
        appliedCoupon = "";
        discount = 0.0;
      });
      _showError("Invalid coupon code");
    }
  }

<<<<<<< HEAD
  // ✅ UPDATED: Robust 400 error handling for duplicate booking
  void _placeOrder(double payable) async {
=======
  void _placeOrder(double total) async {
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    if (_isProcessing) return;

    if (!_validateForm()) return;

<<<<<<< HEAD
    final address = addressController.text.trim();
    if (address.length < 10) {
      _showError("Address must be at least 10 characters long.");
      return;
    }

    if (selectedCityName == null || selectedCityName!.isEmpty) {
      _showError("Please select a city.");
      return;
    }

    try {
      setState(() => _isProcessing = true);

      final timeOnly = bookingTime!.split(' ')[0];
      final formattedDate = DateFormat('yyyy-MM-dd').format(bookingDate!);

      final items = widget.billingData["items"] as List<dynamic>;
      final List<Map<String, dynamic>> apiItems = [];
      for (var item in items) {
=======
    try {
      setState(() => _isProcessing = true);
      Get.dialog(Center(child: CircularProgressIndicator(strokeWidth: 3)), barrierDismissible: false);

      final timeOnly = bookingTime!.split(' ')[0];
      final formattedDate = DateFormat('yyyy-MM-dd').format(bookingDate!);
      final items = widget.billingData["items"] as List<dynamic>;
      final List<Map<String, dynamic>> apiItems = [];

      for (var item in items) {
        if (item['id'] == null) {
          Get.back();
          _showError("Product ID missing");
          setState(() => _isProcessing = false);
          return;
        }
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        apiItems.add({
          "product_id": item['id'],
          "qty": item['quantity'],
          "price": item['price'],
        });
      }

<<<<<<< HEAD
      final response = userCtrl.isLoggedIn.value && userCtrl.token.value.isNotEmpty
          ? await ApiService.placeOrder(
        token: userCtrl.token.value,
=======
      final response = await ApiService.placeGuestOrder(
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        mobile: phoneController.text.trim(),
<<<<<<< HEAD
        address: address,
        apartment: apartmentController.text.trim(),
        state: stateController.text.trim(),
        cityId: selectedCityId!,
        cityName: selectedCityName!,
        zip: pinController.text.trim(),
        bookingDate: formattedDate,
        bookingTime: timeOnly,
        paymentMethod: paymentMethod,
        items: apiItems,
      )
          : await ApiService.placeGuestOrder(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        mobile: phoneController.text.trim(),
        address: address,
        apartment: apartmentController.text.trim(),
        state: stateController.text.trim(),
        cityId: selectedCityId!,
        cityName: selectedCityName!,
        zip: pinController.text.trim(),
        bookingDate: formattedDate,
        bookingTime: timeOnly,
=======
        address: stateController.text.trim(),
        apartment: secondaryAddressController.text.trim().isNotEmpty ? secondaryAddressController.text.trim() : null,
        state: stateController.text.trim(),
        cityId: selectedCityId!,
        zip: pinController.text.trim(),
        notes: "Booked via mobile app",
        countryId: 1,
        bookingDate: formattedDate,
        bookingTime: timeOnly,
        bookingType: "standard",
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        paymentMethod: paymentMethod,
        items: apiItems,
      );

<<<<<<< HEAD
      final String responseText = response.toString().toLowerCase();
      if (responseText.contains('400') ||
          responseText.contains('already booked') ||
          responseText.contains('already exists') ||
          responseText.contains('duplicate') ||
          responseText.contains('not available')) {
        Get.snackbar(
          "Date Unavailable",
          "The selected date is already booked.\nPlease choose another date.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: _colorScheme.error.withOpacity(0.1),
          colorText: _colorScheme.error,
          duration: Duration(seconds: 5),
          margin: EdgeInsets.all(16),
          borderRadius: 12,
          icon: Icon(Icons.date_range, color: _colorScheme.error),
        );
        return;
      }

      if (response['success'] != true) {
        _showError(response['message'] ?? 'Failed to place order');
        return;
      }

      final orderId = response['data']?['order_id'] ?? 'N/A';

      await cartCtrl.clearCart();
      if (userCtrl.isLoggedIn.value) {
        await bookingCtrl.fetchBookings();
      }

      await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SuccessAnimationScreen(orderId: orderId.toString())),
      );

      _showSuccessDialog(orderId.toString());

    } catch (e) {
      String errorMsg = e.toString().replaceAll('Exception: ', '');
      print("❌ Error: $errorMsg");

      if (errorMsg.toLowerCase().contains('400') ||
          errorMsg.toLowerCase().contains('already booked') ||
          errorMsg.toLowerCase().contains('duplicate')) {
        Get.snackbar(
          "Date Unavailable",
          "The selected date is already booked.\nPlease choose another date.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: _colorScheme.error.withOpacity(0.1),
          colorText: _colorScheme.error,
          duration: Duration(seconds: 5),
          margin: EdgeInsets.all(16),
          borderRadius: 12,
          icon: Icon(Icons.date_range, color: _colorScheme.error),
        );
        return;
      }

=======
      Get.back();

      final orderId = response['data']['order_id'] ?? 'N/A';
      Get.find<CartController>().clearCart();
      await Get.find<BookingController>().fetchBookings();

      _showSuccessDialog(orderId);
    } catch (e) {
      Get.back();
      String errorMsg = e.toString().replaceAll('Exception: ', '');
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
      _showError(errorMsg);
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  bool _validateForm() {
    if (bookingDate == null) return _showErrorBool("Select booking date");
    if (bookingTime == null) return _showErrorBool("Select booking time");
    if (firstNameController.text.trim().isEmpty) return _showErrorBool("Enter first name");
    if (lastNameController.text.trim().isEmpty) return _showErrorBool("Enter last name");
    if (emailController.text.trim().isEmpty) return _showErrorBool("Enter email");
    if (phoneController.text.trim().isEmpty) return _showErrorBool("Enter phone");
<<<<<<< HEAD
    if (addressController.text.trim().isEmpty) return _showErrorBool("Enter address");
    if (stateController.text.trim().isEmpty) return _showErrorBool("Enter state");
    if (pinController.text.trim().isEmpty) return _showErrorBool("Enter pin");
    if (selectedCityId == null) return _showErrorBool("Select city");
=======
    if (stateController.text.trim().isEmpty) return _showErrorBool("Enter state");
    if (pinController.text.trim().isEmpty) return _showErrorBool("Enter pin");
    if (selectedCityId == null) return _showErrorBool("Select city");
    if (selectedArea == null) return _showErrorBool("Select area");
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38

    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(emailController.text.trim())) {
      return _showErrorBool("Invalid email");
    }

    if (!RegExp(r'^[0-9]{10}$').hasMatch(phoneController.text.trim())) {
      return _showErrorBool("Phone must be 10 digits");
    }

    if (pinController.text.trim().length != 6) {
      return _showErrorBool("Pin must be 6 digits");
    }

    return true;
  }

  bool _showErrorBool(String msg) {
    _showError(msg);
    return false;
  }

  void _showError(String message) {
<<<<<<< HEAD
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: _colorScheme.error.withOpacity(0.1),
      colorText: _colorScheme.error,
      duration: Duration(seconds: 3),
    );
=======
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red[900],
        duration: Duration(seconds: 3));
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
  }

  void _showSuccessDialog(String orderId) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Center(
        child: Container(
          decoration: BoxDecoration(
<<<<<<< HEAD
            color: _colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8)],
          ),
          padding: EdgeInsets.all(24),
=======
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.w),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8.sp)],
          ),
          padding: EdgeInsets.all(6.w),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
<<<<<<< HEAD
                decoration: BoxDecoration(color: _colorScheme.primary, shape: BoxShape.circle),
                padding: EdgeInsets.all(12),
                child: Icon(Icons.check, color: _colorScheme.onPrimary, size: 30),
              ),
              SizedBox(height: 16),
              // ✅ FIXED: No yellow highlight using RichText
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _colorScheme.primary),
                  children: [
                    TextSpan(text: "Order Placed Successfully! ✅"),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text("Order ID: $orderId", style: TextStyle(fontSize: 14, color: _colorScheme.onSurface.withOpacity(0.7))),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Get.off(() => HomePage()),
                style: ElevatedButton.styleFrom(backgroundColor: _colorScheme.primary),
                child: Text("Go to Home", style: TextStyle(color: _colorScheme.onPrimary)),
              )
=======
                decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                padding: EdgeInsets.all(3.w),
                child: Icon(Icons.check, color: Colors.white, size: 30.sp),
              ),
              SizedBox(height: 2.h),
              Text("Order Placed Successfully! ✅",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.green[700]),
              ),
              SizedBox(height: 1.h),
              Text("Order ID: $orderId", style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            ],
          ),
        ),
      ),
    );
<<<<<<< HEAD
=======

    Future.delayed(Duration(seconds: 3), () {
      if (context.mounted) Navigator.of(context).pop();
      Get.find<HomePageController>().changeTab(2);
    });
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
  }
}