import 'package:flutter/material.dart';
import 'package:pan_pan_mobile/screens/product_entry_form.dart';
import 'package:pan_pan_mobile/screens/list_productentry.dart';

class ProductHomepage {
  final String name;
  final IconData icon;

  ProductHomepage(this.name, this.icon);
}

class ProductCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ProductHomepage item;

  const ProductCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.name == "Lihat Daftar Produk"
          ? Colors.blue
          : item.name == "Tambah Produk"
              ? Colors.green
              : Colors.red,

      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigate ke route Tambah Produk
          if (item.name == "Tambah Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryFormPage(),
              ),
            );
          } else if (item.name == "Lihat Daftar Produk") {
            // Navigate ke route Lihat Daftar Produk
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryPage(),
              ),
            );
          }
        },

        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
