import 'package:flutter/material.dart';

void main() {
  runApp(const ProductProfileApp());
}

class ProductProfileApp extends StatelessWidget {
  const ProductProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    const brandColor = Color(0xFF176B5B);

    return MaterialApp(
      title: 'Product & Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: brandColor,
          surface: const Color(0xFFF7F8F5),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F8F5),
          foregroundColor: Color(0xFF173B34),
          centerTitle: false,
        ),
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
        title: const Text(
          'PPM Sesi 2 - Nama (NIM)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              children: const [
                PromoBanner(),
                SizedBox(height: 20),
                SectionHeading(
                  eyebrow: 'KENALAN DULU',
                  title: 'Profil Mahasiswa',
                ),
                SizedBox(height: 10),
                StudentProfileCard(),
                SizedBox(height: 22),
                SectionHeading(
                  eyebrow: 'PILIHAN MINGGU INI',
                  title: 'Produk Pilihan',
                ),
                SizedBox(height: 10),
                ProductCard(),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Belanja nyaman, belajar tetap semangat ✨',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF74827E), fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 148,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF145C50), Color(0xFF328B70)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Positioned(
              right: -18,
              top: -48,
              child: Container(
                width: 188,
                height: 188,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
            ),
            Positioned(
              right: 18,
              bottom: -34,
              child: Icon(
                Icons.local_mall_rounded,
                size: 150,
                color: Colors.white.withValues(alpha: 0.12),
              ),
            ),
            const Positioned(left: 22, top: 18, child: _PromoCopy()),
            Positioned(
              left: 22,
              bottom: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD166),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'KODE: PPMHEMAT',
                  style: TextStyle(
                    color: Color(0xFF493812),
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PromoCopy extends StatelessWidget {
  const _PromoCopy();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PROMO SPESIAL',
          style: TextStyle(
            color: Color(0xFFBCE8D8),
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Temukan favoritmu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          'Diskon sampai 25% untuk pilihan minggu ini',
          style: TextStyle(color: Colors.white, fontSize: 11),
        ),
      ],
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({required this.eyebrow, required this.title, super.key});

  final String eyebrow;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: const TextStyle(
            color: Color(0xFF788984),
            fontSize: 9,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF183A33),
            fontSize: 18,
            fontWeight: FontWeight.w800,
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
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFFE9EFEB)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xFFE5F2EC),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.person_rounded,
                size: 36,
                color: Color(0xFF176B5B),
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
                      color: Color(0xFF173B34),
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'NIM: 23.11.0000',
                    style: TextStyle(color: Color(0xFF667771), fontSize: 12),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Teknik Informatika • Kelas A',
                    style: TextStyle(color: Color(0xFF667771), fontSize: 11),
                  ),
                  SizedBox(height: 6),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFB938),
                        size: 16,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFB938),
                        size: 16,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFB938),
                        size: 16,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFB938),
                        size: 16,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFB938),
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Mahasiswa aktif',
                        style: TextStyle(
                          color: Color(0xFF87938E),
                          fontSize: 10,
                        ),
                      ),
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
  static const int _unitPrice = 349000;
  int _quantity = 1;
  int _likes = 128;
  bool _isFavorite = false;

  String _formatRupiah(int amount) {
    final digits = amount.toString();
    final formatted = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) {
        formatted.write('.');
      }
      formatted.write(digits[i]);
    }
    return 'Rp${formatted.toString()}';
  }

  void _changeQuantity(int difference) {
    setState(() {
      _quantity = (_quantity + difference).clamp(1, 99).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(color: Color(0xFFE9EFEB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 174,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFE8F1EA), Color(0xFFD7E8DD)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.headphones_rounded,
                      size: 104,
                      color: Color(0xFF276D5B),
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'TERLARIS',
                      style: TextStyle(
                        color: Color(0xFF176B5B),
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 10,
                  child: Material(
                    color: Colors.white,
                    shape: const CircleBorder(),
                    child: IconButton(
                      key: const Key('favoriteButton'),
                      tooltip: _isFavorite
                          ? 'Hapus dari favorit'
                          : 'Tambahkan ke favorit',
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                          _likes += _isFavorite ? 1 : -1;
                        });
                      },
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite
                            ? const Color(0xFFE85D75)
                            : const Color(0xFF60716A),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 13, 16, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF4EF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Aksesori',
                        style: TextStyle(
                          color: Color(0xFF286A58),
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.favorite_rounded,
                      color: Color(0xFFE85D75),
                      size: 15,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$_likes suka',
                      style: const TextStyle(
                        color: Color(0xFF718079),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Aurora Headphone',
                  style: TextStyle(
                    color: Color(0xFF183A33),
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Suara jernih, nyaman dipakai seharian.',
                  style: TextStyle(color: Color(0xFF78847E), fontSize: 11),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'HARGA',
                            style: TextStyle(
                              color: Color(0xFF87938E),
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.8,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _formatRupiah(_unitPrice),
                            style: const TextStyle(
                              color: Color(0xFF176B5B),
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _QuantityButton(
                      label: 'Kurangi jumlah',
                      icon: Icons.remove,
                      onPressed: _quantity > 1
                          ? () => _changeQuantity(-1)
                          : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '$_quantity',
                        key: const Key('quantityValue'),
                        style: const TextStyle(
                          color: Color(0xFF183A33),
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    _QuantityButton(
                      label: 'Tambah jumlah',
                      icon: Icons.add,
                      onPressed: () => _changeQuantity(1),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    key: const Key('addToCartButton'),
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text(
                              '$_quantity Aurora Headphone ditambahkan ke keranjang '
                              '(${_formatRupiah(_unitPrice * _quantity)})',
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shopping_bag_outlined, size: 18),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            'Tambah ke Keranjang • '
                            '${_formatRupiah(_unitPrice * _quantity)}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF176B5B),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 13),
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

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34,
      height: 34,
      child: IconButton.outlined(
        tooltip: label,
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        iconSize: 17,
        visualDensity: VisualDensity.compact,
        icon: Icon(icon),
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF176B5B),
          side: const BorderSide(color: Color(0xFFDCE8E0)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
