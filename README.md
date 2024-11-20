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

## **TUGAS 9**<br>
### Mengapa harus membuat model untuk pengambilan atau pengirim data JSON?
1. Membuat struktur data yang konsisten agar manipulasi dan pengelolaan data akan menjadi lebih mudah.
2. Type safety - Tipe yang konsisten menjamin bahwa obyek-obyek yang dibuat tidak akan error karena tipe yang berbeda.
3. Memudahkan dalam melakukan deserialisai dan serialisasi yang merupakan konversi JSON ke objek dan sebaliknya.

### Apakah akan error bila tidak membuat model terlebih dahulu?
1. Kemungkinan struktur data yang digunakan menjadi tidak konsisten karena tidak ada validasi.
2. Kemungkinan tipe yang digunakan akan bermasalah sehingga akan menimbulkan runtime error.

### Fungsi dari CookieRequest dan alasan mengapa *instance* dari CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah kelas yang digunakan untuk mengelola permintaan HTTP yang memerlukan penyimpanan dan pengelolaan cookie, yang penting untuk autentikasi dan sesi pengguna. Membagikan instance dari `CookieRequest` ke semua komponen di aplikasi Flutter memastikan konsistensi sesi, memudahkan akses dan pengelolaan sesi secara terpusat, serta meningkatkan efisiensi dengan mengurangi penggunaan memori dan meningkatkan performa aplikasi. Dengan satu instance yang dibagikan, semua permintaan HTTP dapat menggunakan cookie yang sama, menjaga status autentikasi pengguna di seluruh aplikasi.

### Mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter
Mekanisme pengiriman data pada Flutter dimulai dari input pengguna yang dimasukkan melalui widget seperti `TextFormField`, kemudian data tersebut dikumpulkan dan divalidasi dalam form menggunakan `GlobalKey<FormState>`. Setelah validasi, data dikirim ke server menggunakan metode HTTP seperti POST melalui paket seperti `http` atau `dio`, atau dalam kasus autentikasi dan sesi, menggunakan CookieRequest untuk mengelola cookie. Server memproses data dan mengirimkan respons kembali dalam format JSON. Respons ini kemudian di-decode menjadi objek Dart menggunakan metode seperti `jsonDecode` atau model yang telah dibuat. Data yang diterima kemudian ditampilkan pada UI menggunakan widget seperti `Text`, `ListView`, atau `GridView`, yang di-update melalui mekanisme state management seperti `setState`, `Provider`, atau `Bloc`, sehingga pengguna dapat melihat hasil dari data yang telah dikirim dan diproses.

### Mekanisme autentikasi dari login, register, hingga logout.
1. Registrasi:
    - **Input Data**: Pengguna memasukkan data akun seperti nama pengguna, email, dan kata sandi melalui widget `TextFormField` di Flutter.
    - **Kirim Data**: Data yang dikumpulkan dikirim ke endpoint registrasi Django menggunakan metode HTTP POST.
    - **Proses di Server**: Django memproses data ini, membuat akun baru, dan mengembalikan respons yang sesuai.
    - **Tampilkan Hasil**: Flutter menampilkan pesan sukses atau error berdasarkan respons dari server.
2. Login:
    - **Input Kredensial**: Pengguna memasukkan nama pengguna dan kata sandi melalui widget `TextFormField` di Flutter
    - **Kirim Data**: Kredensial dikirim ke endpoint login Django menggunakan metode HTTP POST.
    - **Verifikasi di Server**: Django memverifikasi kredensial dan, jika valid, mengembalikan token atau cookie sesi.
    - **Simpan Sesi**: `CookieRequest` di Flutter menyimpan cookie atau token ini untuk digunakan dalam permintaan berikutnya.
    - **Navigasi ke Menu**: Setelah login berhasil, Flutter menavigasi pengguna ke menu utama aplikasi
3. Logout:
    - **Kirim Permintaan Logout**: Pengguna mengklik tombol logout, yang mengirim permintaan ke endpoint logout Django.
    - **Hapus Sesi di Server**: Django menghapus sesi pengguna di server.
    - **Hapus Sesi Lokal**: Flutter menghapus cookie atau token sesi lokal.
    - **Navigasi ke Halaman Login**: Flutter mengarahkan pengguna kembali ke halaman login.

