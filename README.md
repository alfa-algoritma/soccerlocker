# Proyek SoccerLocker - Tugas 7 Pemrograman Berbasis Platform

Ini adalah implementasi proyek untuk Tugas 7, sebuah aplikasi Flutter sederhana bertema toko sepak bola ("SoccerLocker").

**Nama:** Muhammad Alfa Mubarok
**NPM:** 2406431391
**Kelas:** PBP D

---

## Jawaban Pertanyaan Tugas 7

Berikut adalah jawaban untuk pertanyaan-pertanyaan yang ada pada Tugas 7.

### 1. Apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget?

**Widget Tree (Pohon Widget)** adalah representasi struktur dari seluruh widget yang membangun UI aplikasi Flutter Anda. Bayangkan ini seperti pohon silsilah keluarga, di mana ada satu widget "root" (akar) dan setiap widget memiliki "anak" (children) yang juga merupakan widget.

**Hubungan Parent-Child (Induk-Anak):** 
* **Parent (Induk):** Widget yang berisi widget lain. Contoh: `Column` adalah *parent* bagi widget-widget di dalamnya.
* **Child (Anak):** Widget yang berada di dalam widget lain. Contoh: `Text` adalah *child* dari `Padding`.

Hubungan ini sangat penting karena:
1.  **Struktur:** *Parent* menentukan posisi, ukuran, dan tata letak *child*-nya. `Column` menyusun *child*-nya secara vertikal, sedangkan `Row` menyusunnya secara horizontal.
2.  **Pewarisan Data:** Data (seperti tema atau *state*) mengalir dari *parent* ke *child* di bawahnya melalui `BuildContext`.
3.  **Konfigurasi:** *Parent* "memberitahu" *child* bagaimana cara me-render dirinya sendiri.

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Berikut adalah widget yang digunakan dalam proyek **soccerlocker** ini:

* **MaterialApp:** Widget root yang membungkus seluruh aplikasi. Menyediakan fungsionalitas dasar Material Design, tema, dan navigasi.
* **Scaffold:** Menyediakan struktur halaman dasar (seperti `AppBar`, `body`, dll.). Digunakan di `MyHomePage`.
* **AppBar:** Bilah di bagian atas layar, digunakan untuk menampilkan judul halaman.
* **Text:** Digunakan untuk menampilkan teks (judul di `AppBar` dan nama item di `ShopCard`).
* **StatelessWidget:** Tipe widget yang kami gunakan (`MyApp`, `MyHomePage`, `ShopCard`) yang konfigurasinya tidak dapat diubah setelah dibuat (tidak memiliki *state*).
* **Column:** Menyusun *children*-nya (teks judul dan `GridView`) secara vertikal.
* **SingleChildScrollView:** Memastikan konten bisa di-*scroll* jika tidak muat di layar.
* **Padding:** Memberikan jarak/ruang di sekitar `GridView`.
* **GridView:** Menampilkan *children*-nya dalam format *grid* (kisi-kisi). Kami menggunakannya untuk menyusun 3 tombol.
* **Material:** Widget dasar yang menyediakan "kanvas" Material Design. Kami gunakan sebagai dasar dari `ShopCard` untuk memberi warna latar belakang dan bentuk `borderRadius`.
* **InkWell:** Membuat *child*-nya (bagian dalam `Material`) dapat merespons sentuhan (*tap*) dan menampilkan efek "riak" air. Digunakan untuk mendeteksi kapan tombol ditekan.
* **Icon:** Menampilkan ikon visual (seperti `Icons.shopping_bag`) di dalam `ShopCard`.
* **Center:** Memposisikan *child*-nya (konten `ShopCard`) di tengah.
* **SnackBar:** *Popup* sementara yang muncul di bagian bawah layar untuk menampilkan pesan singkat (digunakan saat tombol ditekan).
* **ScaffoldMessenger:** Mengelola dan menampilkan `SnackBar`.

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

