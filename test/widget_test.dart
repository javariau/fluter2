import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ppm_sesi2_product_profile/main.dart';

void main() {
  testWidgets('product controls update likes, quantity, total, and cart', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(360, 1000));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const ProductProfileApp());

    expect(find.text('PPM Sesi 2 - Nama (NIM)'), findsOneWidget);
    expect(find.text('Rp349.000'), findsOneWidget);
    expect(find.text('128 suka'), findsOneWidget);
    final layoutException = tester.takeException();
    expect(layoutException, isNull, reason: '$layoutException');

    await tester.tap(find.byTooltip('Kurangi jumlah'));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byKey(const Key('favoriteButton')));
    await tester.pumpAndSettle();
    expect(find.text('129 suka'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    await tester.tap(find.byTooltip('Tambah jumlah'));
    await tester.pumpAndSettle();
    expect(find.text('2'), findsOneWidget);
    expect(find.text('Tambah ke Keranjang • Rp698.000'), findsOneWidget);

    await tester.tap(find.byTooltip('Kurangi jumlah'));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byKey(const Key('addToCartButton')));
    await tester.pumpAndSettle();
    expect(
      find.text('1 Aurora Headphone ditambahkan ke keranjang (Rp349.000)'),
      findsOneWidget,
    );
  });
}