### Implementasi Step-by-Step
1. Membuat views yang akan digunakan sebagai endpoint pada proyek Django sebagai endpoint untuk ngefetch data JSON.
```py
from django.contrib.auth.models import User
import json
from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from main.models import Product;

@csrf_exempt
def login(request):
  username = request.POST['username']
  password = request.POST['password']
  user = authenticate(username=username, password=password)
  if user is not None:
    if user.is_active:
      auth_login(request, user)
      # Status login sukses.
      return JsonResponse({
        "username": user.username,
        "status": True,
        "message": "Login sukses!"
        # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
      }, status=200)
    else:
      return JsonResponse({
        "status": False,
        "message": "Login gagal, akun dinonaktifkan."
      }, status=401)

  else:
    return JsonResponse({
      "status": False,
      "message": "Login gagal, periksa kembali email atau kata sandi."
    }, status=401)
  
@csrf_exempt
def register(request):
  if request.method == 'POST':
    data = json.loads(request.body)
    username = data['username']
    password1 = data['password1']
    password2 = data['password2']

    # Check if the passwords match
    if password1 != password2:
      return JsonResponse({
        "status": False,
        "message": "Passwords do not match."
      }, status=400)
      
    # Check if the username is already taken
    if User.objects.filter(username=username).exists():
        return JsonResponse({
          "status": False,
          "message": "Username already exists."
        }, status=400)
      
      # Create the new user
    user = User.objects.create_user(username=username, password=password1)
    user.save()
      
    return JsonResponse({
      "username": user.username,
      "status": 'success',
      "message": "User created successfully!"
    }, status=200)
  
  else:
      return JsonResponse({
          "status": False,
          "message": "Invalid request method."
      }, status=400)

@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':

        data = json.loads(request.body)
        new_product = Product.objects.create(
            user=request.user,
            name=data['name'],
            price=data['price'],
            description=data['description'],
            stock=data['stock'],
        )

        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)

@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)
```

2. Jangan lupa juga untuk menambahkan routing url yang diperlukan untuk setiap views yang telah diimplementasikan.
```py
from django.urls import path
from authentication.views import login, register, create_product_flutter, logout

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('register/', register, name='register'),
    path('create-flutter/', create_product_flutter, name='create_product_flutter'),
    path('logout/', logout, name='logout'),
]
```

3. Pada proyek Flutter implementasikan form yang berisi input username, password, dan konfirmasi password.

4. Setelah itu, buatkan logic yang akan digunakan saat pengguna menekan button registrasi.

5. Buatkan validasi logic registrasi dan jika input tervalidasi maka akan di redirect kembali ke `LoginPage()`.

6. Selain itu, buatkan juga validasi pada halaman login yang akan digunakan untuk melakukan autentikasi pengguna.

7. Terakhir, tambahkan logic flow logout pada proyek Flutter agar pengguna dapat keluar dari aplikasi saat menekan tombol logout.

8. Setelah membuat semua logic autentikasi, buatkan tampilan untuk melihat daftar produk pada proyek Flutter sebagai berikut.
```dart
import 'package:flutter/material.dart';
import 'package:pan_pan_mobile/models/product_entry.dart';
import 'package:pan_pan_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pan_pan_mobile/screens/product_detail.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');

    // Melakukan decode response menjadi bentuk json
    var data = response;

    // Melakukan konversi data json menjadi object ProductEntry
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data Product pada Pan-Pan Little Shop.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
                return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                  // Navigate to product detail page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      productName: snapshot.data![index].fields.name,
                      productPrice: snapshot.data![index].fields.price,
                      description: snapshot.data![index].fields.description,
                      stock: snapshot.data![index].fields.stock,
                    ),
                    ),
                  );
                  },
                  child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                      "${snapshot.data![index].fields.name}",
                      style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("${snapshot.data![index].fields.price}"),
                    const SizedBox(height: 10),
                    Text("${snapshot.data![index].fields.description}"),
                    const SizedBox(height: 10),
                    Text("${snapshot.data![index].fields.stock}"),
                    ],
                  ),
                  ),
                ),
                );
            }
          }
        },
      ),
    );
  }
}
```

9. Selain itu, tambahkan juga sebuah halaman dimana pengguna akan di redirect kepada bila pengguna menekan salah satu produk atau item yang ditampilkan pada halaman list produk.
```py
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String description;
  final int stock;

  const ProductDetailPage({super.key, 
    required this.productName,
    required this.productPrice,
    required this.description,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '\$${productPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Stock: $stock',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
```

9. Filtering telah dilakukan pada proyek Django sehingga pengguna yang terlogin hanya dapat melihat produk miliknya dan bukan milik orang lain.

## **TUGAS 8**<br>
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