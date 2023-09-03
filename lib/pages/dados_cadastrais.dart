import 'package:flutter/material.dart';

class DadosCadastraisPage extends StatelessWidget {
  final String titleText;
  const DadosCadastraisPage({Key? key, required this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: const Text("Dados Cadastrais"),
    );
  }
}
