import 'package:flutter/material.dart';
import 'package:soccerlocker/models/product.dart';

class DetailProductPage extends StatelessWidget {
  final Product product;

  const DetailProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar
              if (product.fields.thumbnail.isNotEmpty)
                Center(
                  child: Image.network(
                     "https://muhammad-alfa41-playmax.pbp.cs.ui.ac.id/proxy-image/?url=${Uri.encodeComponent(product.fields.thumbnail)}",
                     height: 250,
                     fit: BoxFit.cover,
                     errorBuilder: (context, error, stackTrace) =>
                         const Icon(Icons.broken_image, size: 100),
                  ),
                ),
              const SizedBox(height: 20),
              
              // Nama
              Text(
                product.fields.name,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Harga
              Text(
                "Price: Rp ${product.fields.price}",
                style: const TextStyle(fontSize: 18.0, color: Colors.green),
              ),
              const SizedBox(height: 10),

              // Kategori
              Text(
                "Category: ${product.fields.category}",
                style: const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 20),

              // Deskripsi
              const Text(
                "Description:",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                product.fields.description,
                style: const TextStyle(fontSize: 16.0),
              ),
              
              const SizedBox(height: 20),
              if (product.fields.isFeatured)
                Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.amber,
                    child: const Text("Featured Product", style: TextStyle(fontWeight: FontWeight.bold)),
                ),

              const SizedBox(height: 30),
              
              // Tombol Kembali
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back to List'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}