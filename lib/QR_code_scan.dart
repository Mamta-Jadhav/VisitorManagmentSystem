import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vms/verify_visitor_details.dart';

class QRCodeSCan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRCodeSCan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // BarcodeDetector result;
  QRViewController controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF073763),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Scan Visitor's QR ID"),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Container(
              alignment: Alignment.centerRight,
height: 300,
              width: 300,// To ensure the Scanner view is properly sizes after rotation
              // we need to listen for Flutter SizeChanged notification and update controller
              child: NotificationListener<SizeChangedLayoutNotification>(
                onNotification: (notification) {
                  Future.microtask(() => controller?.updateDimensions(qrKey));
                  return false;
                },
                child: SizeChangedLayoutNotifier(
                  key: const Key('qr-size-notifier'),
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
              ),
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Center(
          //     child:
          //     // (result != null) ?
          //     // Text('Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
          //     //     : Text('Scan a code'),
          //     Text('Scan a code'),
          //   ),
          // )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        print("tapped on Scan " + scanData);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyVisitorDetails()));
        dispose();
        // result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}