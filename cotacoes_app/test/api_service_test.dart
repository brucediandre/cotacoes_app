import 'package:flutter_test/flutter_test.dart';
import 'package:cotacoes_app/api_service.dart';

void main() {
  group('ApiService', () {
    test('fetchRates retorna um mapa com cotações', () async {
      final rates = await ApiService.fetchRates();

      expect(rates, isA<Map<String, dynamic>>());
      expect(rates.containsKey('BRL'), isTrue); // Testa se tem Real
    });
  });
}