**Fungsi `MaterialApp`:**
`MaterialApp` adalah widget fundamental di Flutter yang membungkus sejumlah widget dan fungsionalitas inti yang diperlukan untuk aplikasi ber-gaya Material Design (standar desain Google).

Fungsi utamanya adalah:
* Mengatur **tema (Theme)** global aplikasi (skema warna, font, dll.).
* Mengelola **navigasi (Routes)** antar halaman/layar.
* Menyediakan **lokalisasi (Localization)** untuk mendukung berbagai bahasa.
* Menentukan widget **`home`** (layar utama) yang pertama kali ditampilkan.

**Mengapa sering jadi Root Widget?** 
`MaterialApp` digunakan sebagai *root* (akar) karena ia **menyediakan konteks dan layanan penting** yang dibutuhkan oleh hampir semua widget lain di bawahnya dalam *widget tree*. Tanpa `MaterialApp`, widget-widget Material Design lain (seperti `Scaffold`, `AppBar`, `SnackBar`, `TextField`, dll.) tidak akan berfungsi atau tidak akan tampil dengan benar karena mereka perlu "mengetahui" tema atau navigator yang disediakan oleh `MaterialApp` terdekat di atas mereka.

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

Perbedaan utamanya terletak pada **State (keadaan)**.

* **StatelessWidget (Widget Statis):**
    * **Apa itu:** Widget yang **tidak memiliki *state* internal** yang bisa berubah.
    * **Cara kerja:** Setelah dibuat, konfigurasinya (properti yang diterimanya) bersifat *immutable* (tidak bisa diubah). Jika sesuatu perlu berubah, widget ini harus dihancurkan dan dibuat ulang dengan konfigurasi baru.
    * **Contoh:** `Icon`, `Text`, `AppBar`.
    * **Kapan dipakai:** Gunakan `StatelessWidget` saat UI yang Anda buat **hanya bergantung pada informasi yang diterimanya saat dibuat** dan tidak akan pernah berubah selama *runtime*. Contoh: Halaman "About", ikon, label teks statis. (Di proyek ini, `MyApp`, `MyHomePage`, dan `ShopCard` adalah `StatelessWidget`).

* **StatefulWidget (Widget Dinamis):**
    * **Apa itu:** Widget yang **memiliki *state* internal** yang bisa berubah selama *runtime*.
    * **Cara kerja:** Terdiri dari dua kelas: `StatefulWidget` (konfigurasi) dan `State` (keadaan). Ketika *state* berubah (misalnya, pengguna mengetik di `TextField` atau *counter* bertambah), kita memanggil `setState()`, yang memberi tahu Flutter untuk **membangun ulang (rebuild)** UI widget tersebut dengan nilai *state* yang baru.
    * **Contoh:** `Checkbox` (status *checked*), `TextField` (teks yang diketik), *counter* di aplikasi demo.
    * **Kapan dipakai:** Gunakan `StatefulWidget` saat UI perlu **berubah secara dinamis** sebagai respons terhadap interaksi pengguna, data yang masuk (misalnya dari API), atau waktu.

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

**Apa itu `BuildContext`?** 
`BuildContext` adalah "lokator" atau "alamat" untuk sebuah widget di dalam *widget tree*. Setiap widget memiliki `BuildContext`-nya sendiri, yang menyimpan informasi tentang **di mana** widget tersebut berada di dalam pohon.

**Mengapa Penting?** 
`BuildContext` sangat penting karena ia adalah "penghubung" widget ke seluruh aplikasi. Fungsinya:
1.  **Mencari *Parent*:** Digunakan untuk menemukan *parent* terdekat. Contoh: `ScaffoldMessenger.of(context)` menggunakan `context` untuk mencari `ScaffoldMessenger` terdekat di atasnya agar bisa menampilkan `SnackBar`.
2.  **Mewarisi Data:** Digunakan untuk mendapatkan data dari *parent*, seperti tema (`Theme.of(context)`).

**Penggunaan di Metode `build`:**
Metode `build(BuildContext context)` adalah metode di mana UI widget didefinisikan. Parameter `context` yang diterima di sinilah yang menjadi "alamat" widget tersebut.

