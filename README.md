# <p align="center"><img src="assets/logo/icon_horizontal.png" style="width: 350px; margin-bottom: -25px" alt="Pan Pan Little Shop"></p>

This is a mobiel application to do trading, specifically for art and crafts. It is made as project for one of my college modules, PBP (Programming Berbasis Platform).

<br>

# 📃 **LICENSE**<br>
This project is licensed under the MIT License - refer to the LICENSE file for more details.

<br>

# 📝 **ASSIGNMENT**<br>
**Name** : Alexander William Lim <br>
**NPM** : 2306207505 <br>
**Class** : PBP F

## **TUGAS 7**<br>
### *Stateless widget* dan *Stateful widget*
***Stateless Widget***
1. Definisi: Sebuah widget yag tidak memiliki state yang dapat berubah. Ini berarti setelah sebuah *stateless widget* dibuat, maka *widget* tersebut tidak akan berubah hidup selama siklus hidupnya.
2. Penggunaan: Digunakan ketika ingin membuat sebuah anatarmuka pengguna yang kita tahu tidak akan berubah setelah widget dibuat. Contoh: teks stattis, ikon, atau gambar.

***Stateful Widget***
1. Definisi: Sebuah widget yang memiliki state yang dapat berubah. Ini berarti bahwa widget ini dapat berubah baik itu karena interaksi pengguna ataupun perubahan data.
2. Penggunaan: Digunakan ketika ingin membuat sebuah antarmuka pengguna yang harus berubah secara dinamis. Contoh: form input, tombol yang dapat ditekan, ataupun animasi.

### *Widget* yang digunakan
Pada Tugas 7 ini, ada beberapa *widget* yang digunakan, baik itu yang dibuat sendiri, ataupun yang sudah tersedia oleh Flutter.

*widgets* yang dibuat adalah sebagai berikut:

| Nama | Fungsi / Kegunaan |
|------|-------------------|
| MyApp | Widget utama yang digunakan untuk menjalankan aplikasi.  |
| MyHomePage | Widget yang menampilkan home page atau halaman utama aplikasi. |
| ItemCard | Widget yang digunakan untuk menampilkan informasi tentang item tertentu dalam bentuk kartu. | 
| InfoCard | Widget yang digunakan untuk menampilkan informasi tambahan atau deatil tertentu dalam bentuk kartu. |

*widgets* yang disediakan oleh Flutter adalah sebagai berikut:
| Nama | Fungsi / Kegunaan |
|------|-------------------|
| MaterialApp | Widget utama yang mengatur konfigurasi dasar aplikasi seperti tema, rute, dan pengaturan global lainnya. |
| Material | Widget yang menyediakan efek visual.  |
| InkWell | Widget yang memberikan efek gelombang (ripple) saat pengguna menekan elemen yang memilikinya.  | 
| ScaffoldMessenger | Widget yang mengelola dan menampilkan SnackBar dalam aplikasi. |
| SnackBar | Widget yang menampilkan pesan sementara di bagian bawah layar. |
| Text | Widget yang menampilkan teks dengan gaya tertentu. |
| Container | Widget serbaguna yang dapat digunakan untuk mengatur tat letak, dekorasi, dan ukuran widget anaknya. |
| Center | Widget yang memposisikan widget anaknya di tengah layar. |
| Column | Widget yang menyusun widget anaknya secara vertikal. |
| Icon | Widget yang menampilkan ikon dari koleksi ikon Material Design. |
| Padding | Widget yang menambahkan ruang di sekitar widget lainnya. |
| Scaffold | Widget yang menyediakan struktur dasar halaman dengan AppBar, Drawer, dan body. |
| AppBar | Widget yang menampilkan bilah aplikasi di bagian atas layar. |
| Row | widget yang menyusung widget anaknya secara horizontal. | 
| SizedBox | Widget yang memberikan ukuran tetap atau ruang kosong di anatar widget. |
| GridView | Widget yang menampilkan widget anaknya dalam tata letak grid. |

### Fungsi `setState()`
Sebuah metode yang digunakan dalam `StatefulWidget` untuk memberi tahu Flutter bahwa ada perbubahan pada state sehingga memerlukan pembaruan tampilan.

Fungsi ini akan berdampak pada widget yang metode `build()` akan dipanggil dan bersangkutan dengannya.

### Perbedaan `const` dengan `final`
1. `const` - digunakan untuk deklarasi nilai konstan yang bersifat *compile-time constant*. Ini berarti bahwa nilai tersebut sudah harus diketahui pada saat kompilasi dan tidak dapat berubah ataupun diubah.

2. `final` digunakan untuk deklarasi variabel yang hanya dapat diinisialisasi sekali. Niari dari variabel `final` dapat ditentukan saat pada *runtime*, tetapi setelah inisialiasi pertama kali, nilainya tidak dapat diubah.

### Step-by-Step Checklist Implementation
