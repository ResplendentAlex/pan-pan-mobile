import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  // Kartu informasi yang menampilkan konten.
  final String content; // Isi kartu.

  const TextCard({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(
        // Mengatur ukuran dan jarak di dalam kartu.
        width: MediaQuery.of(context).size.width / 2, // menyesuaikan dengan lebar device yang digunakan.
        // Menyusun title dan content secara vertikal.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
