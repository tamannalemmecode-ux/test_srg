import 'package:flutter/material.dart';
import 'package:new_suvarnraj_group/pages/tabs/bookings_tab.dart';
import 'package:sizer/sizer.dart';

class MyBookingsPage extends StatelessWidget {
  const MyBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Bookings',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        centerTitle: true,
        elevation: 1,
      ),
      body: const BookingsTab(),
=======
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings', style: TextStyle(fontSize: 16.sp)),
        centerTitle: true,
      ),
      body: BookingsTab(),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    );
  }
}