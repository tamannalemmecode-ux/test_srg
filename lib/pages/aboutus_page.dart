<<<<<<< HEAD
// lib/pages/about_us_page.dart
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
=======
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: Colors.blue,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
<<<<<<< HEAD
            // 🔹 Header Section
            Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
=======

            // 🔹 Header Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 2))
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
<<<<<<< HEAD
                children: [
                  Text(
                    "Suvarnraj Group Cleaning Services",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
                  ),
                  const SizedBox(height: 10),
=======
                children: const [
                  Text("Suvarnraj Group Cleaning Services",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  Text(
                    "Founded in 2010, Premium Cleaning Services has established itself "
                        "as the leading provider of professional cleaning solutions for homes and businesses. "
                        "With our team of highly trained professionals and state-of-the-art equipment, "
                        "we deliver spotless results that exceed expectations.",
<<<<<<< HEAD
                    style: TextStyle(color: colorScheme.onSurface.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 10),
=======
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(height: 10),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  Text(
                    "Our comprehensive range of services includes Furnished & Unfurnished Home Cleaning, "
                        "Commercial cleaning, Deep cleaning, Bathroom cleaning, Office cleaning, "
                        "and specialized services tailored to your specific needs.",
<<<<<<< HEAD
                    style: TextStyle(color: colorScheme.onSurface.withOpacity(0.8)),
=======
                    style: TextStyle(color: Colors.black87),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Mission & Vision
<<<<<<< HEAD
            Text(
              "Our Mission & Vision",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
            ),
=======
            const Text("Our Mission & Vision",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38

            const SizedBox(height: 12),

            _infoCard(
              title: "Our Mission",
              description:
              "To provide exceptional cleaning services that enhance the quality of life for our clients by creating cleaner, healthier, and more comfortable environments while maintaining the highest standards of professionalism and reliability.\n\n"
                  "Our goal is to build lasting relationships grounded in trust, excellence, and satisfaction.",
<<<<<<< HEAD
              colorScheme: colorScheme,
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            ),
            const SizedBox(height: 12),
            _infoCard(
              title: "Our Vision",
              description:
              "We have been in this business since 2005, serving clients for more than a decade. "
                  "We understand your hectic schedule and ensure that you feel relaxed when your environment stays clean and healthy.\n\n"
                  "All we can say is: 'Hold my broom, and see me eradicate your discomfort.'",
<<<<<<< HEAD
              colorScheme: colorScheme,
=======
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
            ),

            const SizedBox(height: 20),

            // 🔹 Why Choose Us
<<<<<<< HEAD
            Text(
              "Why Choose Us?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
            ),
            const SizedBox(height: 12),

            _bulletPoint("Trained Professionals", "Verified and experienced cleaning experts", colorScheme: colorScheme),
            _bulletPoint("Punctual Service", "Always on time, every time", colorScheme: colorScheme),
            _bulletPoint("Quality Guaranteed", "100% satisfaction or money back", colorScheme: colorScheme),
            _bulletPoint("Eco-Friendly Products", "Safe for your family and environment", colorScheme: colorScheme),
=======
            const Text("Why Choose Us?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            _bulletPoint("Trained Professionals",
                "Verified and experienced cleaning experts"),
            _bulletPoint("Punctual Service", "Always on time, every time"),
            _bulletPoint("Quality Guaranteed",
                "100% satisfaction or money back"),
            _bulletPoint("Eco-Friendly Products",
                "Safe for your family and environment"),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38

            const SizedBox(height: 20),

            // 🔹 Call to Action
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
<<<<<<< HEAD
                gradient: LinearGradient(
                  colors: [colorScheme.error, colorScheme.error.withOpacity(0.8)],
                ),
=======
                gradient: const LinearGradient(
                    colors: [Colors.redAccent, Colors.red]),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
<<<<<<< HEAD
                  Text(
                    "Ready to Get Started?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Contact us today for a free consultation and quote",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70),
=======
                  const Text(
                    "Ready to Get Started?",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Contact us today for a free consultation and quote",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
<<<<<<< HEAD
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.call, color: colorScheme.error),
                        label: Text(
                          "Call Now",
                          style: TextStyle(color: colorScheme.error),
                        ),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.message, color: colorScheme.error),
                        label: Text(
                          "Message",
                          style: TextStyle(color: colorScheme.error),
                        ),
=======
                            backgroundColor: Colors.white),
                        onPressed: () {},
                        icon: const Icon(Icons.call, color: Colors.red),
                        label: const Text("Call Now",
                            style: TextStyle(color: Colors.red)),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {},
                        icon: const Icon(Icons.message, color: Colors.red),
                        label: const Text("Message",
                            style: TextStyle(color: Colors.red)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ✅ Helper Widget for Info Cards
<<<<<<< HEAD
  static Widget _infoCard({
    required String title,
    required String description,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: colorScheme.onSurface.withOpacity(0.8)),
          ),
=======
  static Widget _infoCard({required String title, required String description}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(color: Colors.black87)),
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
        ],
      ),
    );
  }

  // ✅ Helper Widget for Bullet Points
<<<<<<< HEAD
  static Widget _bulletPoint(
      String title,
      String subtitle, {
        required ColorScheme colorScheme,
      }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.check_circle, color: colorScheme.secondary),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, color: colorScheme.onSurface),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: colorScheme.onSurface.withOpacity(0.7)),
      ),
    );
  }
}
=======
  static Widget _bulletPoint(String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.check_circle, color: Colors.green),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.black54)),
    );
  }
}
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
