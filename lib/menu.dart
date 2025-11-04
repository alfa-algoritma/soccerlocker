import 'package:flutter/material.dart';

// Class untuk menampung data item (diadaptasi dari ItemHomepage di Tutorial 6)
// Sesuai Tugas 7, kita tambahkan properti Color
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

// Widget utama kita, diadaptasi dari MyHomePage di Tutorial 6 [cite: 767]
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  // Daftar item sesuai permintaan Tugas 7 [cite: 1616-1625]
  final List<ShopItem> items = [
    ShopItem("All Products", Icons.shopping_bag, Colors.blue),
    ShopItem("My Products", Icons.inventory, Colors.green),
    ShopItem("Create Product", Icons.add_shopping_cart, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SoccerLocker', // Judul AppBar
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // Menggunakan GridView seperti di Tutorial 6 [cite: 955]
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Welcome to SoccerLocker!', // Judul Halaman
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // GridView untuk menampilkan item-item
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Menggunakan custom widget ShopCard
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget untuk Card, diadaptasi dari ItemCard di Tutorial 6 [cite: 843]
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Menggunakan warna spesifik dari item 
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        // Aksi onTap untuk menampilkan Snackbar [cite: 859]
        onTap: () {
          // Menampilkan SnackBar sesuai permintaan Tugas 7 [cite: 1626]
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              // Pesan Sesuai Tugas 7 [cite: 1632-1634]
              content: Text("Kamu telah menekan tombol ${item.name}!"),
            ));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
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