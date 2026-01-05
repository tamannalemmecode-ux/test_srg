import 'package:flutter/material.dart';
import '../api/api_contact.dart';
import '../models/contact_model.dart';

class HistoryPage extends StatefulWidget {
  final String email;
  const HistoryPage({super.key, required this.email});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Future<List<ContactHistory>> _futureHistory;

  @override
  void initState() {
    super.initState();
    _futureHistory = ApiContact.getHistory(widget.email) as Future<List<ContactHistory>>;
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Enquiry History"),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
=======
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enquiry History"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        elevation: 0,
      ),
      body: FutureBuilder<List<ContactHistory>>(
        future: _futureHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
<<<<<<< HEAD
            return Center(child: CircularProgressIndicator(color: colorScheme.primary));
=======
            return const Center(child: CircularProgressIndicator());
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
          }

          if (snapshot.hasError) {
            return Center(
<<<<<<< HEAD
              child: Text(
                "Error: ${snapshot.error}",
                style: TextStyle(color: colorScheme.error),
              ),
=======
              child: Text("Error: ${snapshot.error}"),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
<<<<<<< HEAD
            return Center(
              child: Text(
                "No history found",
                style: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
              ),
=======
            return const Center(
              child: Text("No history found"),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            );
          }

          final historyList = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: historyList.length,
            itemBuilder: (context, index) {
              final item = historyList[index];
              return Card(
<<<<<<< HEAD
                color: colorScheme.surface,
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
<<<<<<< HEAD
                      Text(
                        "Name: ${item.firstName ?? '-'}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text("Email: ${item.email ?? '-'}", style: TextStyle(color: colorScheme.onSurface.withOpacity(0.9))),
                      Text("Mobile: ${item.mobile ?? '-'}", style: TextStyle(color: colorScheme.onSurface.withOpacity(0.9))),
                      Text("Service: ${item.service ?? '-'}", style: TextStyle(color: colorScheme.onSurface.withOpacity(0.9))),
                      Text("City: ${item.city ?? '-'}", style: TextStyle(color: colorScheme.onSurface.withOpacity(0.9))),
                      Text("State: ${item.state ?? '-'}", style: TextStyle(color: colorScheme.onSurface.withOpacity(0.9))),
                      Text("Area: ${item.area ?? '-'}", style: TextStyle(color: colorScheme.onSurface.withOpacity(0.9))),
                      Text("Date: ${item.date ?? '-'}", style: TextStyle(color: colorScheme.onSurface.withOpacity(0.9))),
                      Text("Time: ${item.time ?? '-'}", style: TextStyle(color: colorScheme.onSurface.withOpacity(0.9))),
                      Text(
                        "Inspection: ${item.orderInspection == '1' ? "Yes" : "No"}",
                        style: TextStyle(color: colorScheme.onSurface.withOpacity(0.9)),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Message: ${item.message ?? '-'}",
                        style: TextStyle(color: colorScheme.onSurface.withOpacity(0.9)),
                      ),
=======
                      Text("Name: ${item.firstName ?? '-'}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text("Email: ${item.email ?? '-'}"),
                      Text("Mobile: ${item.mobile ?? '-'}"),
                      Text("Service: ${item.service ?? '-'}"),
                      Text("City: ${item.city ?? '-'}"),
                      Text("State: ${item.state ?? '-'}"),
                      Text("Area: ${item.area ?? '-'}"),
                      Text("Date: ${item.date ?? '-'}"),
                      Text("Time: ${item.time ?? '-'}"),
                      Text("Inspection: ${item.orderInspection == '1' ? "Yes" : "No"}"),
                      const SizedBox(height: 6),
                      Text("Message: ${item.message ?? '-'}"),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
