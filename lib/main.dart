import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product & Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF136F63)),
        scaffoldBackgroundColor: const Color(0xFFF4F6F2),
        useMaterial3: true,
      ),
      home: const ProductProfilePage(),
    );
  }
}

class ProductProfilePage extends StatelessWidget {
  const ProductProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PPM Sesi 2 - Nama (NIM)'),
        backgroundColor: const Color(0xFFF4F6F2),
        foregroundColor: const Color(0xFF18332F),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _PromoBanner(),
            SizedBox(height: 22),
            _SectionHeading(title: 'Profil Mahasiswa', eyebrow: 'TENTANG SAYA'),
            SizedBox(height: 10),
            StudentProfileCard(),
            SizedBox(height: 24),
            _SectionHeading(title: 'Produk Pilihan', eyebrow: 'TOKO HARI INI'),
            SizedBox(height: 10),
            ProductCard(),
          ],
        ),
      ),
    );
  }
}

class _PromoBanner extends StatelessWidget {
  const _PromoBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142,
      decoration: BoxDecoration(
        color: const Color(0xFF136F63),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PROMO MINGGU INI',
                  style: TextStyle(
                    color: Color(0xFFFFD166),
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Temukan pilihan\nuntuk harimu.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 18,
            bottom: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD166),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'DISKON 20%',
                style: TextStyle(
                  color: Color(0xFF18332F),
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                ),
              ),
            ),
          ),
          const Positioned(
            right: 18,
            top: 16,
            child: Icon(
              Icons.local_offer_outlined,
              color: Colors.white24,
              size: 42,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.title, required this.eyebrow});

  final String title;
  final String eyebrow;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: const TextStyle(
            color: Color(0xFFCF5C36),
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF18332F),
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class StudentProfileCard extends StatelessWidget {
  const StudentProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xFFE5EAE5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xFFDCECE6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.person,
                color: Color(0xFF136F63),
                size: 36,
              ),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Mahasiswa',
                    style: TextStyle(
                      color: Color(0xFF18332F),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'NIM: 123456789',
                    style: TextStyle(color: Color(0xFF64736D)),
                  ),
                  Text(
                    'Prodi / Kelas: Informatika / A',
                    style: TextStyle(color: Color(0xFF64736D)),
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFE6A817), size: 17),
                      Icon(Icons.star, color: Color(0xFFE6A817), size: 17),
                      Icon(Icons.star, color: Color(0xFFE6A817), size: 17),
                      Icon(Icons.star, color: Color(0xFFE6A817), size: 17),
                      Icon(Icons.star, color: Color(0xFFE6A817), size: 17),
                    ],
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

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  static const int _unitPrice = 125000;
  int _quantity = 1;
  int _likes = 24;
  bool _isFavorite = false;

  void _changeQuantity(int amount) {
    setState(() {
      _quantity = (_quantity + amount).clamp(1, 999);
    });
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      _likes += _isFavorite ? 1 : -1;
    });
  }

  String _formatRupiah(int amount) {
    final digits = amount.toString();
    final formatted = digits.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );
    return 'Rp $formatted';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xFFE5EAE5)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 150,
            color: const Color(0xFFEAF1EC),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.headphones, color: Color(0xFF136F63), size: 58),
                SizedBox(height: 5),
                Text(
                  'Gambar produk',
                  style: TextStyle(color: Color(0xFF64736D)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Headphone Studio',
                            style: TextStyle(
                              color: Color(0xFF18332F),
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Elektronik & Audio',
                            style: TextStyle(color: Color(0xFF64736D)),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Rp 125.000',
                            style: TextStyle(
                              color: Color(0xFF136F63),
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          key: const ValueKey('favorite-button'),
                          onPressed: _toggleFavorite,
                          tooltip: 'Favorite',
                          visualDensity: VisualDensity.compact,
                          icon: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isFavorite
                                ? const Color(0xFFCF5C36)
                                : const Color(0xFF64736D),
                          ),
                        ),
                        Text(
                          '$_likes suka',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF64736D),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Jumlah produk',
                        style: TextStyle(
                          color: Color(0xFF64736D),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      key: const ValueKey('quantity-minus'),
                      onPressed: _quantity > 1
                          ? () => _changeQuantity(-1)
                          : null,
                      tooltip: 'Kurangi jumlah',
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      '$_quantity',
                      key: const ValueKey('quantity-value'),
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    IconButton(
                      key: const ValueKey('quantity-plus'),
                      onPressed: () => _changeQuantity(1),
                      tooltip: 'Tambah jumlah',
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Total harga',
                        style: TextStyle(color: Color(0xFF64736D)),
                      ),
                    ),
                    Text(
                      _formatRupiah(_unitPrice * _quantity),
                      key: const ValueKey('total-price'),
                      style: const TextStyle(
                        color: Color(0xFF18332F),
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '$_quantity produk ditambahkan ke keranjang',
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                    label: const Text('Tambah ke Keranjang'),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF136F63),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
