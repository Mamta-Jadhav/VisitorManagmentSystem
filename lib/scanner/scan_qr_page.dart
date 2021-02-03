import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vms/common/common.dart';
import 'package:vms/scanner/scan_hostname.dart';
import 'package:vms/scanner/scan_detail_show.dart';

const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';
// const frontCamera = 'FRONT CAMERA';
const backCamera = 'BACK CAMERA';

class QRPage extends StatefulWidget {
  const QRPage({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  var qrText = '';
  var flashState = flashOn;

  // var cameraState = frontCamera;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          _buildQrView(context),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              'Place the QR in the square to start the scan',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  bool _isFlashOn(String current) {
    return flashOn == current;
  }

  bool _isBackCamera(String current) {
    return backCamera == current;
  }

  Widget _buildQrView(BuildContext context) {
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Stack(
      children: [
        NotificationListener<SizeChangedLayoutNotification>(
            onNotification: (notification) {
              Future.microtask(() => controller?.updateDimensions(qrKey));
              return false;
            },
            child: SizeChangedLayoutNotifier(
                key: const Key('qr-size-notifier'),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300,
                  ),
                ))),
        Positioned(
          right: 50,
          top: 50,
          child: GestureDetector(
              onTap: () {
                if (controller != null) {
                  controller.toggleFlash();
                  if (_isFlashOn(flashState)) {
                    setState(() {
                      flashState = flashOff;
                    });
                  } else {
                    setState(() {
                      flashState = flashOn;
                    });
                  }
                }
              },
              child: Icon(
                _isFlashOn(flashState) ? Icons.flash_on : Icons.flash_off,
                color: Colors.white,
                size: 30,
              )),
        ),
      ],
    );
  }

  int tryOne = 0;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // RaisedButton( child: Text("Beep Success"), onPressed: ()=> FlutterBeep.beep()),
      // RaisedButton( child: Text("Beep Fail"), onPressed: ()=> FlutterBeep.beep(false)),
      // RaisedButton( child: Text("Beep Android Custom"), onPressed: ()=> FlutterBeep.playSysSound(AndroidSoundIDs.TONE_CDMA_ABBR_ALERT)),
      // RaisedButton( child: Text("Beep somthing"), onPressed: ()=> FlutterBeep.playSysSound(41)),
      // RaisedButton( child: Text("Beep iOS Custom"), onPressed: ()=> FlutterBeep.playSysSound(iOSSoundIDs.AudioToneBusy)),
      if (tryOne == 0) {
        setState(() {
          tryOne = 1;
          qrText = scanData;
          FlutterBeep.beep();
          goToPageWithReplace(context, ScanDetailsShow(qrText));
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
