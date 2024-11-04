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
| Card | Widget yang digunakan untuk membuat desain material kartu. |

### Fungsi `setState()`
Sebuah metode yang digunakan dalam `StatefulWidget` untuk memberi tahu Flutter bahwa ada perbubahan pada state sehingga memerlukan pembaruan tampilan.

Fungsi ini akan berdampak pada widget yang metode `build()` akan dipanggil dan bersangkutan dengannya.

### Perbedaan `const` dengan `final`
1. `const` - digunakan untuk deklarasi nilai konstan yang bersifat *compile-time constant*. Ini berarti bahwa nilai tersebut sudah harus diketahui pada saat kompilasi dan tidak dapat berubah ataupun diubah.

2. `final` digunakan untuk deklarasi variabel yang hanya dapat diinisialisasi sekali. Niari dari variabel `final` dapat ditentukan saat pada *runtime*, tetapi setelah inisialiasi pertama kali, nilainya tidak dapat diubah.

### Step-by-Step Checklist Implementation
1. Inisialiasi proyek dengan menggunakan command di bawah ini. Potongan command pada terminal tersebut akan membuat sebuah project baru dengan nama pan_pan_mobile
    ```bash
    flutter create pan_pan_mobile
    ```

2. Setelah melakukan hal tersebut, proyek template akan diinisialisasi oleh Flutter secara otomatis, namun masih ada beberapa setup yang perlu kita lakukan pada proyek template tersebut agar terlihat lebih rapih. Salah satunya adalah
untuk memindahkan widget `MyHomePage` dari `main.dart` ke dalam sebuah file baru yang akan dinamakan `menu.dart`.

3. Selain itu, pada `main.dart`, hilangkan baris yang tidak dibutuhkan dan ganti beberapa baris dengan yang dibutuhkan agar proyek tidak mengandung error.

4. Setelah melakukan perubahan pada `main.dart`, mulailah perubahan tambahan pada `menu.dart`. Perubahan yang dibutuhkan di antara lain adalah menambahkan `ItemHomePage` yang merupakan *class* untuk bekerja sebagai field untuk menampung `ItemCard`. Selain itu, `ItemCard` juga akan ditambahkan pada `menu.dart` yang akan digunakan sebagai tombol yang akan memunculkan *snack bar* bila ditekan. Tambahkan juga InfoCard yang merupakan kartu untuk memperlihatkan informasi mahasiswa. Potongan kodenya adalah sebagai berikut:
    - `MyHomePage`
    ```dart
    class MyHomePage extends StatelessWidget {
        final String npm = '2306207505'; // NPM
        final String name = 'Alexander William Lim'; // Nama
        final String className = 'PBP F'; // Kelas

        MyHomePage({super.key});

        final List<ItemHomepage> items = [
            ItemHomepage("Lihat Daftar Produk", Icons.mood),
            ItemHomepage("Tambah Produk", Icons.add),
            ItemHomepage("Logout", Icons.logout),
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
                ),
                    // Body halaman dengan padding di sekelilingnya.
                    body: Padding(
                        padding: const EdgeInsets.all(16.0),
                        // Menyusun widget secara vertikal dalam sebuah kolom.
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                // Row untuk menampilkan 3 InfoCard secara horizontal.
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                    InfoCard(title: 'NPM', content: npm),
                                    InfoCard(title: 'Name', content: name),
                                    InfoCard(title: 'Class', content: className),
                                ],
                            ),

                            // Memberikan jarak vertikal 16 unit.
                            const SizedBox(height: 16.0),

                            // Menempatkan widget berikutnya di tengah halaman.
                            Center(
                                child: Column(
                                    // Menyusun teks dan grid item secara vertikal.

                                    children: [
                                    // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                                    const Padding(
                                        padding: EdgeInsets.only(top: 16.0),
                                        child: Text(
                                            'Welcome to Pan-Pan Mobile!',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                            ),
                                        ),
                                    ),

                                    // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                                    GridView.count(
                                        primary: true,
                                        padding: const EdgeInsets.all(20),
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 3,
                                        // Agar grid menyesuaikan tinggi kontennya.
                                        shrinkWrap: true,

                                        // Menampilkan ItemCard untuk setiap item dalam list items.
                                        children: items.map((ItemHomepage item) {
                                        return ItemCard(item);
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
    ```

    - `ItemHomePage`
    ```dart
    class ItemHomepage {
        final String name;
        final IconData icon;

        ItemHomepage(this.name, this.icon);
    }
    ```

    - `InfoCard`
    ```dart
    class InfoCard extends StatelessWidget {
        // Kartu informasi yang menampilkan title dan content.

        final String title; // Judul kartu.
        final String content; // Isi kartu.

        const InfoCard({super.key, required this.title, required this.content});

        @override
        Widget build(BuildContext context) {
            return Card(
                // Membuat kotak kartu dengan bayangan dibawahnya.
                elevation: 2.0,
                color: Colors.grey,
                child: Container(
                    // Mengatur ukuran dan jarak di dalam kartu.
                    width: MediaQuery.of(context).size.width /
                        3.5, // menyesuaikan dengan lebar device yang digunakan.
                    padding: const EdgeInsets.all(16.0),
                    // Menyusun title dan content secara vertikal.
                    child: Column(
                    children: [
                        Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Text(content),
                    ],
                    ),
                ),
            );
        }
    }
    ```

    - `ItemCard`
    ```dart
    class ItemCard extends StatelessWidget {
        // Menampilkan kartu dengan ikon dan nama.

        final ItemHomepage item;

        const ItemCard(this.item, {super.key});

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
    ```

5. Terakhir, jangan lupa untuk mengubah widget `MyHomePage` menjadi *stateless* karena bersifat sebuah widget yang tidak akan berubah *state* selama aplikasi berjalan.  