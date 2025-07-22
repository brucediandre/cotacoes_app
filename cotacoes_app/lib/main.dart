import 'package:flutter/material.dart';

void main() {
  runApp(CotacoesApp());
}

class CotacoesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Cotações',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bem-vindo')),
      body: Center(
        child: Text(
          'Bem-vindo(a) ao App de Cotações!',
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
