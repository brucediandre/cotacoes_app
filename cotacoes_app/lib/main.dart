import 'package:flutter/material.dart';
import 'api_service.dart';
import 'details_page.dart';

void main() {
  runApp(CotacoesApp());
}

class CotacoesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Cotações',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16)),
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // Após 3 segundos, navega para a HomePage
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.currency_exchange, size: 80, color: Colors.indigo),
            SizedBox(height: 20),
            Text(
              'Bem-vindo ao App de Cotações!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Aguarde enquanto carregamos os dados...',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(color: Colors.indigo),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Map<String, dynamic>> _futureRates;

  @override
  void initState() {
    super.initState();
    _futureRates = ApiService.fetchRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cotações em Tempo Real')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _futureRates,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else {
            final rates = snapshot.data!;
            final moedas = rates.keys.toList();

            return ListView.builder(
              itemCount: moedas.length,
              itemBuilder: (context, index) {
                String moeda = moedas[index];
                double valor = rates[moeda].toDouble();

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    leading: Icon(
                      Icons.currency_exchange,
                      color: Colors.indigo,
                    ),
                    title: Text(
                      moeda,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Valor: $valor'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            moeda: moeda,
                            valor: valor,
                            rates: rates,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
