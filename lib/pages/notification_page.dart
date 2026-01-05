import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_suvarnraj_group/controller/notification_controller.dart';
import 'package:new_suvarnraj_group/controller/home_page_controller.dart';
import 'package:new_suvarnraj_group/models/notification_model.dart';
import 'package:new_suvarnraj_group/pages/home_page.dart';

class NotificationsPage extends StatelessWidget {
  final NotificationController controller = Get.find();

  NotificationsPage({super.key});

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final diff = now.difference(timestamp);

    if (diff.inMinutes < 1) return "Just now";
    if (diff.inMinutes < 60) return "${diff.inMinutes} min ago";
    if (diff.inHours < 24) return "${diff.inHours} hr ago";
    return DateFormat("dd MMM, hh:mm a").format(timestamp);
  }

  IconData _getIconForNotif(AppNotification notif) {
    if (notif.payload != null && notif.payload!.startsWith("booking:")) {
      return Icons.event_note;
    }
    return Icons.notifications;
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(color: colorScheme.onSurface),
        ),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever, color: colorScheme.error),
=======
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            tooltip: "Clear all",
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
<<<<<<< HEAD
                  backgroundColor: colorScheme.surface,
                  title: Text(
                    "Clear all notifications?",
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                  content: Text(
                    "This action cannot be undone.",
                    style: TextStyle(color: colorScheme.onSurface.withOpacity(0.7)),
                  ),
                  actions: [
                    TextButton(
                      child: Text("Cancel", style: TextStyle(color: colorScheme.onSurface)),
                      onPressed: () => Navigator.pop(context, false),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: colorScheme.error),
                      child: Text("Clear All", style: TextStyle(color: colorScheme.onError)),
=======
                  title: const Text("Clear all notifications?"),
                  content: const Text("This action cannot be undone."),
                  actions: [
                    TextButton(
                      child: const Text("Cancel"),
                      onPressed: () => Navigator.pop(context, false),
                    ),
                    ElevatedButton(
                      child: const Text("Clear All"),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                      onPressed: () => Navigator.pop(context, true),
                    ),
                  ],
                ),
              );
              if (confirm == true) controller.clearAll();
            },
          )
        ],
      ),
      body: Obx(() {
        if (controller.notifications.isEmpty) {
<<<<<<< HEAD
          return Center(
            child: Text(
              "No notifications yet 🙂",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface.withOpacity(0.6),
              ),
=======
          return const Center(
            child: Text(
              "No notifications yet 🙂",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final notif = controller.notifications[index];
            return Dismissible(
              key: ValueKey(notif.id),
              direction: DismissDirection.endToStart,
              background: Container(
<<<<<<< HEAD
                color: colorScheme.error,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete, color: colorScheme.onError),
              ),
              onDismissed: (_) => controller.removeNotification(notif.id),
              child: Card(
                color: colorScheme.surface,
=======
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (_) => controller.removeNotification(notif.id),
              child: Card(
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
<<<<<<< HEAD
                    backgroundColor: colorScheme.primary.withOpacity(0.1),
                    child: Icon(_getIconForNotif(notif), color: colorScheme.primary),
                  ),
                  title: Text(
                    notif.title,
                    style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.onSurface),
=======
                    backgroundColor: Colors.blue.shade100,
                    child: Icon(_getIconForNotif(notif), color: Colors.blue),
                  ),
                  title: Text(
                    notif.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
<<<<<<< HEAD
                      Text(notif.body, style: TextStyle(color: colorScheme.onSurface.withOpacity(0.9))),
                      const SizedBox(height: 4),
                      Text(
                        _formatTime(notif.timestamp),
                        style: TextStyle(fontSize: 12, color: colorScheme.onSurface.withOpacity(0.6)),
=======
                      Text(notif.body),
                      const SizedBox(height: 4),
                      Text(
                        _formatTime(notif.timestamp),
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  onTap: () {
                    if (notif.payload != null && notif.payload!.startsWith("booking:")) {
                      final bookingId = notif.payload!.split(":").last;

                      Get.snackbar(
                        "Notification tapped",
                        "Opening booking $bookingId",
                        snackPosition: SnackPosition.BOTTOM,
<<<<<<< HEAD
                        backgroundColor: colorScheme.primary.withOpacity(0.1),
                        colorText: colorScheme.primary,
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                      );

                      try {
                        final homeCtrl = Get.find<HomePageController>();
                        homeCtrl.changeTab(HomePageTabs.bookings);

                        Future.delayed(const Duration(milliseconds: 300), () {
                          if (kIsWeb) {
                            Get.toNamed('/booking-details?id=$bookingId');
                          } else {
                            Get.toNamed('/booking-details', arguments: {"id": bookingId});
                          }
                        });
                      } catch (_) {
                        debugPrint("HomePageController not found.");
                      }
                    }
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