Saat kita memanggil fungsi seperti `ScaffoldMessenger.of(context)`, kita memberikan `context` dari widget kita saat ini. Flutter kemudian akan "naik" ke atas pohon dari lokasi `context` tersebut untuk menemukan `ScaffoldMessenger` terdekat.

### 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

**Hot Reload:**
* **Apa itu:** Fitur pengembangan Flutter yang sangat cepat untuk meng-injeksi (menyuntikkan) file kode yang sudah diperbarui ke dalam *Dart Virtual Machine (VM)* yang sedang berjalan.
* **Cara kerja:** Saat Anda menyimpan perubahan kode, Flutter hanya memperbarui bagian kode yang berubah.
* **Keuntungan:** ***State* aplikasi tetap terjaga.** Jika Anda sedang di halaman ketiga aplikasi atau sebuah *counter* bernilai 10, setelah *hot reload*, Anda akan tetap di halaman ketiga dan *counter* tetap 10. Ini sangat cepat (biasanya kurang dari 1 detik) dan ideal untuk *tuning* UI.
* **Dari Tutorial 6:** Fitur ini disebut sebagai fitur JIT (Just In Time) atau *hot reload* yang memungkinkan developer melihat perubahan secara langsung.

**Hot Restart:** 
* **Apa itu:** Fitur yang memuat ulang kode aplikasi secara penuh, tetapi lebih cepat daripada menghentikan dan menjalankan ulang aplikasi dari awal.
* **Cara kerja:** *Hot restart* akan menghancurkan *state* aplikasi yang ada dan membangun ulang dari awal.
* **Kerugian:** ***State* aplikasi hilang.** Aplikasi akan kembali ke halaman utama (layar awal) dan semua variabel akan di-reset ke nilai defaultnya.
* **Kapan dipakai:** Digunakan ketika perubahan kode terlalu besar untuk di-*hot reload* (misalnya mengubah struktur *state* global atau mengubah dari `Stateless` ke `StatefulWidget`).

| Fitur | Kecepatan | State Aplikasi | Kapan Digunakan |
| :--- | :--- | :--- | :--- |
| **Hot Reload** | Sangat Cepat (< 1 detik) | **Terjaga** (Preserved) | Mengubah UI, *layout*, warna, teks. |
| **Hot Restart** | Cepat (Beberapa detik) | **Hilang** (Reset) | Perubahan *state* besar, *hot reload* gagal. |

---

# Proyek SoccerLocker - Tugas 8 Pemrograman Berbasis Platform

Ini adalah implementasi proyek untuk Tugas 8, sebuah aplikasi Flutter sederhana bertema toko sepak bola ("SoccerLocker").

**Nama:** Muhammad Alfa Mubarok
**NPM:** 2406431391
**Kelas:** PBP D

---

## Jawaban Pertanyaan Tugas 8

Berikut adalah jawaban untuk pertanyaan-pertanyaan yang ada pada Tugas 8.

### 1. Perbedaan `Navigator.push()` dan `Navigator.pushReplacement()`

Perbedaan utama terletak pada cara mereka mengelola *stack* (tumpukan) halaman:

* **`Navigator.push()`:** Mendorong halaman baru **di atas** halaman saat ini.
    * **Analogi:** Menumpuk buku baru di atas tumpukan buku.
    * **Efek:** Halaman lama masih ada di bawahnya, dan pengguna bisa kembali ke halaman tersebut dengan menekan tombol "Back".
    * **Kapan digunakan di SoccerLocker:** Digunakan saat membuka halaman **"Tambah Produk"** (`ProductFormPage`). Ini ideal karena setelah selesai mengisi form, pengguna pasti ingin kembali ke Halaman Utama.

