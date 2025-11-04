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