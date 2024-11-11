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

## **TUGAS ***<br>
### Kegunaan `const` pada Flutter
`const` adalah sebuah keyword yang digunakan untuk mendeklarasikan variabel atau objek yang bersifat konstan dan tidak diubah setelah diinisalisasi. Nilai pada variabel `const` sudah seharusnya diketahui pada saat kompilasi.

`const` biasanya digunakan pada variabel yang sudah diketauhi nilainya pada saat kompilasi atau pada *widget* yang kita tahu tidak akan berubah selama siklus hidup aplikasi (*Stateless widget*). 

Sementara itu, `const` sebaiknya tidak digunakan bila nilai variabel perlu di proses setelah kompilasi atau dapat berubah selama runtime. Selain itu, keyword `const` juga sebaiknya tidak digunakan pada *Stateful widgets* karena dapat berubah selama siklus hidup aplikasi. Kita dapat menggunakan `final` atau variabel biasa yang akan lebih cocok pada kasus seperti ini.

### Layout `Column` dan `Row` pada Flutter
1. `Column`
Widget yang menyusun widget anakanya secara vertikal (dari atas ke bawah). Widget ini biasanya digunakan saat kita ingin menempatkan widget anak dalam satu kolom.

Contoh:
```dart
Column(
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
```

2. `Row`
Widget yang menyusun widget anakanya secaral horizontal (dari kiri ke kanan). Widget ini biasanya digunakan saat kita ingin menempatkan widget anak dalam satu baris.

Contoh:
```dart
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
```

### Elemen input pada *form* tugas
Ada dua elemen input yang digunakan pada *form* yang diimplementasikan pada tugas, `TextFormField` dan `ElevatedButton`. 

`TextFormField` digunakan untuk menerima input bebas dari pengguna yang dapat divalidasi tipenya. Ini akan memberikan user kemudahan dalam menambahkan detail-detail dari produk.

`ElevatedButton` digunakan untuk menyimpan data-data yang sudah di input pada *form*. Saat button ditekan, sebuah fungsi akan dipanggil dan tampilan detail produk akan diperlihatkan.

Sementara itu, tentunya ada elemen lain yang tidak digunakan pada tugas kali ini, diantara lain adalah `DropdownButton`, `Checkbox`, `Radio`, `Switch`, dan masih banyak lagi. Elemen-elemen input tersebut tidak digunakan karena kurang cocok pada tipe input yang di ekspektasikan oleh pengguna.

### Konsistensi tema pada aplikasi
Ada beberapa cara yang dapat digunakan untuk menjaga konsitensi aplikasi ada ada dua metode yang telah dilakukan pada tugas ini:

1. Mendefinisikan warna-warna yang akan digunakan pada tugas pada berkas `main.dart`. Pada *widget-widget* yang digunakan, hanya warna-warna yang telah dipilih akan digunakan. Kalaupun ada warna yang ingin digunakan akan dipilih warna yang sesuai dengan warna primer.

2. Membagi *widget-widget* menjadi bagian-bagian pada berkas tersendiri. Ini akan membuat komponen-komponen yang digunakan untuk membangun aplikasi lebih modular dan mudah untuk disesuaikan dengan tema. Jika ada warna atau bentuk *widget* UI yang tidak sesuai dengan tema, maka yang akan terpengaruh hanyalah komponen tersebut.

### Navigasi pada aplikasi Flutter yang memiliki banyak halaman
Ada dua cara yang dapat digunakan untuk melakukan navigasi pada aplikasi yang dikembangkan menggunakan framework Flutter:

1. Menggunakan *drawer*
*Drawer* merupakan sebuah komponen UI yang digunakan untuk melakukan navigasi menuju halam lain. Fungsi *drawer* mirip dengan *navbar* pada pengembangan web dimana ada teks-teks pada sebuah komponen atau element tersebut yang dapat ditekan untuk mengarahkan pengguna kepada halaman yang ingin di lihat. Nantinya, objek teratas pada Stack akan ditukar (dengan fungsi `pushReplacement()`) dengan objek atau halaman yang ingin ditampilkan sehingga yang ditampilkan sekarang adalah yang diekpektasikan oleh pengguna.

2. Menggunakan elemen UI secara langsung
Adapun metode dimana kita dapat langsung membuat sebuah elemen UI dan menghubungkannya pada sebuah URL pada halaman kita. Elemen UI tersebut akan memanggil fungsi `push()` pada Stack halaman sehingga objek atau halaman yang pada index teratas Stack merupakan halaman yang ingin dilihat oleh pengguna.

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