* **`Navigator.pushReplacement()`:** **Mengganti** halaman saat ini dengan halaman baru.
    * **Analogi:** Mengambil buku teratas dari tumpukan dan langsung menggantinya dengan buku baru.
    * **Efek:** Halaman lama dihancurkan dan dihapus dari tumpukan. Pengguna **tidak bisa** menekan "Back" untuk kembali ke halaman yang diganti.
    * **Kapan digunakan di SoccerLocker:** Digunakan saat di *drawer* menekan **"Halaman Utama"**. Jika pengguna berada di halaman "Tambah Produk" dan menekan "Halaman Utama" di *drawer*, kita tidak ingin menumpuk halaman utama di atas form. Kita ingin mengganti halaman form dengan halaman utama.

### 2. Pemanfaatan Hierarchy Widget (Scaffold, AppBar, Drawer)

Saya memanfaatkan hierarki ini untuk menciptakan struktur yang konsisten:

1. **`Scaffold`:** Saya gunakan sebagai "kerangka" dasar untuk setiap halaman baru, seperti `MyHomePage` dan `ProductFormPage`. `Scaffold` menyediakan slot yang sudah ditentukan, seperti `appBar` dan `drawer`.
2. **`AppBar`:** Saya tempatkan di dalam `appBar` milik `Scaffold` di setiap halaman. Ini memastikan *branding* (`backgroundColor: Colors.indigo`) dan judul halaman selalu ada di posisi yang sama dan terlihat konsisten.
3. **`Drawer`:** Saya membuat satu widget kustom `LeftDrawer` dan memasukkannya ke dalam slot `drawer` di `Scaffold` pada kedua halaman (`MyHomePage` dan `ProductFormPage`). Hasilnya, menu navigasi utama aplikasi saya konsisten dan bisa diakses dari mana saja.

Dengan menggunakan tiga widget ini, saya tidak perlu membuat ulang *header* atau menu navigasi di setiap halaman. Saya hanya perlu fokus pada konten unik di dalam properti `body` dari `Scaffold`.

### 3. Kelebihan Layout Widget (Padding, SingleChildScrollView, ListView)

Widget-widget ini sangat penting untuk membuat form yang fungsional dan rapi:

* **`Padding`:**
    * **Kelebihan:** Memberikan "ruang napas" di sekitar elemen. Tanpa `Padding`, *field* form akan menempel di tepi layar dan menempel satu sama lain, membuatnya terlihat berantakan dan sulit digunakan.
    * **Contoh Penggunaan:** Saya membungkus seluruh `Column` di `ProductFormPage` dengan `Padding(padding: const EdgeInsets.all(16.0))` untuk memberi jarak dari tepi layar. Saya juga menggunakan `Padding(padding: const EdgeInsets.symmetric(vertical: 8.0))` di antara setiap `TextFormField` agar tidak saling menempel.

* **`SingleChildScrollView`:**
    * **Kelebihan:** Membuat konten di dalamnya bisa di-*scroll* jika tidak muat di layar. Ini **wajib** untuk form. Saat pengguna mengetik dan *keyboard* virtual muncul, `SingleChildScrollView` memastikan pengguna bisa men-*scroll* ke *field* yang tersembunyi di bawah *keyboard*.
    * **Contoh Penggunaan:** Di `ProductFormPage`, saya membungkus seluruh `Column` yang berisi *field* form dengan `SingleChildScrollView`. Ini menjamin halaman tetap bisa digunakan di layar kecil atau saat *keyboard* aktif.

* **`ListView`:**
    * **Kelebihan:** Mirip dengan `SingleChildScrollView` tetapi lebih optimal untuk daftar item yang panjang atau dinamis. `ListView` juga menyediakan *scrolling* secara otomatis.
    * **Contoh Penggunaan:** Saya menggunakan `ListView` di `LeftDrawer`. Ini adalah pilihan ideal karena *drawer* pada dasarnya adalah daftar opsi menu, dan `ListView` memastikan daftar itu bisa di-*scroll* jika nanti opsinya bertambah banyak.

### 4. Menyesuaikan Warna Tema (Konsistensi Brand)

Saya menyesuaikan tema agar konsisten dengan *brand* "SoccerLocker" (yang saya asosiasikan dengan warna yang profesional dan terpercaya seperti biru tua/indigo) di file `main.dart`.

