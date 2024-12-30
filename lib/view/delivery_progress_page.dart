import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_app/auth/database/firestore.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/components/my_reciept.dart';
import 'package:food_app/providers/restaurant.dart';
import 'package:food_app/utils/utils.dart';
import 'package:food_app/view/home.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
// import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();
    String reciept = context.read<RestaurantProvider>().displayCartReciept();
    db.saveOrdertoDatabase(
      context,
      reciept,
    );
  }

  // Function to generate and save PDF
  Future<void> _savePdf() async {
    final pdf = pw.Document(); // Create a PDF document

    // Fetch receipt details (example - replace with your own)
    String receiptContent =
        context.read<RestaurantProvider>().displayCartReciept();

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Receipt',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              pw.Text(receiptContent), // Add receipt details
            ],
          );
        },
      ),
    );

    // Get the device's directory to save the PDF
    final output = await getExternalStorageDirectory();
    final file = File("${output!.path}/receipt.pdf");

    // Save the PDF to the device
    await file.writeAsBytes(await pdf.save());
    print("PDF saved to ${file.path}");

    // Optionally, show a confirmation or alert to the user
    Utils.showBar(context, message: 'Receipt saved to ${file.path}');
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: HomePage(),
                    );
                  },
                  transitionDuration: Duration(seconds: 1),
                  reverseTransitionDuration: Duration(seconds: 1),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            icon: Icon(Icons.close_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          MyReciept(),
          MyButton(
            ontap: _savePdf, // Call the save PDF function
            text: 'Save Receipt as PDF',
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.person),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mohsin Khan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text(
                  "Driver",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.call,
                      color: const Color.fromARGB(255, 18, 73, 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
