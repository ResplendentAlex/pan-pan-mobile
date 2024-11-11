import 'package:flutter/material.dart';
import 'package:pan_pan_mobile/widgets/left_drawer.dart';
import 'package:pan_pan_mobile/widgets/item_card.dart';
import 'package:pan_pan_mobile/widgets/text_card.dart';
import 'package:pan_pan_mobile/widgets/profile_picture.dart';

class MyHomePage extends StatelessWidget {
  final String name = 'Alexander William Lim'; // Nama

  MyHomePage({super.key});

  final List<ProductHomepage> products = [
    ProductHomepage("Lihat Daftar Produk", Icons.store),
    ProductHomepage("Tambah Produk", Icons.add),
    ProductHomepage("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "Mental Health Tracker" dengan teks putih dan tebal.
        title: const Text(
          'Pan-Pan Mobile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
      drawer: const LeftDrawer(),

      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Menampilkan foto profil pengguna.
            Row(
              children: [
                const Expanded(
                  // Menampilkan Profile Picture.
                  flex: 1,
                  child: ProfilePicture(
                      imageUrl:
                          "https://i.pinimg.com/originals/24/fc/95/24fc9501386692e88bd26bf68fe0e3cb.jpg"),
                ),
                // Column untuk menampilkan teks sambutan.
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      // Menampilkan Welcome Text dengan nama pengguna.
                      const Text(
                        'Welcome back,',
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                      TextCard(content: name),
                    ],
                  ),
                ),
              ],
            ),

            // Memberikan jarak vertikal 16 unit.
            const SizedBox(height: 16.0),

            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid product secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'What would you like to do today?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan productCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.only(top: 16.0),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan productCard untuk setiap product dalam list products.
                    children: products.map((ProductHomepage product) {
                      return ProductCard(product);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
