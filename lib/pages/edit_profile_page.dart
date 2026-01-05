import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controller/profile_controller.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart'; // For FilteringTextInputFormatter
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  final _formKey = GlobalKey<FormState>();
  bool hasChanges = false;

  final ProfileController profileCtrl = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();

<<<<<<< HEAD
=======
    // Initialize from ProfileController
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    nameController = TextEditingController(text: profileCtrl.name.value);
    emailController = TextEditingController(text: profileCtrl.email.value);
    phoneController = TextEditingController(text: profileCtrl.phone.value);

<<<<<<< HEAD
=======
    // Listen for changes
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    nameController.addListener(_checkChanges);
    emailController.addListener(_checkChanges);
    phoneController.addListener(_checkChanges);
  }

  void _checkChanges() {
    setState(() {
      hasChanges = nameController.text.trim() != profileCtrl.name.value.trim() ||
          emailController.text.trim() != profileCtrl.email.value.trim() ||
          phoneController.text.trim() != profileCtrl.phone.value.trim();
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    if (!hasChanges) {
      Get.snackbar(
        "No Changes",
        "No changes were made to save",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange.shade100,
        colorText: Colors.orange.shade900,
      );
      return;
    }

    final success = await profileCtrl.updateProfile(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
    );

    if (success) {
<<<<<<< HEAD
=======
      // Return to previous page with success indicator
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
      Get.back(result: true);
    }
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
=======
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
<<<<<<< HEAD
            color: colorScheme.onSurface,
=======
            color: Colors.black,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          children: [
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  Obx(() {
                    final displayName = nameController.text.isNotEmpty
                        ? nameController.text
                        : profileCtrl.name.value;
                    return CircleAvatar(
                      radius: 50,
<<<<<<< HEAD
                      backgroundColor: colorScheme.primary,
=======
                      backgroundColor: Colors.blue,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                      child: Text(
                        displayName.isNotEmpty
                            ? displayName[0].toUpperCase()
                            : 'G',
<<<<<<< HEAD
                        style: TextStyle(
                          fontSize: 40,
                          color: colorScheme.onPrimary,
=======
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1.w),
                      decoration: BoxDecoration(
<<<<<<< HEAD
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: colorScheme.surface, width: 2),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: colorScheme.onPrimary,
=======
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            Center(
              child: Text(
                "Tap to change photo",
                style: TextStyle(
                  fontSize: 11.sp,
<<<<<<< HEAD
                  color: colorScheme.onSurface.withOpacity(0.6),
=======
                  color: Colors.grey,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                ),
              ),
            ),
            SizedBox(height: 3.h),

            // Personal Info Section
<<<<<<< HEAD
            _buildSectionTitle("Personal Information", colorScheme),
=======
            _buildSectionTitle("Personal Information"),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            SizedBox(height: 1.h),

            _buildTextField(
              controller: nameController,
              label: "Full Name",
              hint: "Enter your full name",
              icon: Icons.person,
<<<<<<< HEAD
              colorScheme: colorScheme,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')),
              ],
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Name is required";
                }
<<<<<<< HEAD
                final trimmed = value.trim();
                if (trimmed.length < 3) {
                  return "Name must be at least 3 characters";
                }
                if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmed)) {
                  return "Name can only contain letters and spaces";
                }
=======
                if (value.trim().length < 3) {
                  return "Name must be at least 3 characters";
                }
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                return null;
              },
            ),
            SizedBox(height: 2.h),

            _buildTextField(
              controller: emailController,
              label: "Email Address",
              hint: "Enter your email",
              icon: Icons.email,
<<<<<<< HEAD
              colorScheme: colorScheme,
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Email is required";
                }
                if (!GetUtils.isEmail(value.trim())) {
                  return "Enter a valid email";
                }
                return null;
              },
            ),
            SizedBox(height: 2.h),

            _buildTextField(
              controller: phoneController,
              label: "Phone Number",
<<<<<<< HEAD
              hint: "Enter your 10-digit mobile number",
              icon: Icons.phone,
              colorScheme: colorScheme,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
=======
              hint: "Enter your phone number",
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Phone number is required";
                }
<<<<<<< HEAD
                final trimmed = value.trim();
                if (trimmed.length != 10) {
                  return "Phone number must be 10 digits";
                }
                if (!RegExp(r'^[6-9]\d{9}$').hasMatch(trimmed)) {
                  return "Phone number must start with 6, 7, 8, or 9";
=======
                if (value.trim().length < 10) {
                  return "Enter a valid 10+ digit phone number";
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                }
                return null;
              },
            ),
            SizedBox(height: 4.h),

            // Save Button
            Obx(() {
              return ElevatedButton(
                onPressed: profileCtrl.isLoading.value || !hasChanges
                    ? null
                    : _saveProfile,
                style: ElevatedButton.styleFrom(
<<<<<<< HEAD
                  backgroundColor: hasChanges ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.1),
=======
                  backgroundColor: hasChanges ? Colors.blue : Colors.grey,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  padding: EdgeInsets.symmetric(vertical: 1.8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: profileCtrl.isLoading.value
<<<<<<< HEAD
                    ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: colorScheme.onPrimary,
=======
                    ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                    strokeWidth: 2.5,
                  ),
                )
                    : Text(
                  "Save Changes",
                  style: TextStyle(
<<<<<<< HEAD
                    color: colorScheme.onPrimary,
=======
                    color: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }),
            SizedBox(height: 2.h),

            // Cancel Button
            OutlinedButton(
              onPressed: () => Get.back(),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 1.8.h),
<<<<<<< HEAD
                side: BorderSide(color: colorScheme.outline),
=======
                side: BorderSide(color: Colors.grey.shade300),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Cancel",
                style: TextStyle(
<<<<<<< HEAD
                  color: colorScheme.onSurface,
=======
                  color: Colors.grey.shade700,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildSectionTitle(String title, ColorScheme colorScheme) {
=======
  Widget _buildSectionTitle(String title) {
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    return Text(
      title,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
<<<<<<< HEAD
        color: colorScheme.onSurface,
=======
        color: Colors.black87,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
<<<<<<< HEAD
    required ColorScheme colorScheme,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
=======
    TextInputType? keyboardType,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
<<<<<<< HEAD
        color: colorScheme.surface,
=======
        color: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
<<<<<<< HEAD
        inputFormatters: inputFormatters,
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
<<<<<<< HEAD
          prefixIcon: Icon(icon, color: colorScheme.primary, size: 22),
=======
          prefixIcon: Icon(icon, color: Colors.blue, size: 22),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
<<<<<<< HEAD
          fillColor: colorScheme.surface,
=======
          fillColor: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          contentPadding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 1.8.h,
          ),
          labelStyle: TextStyle(
            fontSize: 12.sp,
<<<<<<< HEAD
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
          hintStyle: TextStyle(
            fontSize: 11.sp,
            color: colorScheme.onSurface.withOpacity(0.5),
=======
            color: Colors.grey.shade600,
          ),
          hintStyle: TextStyle(
            fontSize: 11.sp,
            color: Colors.grey.shade400,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          ),
        ),
        style: TextStyle(
          fontSize: 12.sp,
<<<<<<< HEAD
          color: colorScheme.onSurface,
=======
          color: Colors.black87,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        ),
      ),
    );
  }
}