* **`primarySwatch: Colors.indigo`:** Saya tidak menggunakan `Colors.blue` biasa. Saya memilih `Colors.indigo` sebagai `primarySwatch` (palet warna utama). Ini secara otomatis memberi tahu Flutter untuk menggunakan warna `indigo` yang lebih gelap dan profesional untuk `AppBar` di `ProductFormPage` dan `LeftDrawer`, serta turunan warna yang lebih terang untuk aksen.
* **`scaffoldBackgroundColor: Colors.grey[100]`:** Saya juga mengatur warna latar belakang *default* untuk semua `Scaffold` menjadi abu-abu sangat muda. Ini memberi kontras yang lembut agar elemen-elemen di atasnya (seperti *card* form yang putih) terlihat lebih menonjol.

Dengan mengatur tema di `main.dart`, saya tidak perlu menentukan `backgroundColor: Colors.indigo` di setiap `AppBar` secara manual. Tema ini berlaku secara global, memastikan konsistensi visual di seluruh aplikasi.

--- 

# Proyek SoccerLocker - Tugas 9 Integrasi Web Django dengan Aplikasi Flutter

**Nama:** Muhammad Alfa Mubarok  
**NPM:** 2406431391  
**Kelas:** PBP D

---

## Jawaban Pertanyaan Tugas 9

### 1. Mengapa perlu membuat model Dart saat mengambil/mengirim data JSON?
Kita perlu membuat model Dart (seperti `Product` class) untuk melakukan **serialisasi dan deserialisasi** data JSON.
* **Type Safety:** Dart adalah bahasa *strongly-typed*. Model memastikan bahwa data yang kita gunakan di aplikasi memiliki tipe yang benar (misalnya `price` adalah `int`, `name` adalah `String`).
* **Autocompletion:** Dengan model, IDE bisa memberikan saran (autocomplete) properti yang tersedia, mengurangi risiko *typo*.
* **Maintainability:** Jika struktur data berubah, kita cukup mengubah modelnya di satu tempat.

**Konsekuensi tanpa model:**
Jika kita menggunakan `Map<String, dynamic>` mentah:
* Kita harus mengakses data dengan string key (misal `data['name']`), yang rentan salah ketik.
* Tidak ada validasi tipe otomatis; kita bisa tidak sengaja memasukkan `String` ke variabel `int`, yang menyebabkan *runtime error*.
* Kode menjadi sulit dibaca dan dirawat.

### 2. Fungsi package `http` dan `CookieRequest`
* **`http`:** Package dasar untuk melakukan HTTP request (GET, POST, PUT, DELETE) ke server. Ini menangani komunikasi level rendah.
* **`CookieRequest` (dari `pbp_django_auth`):** Wrapper di atas `http` yang dirancang khusus untuk Django.
    * **Peran Utama:** Mengelola **session cookies** dan **CSRF tokens** secara otomatis.
    * **Perbedaan:** `http` biasa tidak menyimpan *cookies* antar request secara otomatis. Tanpa `CookieRequest`, setiap kali kita request ke Django, Django akan menganggap kita sebagai pengguna baru (tidak login). `CookieRequest` menyimpan session ID sehingga status login terjaga.

### 3. Mengapa `CookieRequest` perlu dibagikan ke semua komponen?
Instance `CookieRequest` menyimpan data sesi login (cookies). Agar status login konsisten di seluruh aplikasi (dari halaman Login, ke Menu, ke Form, ke List), semua halaman harus menggunakan **instance yang sama**. Jika kita membuat instance baru di setiap halaman, cookies login akan hilang, dan pengguna dianggap logout. Oleh karena itu, kita menggunakan **Provider** di `main.dart` untuk membagikan satu instance `CookieRequest` ke seluruh *widget tree*.

