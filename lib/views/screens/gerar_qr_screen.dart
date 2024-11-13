// import 'package:flutter/material.dart';
// import 'package:onisapp/controllers/qr_code_controller.dart';
// import '../../models/item_cardapio.dart';

// class GerarQRScreen extends StatelessWidget {
//   final QRCodeController _qrController = QRCodeController();
//   final List<ItemCardapio> pedido;

//   GerarQRScreen({required this.pedido, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Gera os dados para o QR Code a partir do pedido atual
//     final qrData = _qrController.generateQRCodeData(
//       {"pedido": pedido.map((item) => item.nome).toList()},
//     );

//     return Scaffold(
//       appBar: AppBar(title: Text("Gerar QR Code")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'QR Code do Pedido',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             // Mostra o QR Code gerado
//             _qrController.generateQRCodeWidget(qrData),
//           ],
//         ),
//       ),
//     );
//   }
// }
