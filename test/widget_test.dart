// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ppm_sesi2_product_profile/main.dart';

void main() {
  testWidgets('Product and profile controls work', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('PPM Sesi 2 - Nama (NIM)'), findsOneWidget);
    expect(find.byType(StudentProfileCard), findsOneWidget);
    expect(
      tester.widget<Text>(find.byKey(const ValueKey('total-price'))).data,
      'Rp 125.000',
    );

    await tester.ensureVisible(find.byKey(const ValueKey('favorite-button')));
    await tester.tap(find.byKey(const ValueKey('favorite-button')));
    await tester.pump();
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.text('25 suka'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const ValueKey('quantity-plus')));
    await tester.tap(find.byKey(const ValueKey('quantity-plus')));
    await tester.pump();
    expect(
      tester.widget<Text>(find.byKey(const ValueKey('total-price'))).data,
      'Rp 250.000',
    );
    expect(
      tester.widget<Text>(find.byKey(const ValueKey('quantity-value'))).data,
      '2',
    );

    await tester.tap(find.byKey(const ValueKey('quantity-minus')));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('quantity-minus')));
    await tester.pump();
    expect(
      tester.widget<Text>(find.byKey(const ValueKey('quantity-value'))).data,
      '1',
    );

    await tester.ensureVisible(find.byType(FilledButton));
    await tester.tap(find.byType(FilledButton));
    await tester.pump();
    expect(find.text('1 produk ditambahkan ke keranjang'), findsOneWidget);
  });
}
