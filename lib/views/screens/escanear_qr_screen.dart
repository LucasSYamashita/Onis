// views/screens/escanear_qr_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class EscanearQRScreen extends StatefulWidget {
  @override
  _EscanearQRScreenState createState() => _EscanearQRScreenState();
}

class _EscanearQRScreenState extends State<EscanearQRScreen> {
  String _qrCodeResult = "Nenhum código escaneado";

  Future<void> _scanQRCode() async {
    try {
      final qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // Cor do botão "Cancelar"
        "Cancelar", // Texto do botão cancelar
        true, // Exibir a linha de scan
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        _qrCodeResult = qrCodeResult == "-1" ? "Escaneamento cancelado" : qrCodeResult;
      });
    } catch (e) {
      setState(() {
        _qrCodeResult = "Erro ao escanear o código: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Escanear QR Code")),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Resultado: $_qrCodeResult',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _scanQRCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.withOpacity(0.8),
                ),
                child: const Text("Escanear QR Code"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