### 4. Konfigurasi Konektivitas
Agar Flutter (di Emulator Android) bisa bicara dengan Django (di Localhost komputer):
1.  **`10.0.2.2` di `ALLOWED_HOSTS`:** Emulator Android melihat `localhost` komputer kita sebagai `10.0.2.2`. Django memblokir host yang tidak dikenal demi keamanan, jadi kita harus mengizinkan alamat ini.
2.  **`CORS_ALLOW_ALL_ORIGINS = True`:** Mengizinkan aplikasi dari *origin* berbeda (Flutter) untuk mengakses resource Django.
3.  **`android.permission.INTERNET`:** Android secara default memblokir akses internet aplikasi untuk keamanan/privasi. Kita harus meminta izin ini di `AndroidManifest.xml` agar aplikasi bisa mengirim request.

**Jika tidak dikonfigurasi:**
Request dari Flutter akan ditolak oleh Django (Error 400 Bad Request atau Network Error), atau diblokir oleh Android OS (Permission Denied).

### 5. Mekanisme Pengiriman Data (Input -> Tampil)
1.  **Input:** Pengguna mengisi form di Flutter (`TextFormField`).
2.  **Serialization:** Data input diubah menjadi format JSON menggunakan `jsonEncode`.
3.  **Request:** Flutter mengirim HTTP POST request berisi JSON tersebut ke endpoint Django (misal `/create-flutter/`) menggunakan `CookieRequest`.
4.  **Backend Processing:** Django menerima request, mem-parsing JSON, membuat objek Model baru, dan menyimpannya ke database.
5.  **Fetching:** Untuk menampilkan, Flutter mengirim HTTP GET request ke endpoint JSON Django (`/json/`).
6.  **Deserialization:** Flutter menerima respon JSON, lalu mengubahnya menjadi objek Dart (`Product` model) menggunakan `fromJson`.
7.  **Display:** Objek Dart tersebut ditampilkan di UI menggunakan widget seperti `ListView` atau `GridView`.

### 6. Mekanisme Autentikasi
1.  **Login:**
    * Flutter mengirim `username` & `password` ke endpoint `/auth/login/`.
    * Django memverifikasi kredensial. Jika valid, Django membuat sesi dan mengembalikan **session cookie**.
    * `CookieRequest` di Flutter menyimpan cookie ini.
2.  **Session:**
    * Setiap request berikutnya dari Flutter akan menyertakan cookie ini.
    * Django membaca cookie untuk mengetahui siapa pengguna yang sedang login.
3.  **Logout:**
    * Flutter mengirim request ke `/auth/logout/`.
    * Django menghapus sesi di server.
    * `CookieRequest` menghapus cookie di lokal. Pengguna kembali ke status *anonymous*.

### 7. Implementasi Checklist Step-by-Step
1.  **Persiapan:** Menambahkan dependency `provider`, `pbp_django_auth` di Flutter dan konfigurasi `CORS`, `ALLOWED_HOSTS` di Django.
2.  **Model:** Membuat file `models/product.dart` dengan menggunakan Quicktype untuk menyesuaikan struktur JSON dari Django.
3.  **Auth:**
    * Membuat `login.dart` dan `register.dart` yang menggunakan `CookieRequest` untuk POST ke endpoint auth Django.
    * Memasang `Provider` di `main.dart` untuk menyebarkan `CookieRequest`.
4.  **Halaman List (`list_product.dart`):**
    * Menggunakan `FutureBuilder` untuk memanggil fungsi `fetchProduct`.
    * Fungsi `fetchProduct` melakukan GET ke `/json/`.
    * Data JSON diparsing menjadi `List<Product>`.
    * Menampilkan data dalam `ListView`.
5.  **Halaman Detail (`detail_product.dart`):**
    * Membuat halaman yang menerima parameter `Product`.
    * Menampilkan seluruh atribut (`name`, `price`, `description`, dll) dalam UI yang rapi.
    * Menambahkan tombol "Back".
6.  **Navigasi:**
    * Menambahkan menu "Daftar Produk" di `left_drawer.dart`.
    * Menghubungkan `InkWell` pada `ListView` item ke halaman detail.