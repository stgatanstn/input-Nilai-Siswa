import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ulangan_harian/main.dart';

void main() {
  testWidgets('Menghitung kategori nilai berdasarkan input',
      (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(NilaiSiswaApp());

    // Verify that there is an input field and a button.
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Hitung'), findsOneWidget);

    // Enter a valid input value.
    await tester.enterText(find.byType(TextField), '90');
    await tester.tap(find.text('Hitung'));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Verify that the output is the correct category.
    expect(find.text('Kategori Nilai: A'), findsOneWidget);
  });

  testWidgets('Menampilkan error untuk input tidak valid',
      (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(NilaiSiswaApp());

    // Enter an invalid input value.
    await tester.enterText(find.byType(TextField), '150');
    await tester.tap(find.text('Hitung'));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Verify that an error message is shown.
    expect(find.text('Silakan masukkan nilai antara 0 hingga 100.'),
        findsOneWidget);
  });
}
