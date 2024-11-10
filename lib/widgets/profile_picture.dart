import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  // Menampilkan gambar profil pengguna.
  final String imageUrl; // URL gambar profil pengguna.

  const ProfilePicture({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: CircleAvatar(
        // Menampilkan gambar profil pengguna.
        backgroundImage: NetworkImage(imageUrl),
        // Mengatur ukuran gambar profil.
        radius: 45,
      ),
    );
  }
}
