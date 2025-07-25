import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cotacoes_app/main.dart'; // Importa seu app principal

void main() {
  testWidgets('Verifica se título da HomePage é exibido', (
    WidgetTester tester,
  ) async {
    // Constrói o widget CotacoesApp
    await tester.pumpWidget(CotacoesApp());

    // Verifica se o texto "Cotações em Tempo Real" aparece na tela
    expect(find.text('Cotações em Tempo Real'), findsOneWidget);
  });
}
