import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart'; // Import this package for clipboard functionality

class QRCodeScreen extends StatelessWidget {
  final String qrData;

  QRCodeScreen({required this.qrData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 400.0,
            ),
            SizedBox(height: 20),
            Text(
              'Code:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SelectableText(
              qrData,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: qrData));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Code copied to clipboard')),
                );
              },
              child: Text('Copy Code'),
            ),
          ],
        ),
      ),
    );
  }
}
