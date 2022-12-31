import 'dart:io';
import 'package:flutter/material.dart';

import 'upload_page.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (Platform.isAndroid || Platform.isIOS) {
//     runApp(const Lessor());
//   } else {
//     exit(0);
//   }
// }

class Lessee extends StatelessWidget {
  const Lessee({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Whatsapp',
      debugShowCheckedModeBanner: !true,
      home: UploadPage(),
    );
  }
}
