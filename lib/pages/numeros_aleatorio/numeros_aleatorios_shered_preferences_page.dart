import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myappbootcamp/service/app_storage_service.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int? numeroGerado = 0;
  int? qtdClick = 0;
  var random = Random();
  AppStorageService storege = AppStorageService();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    numeroGerado = await storege.getNumeroAleatorio();
    qtdClick = await storege.getQuantidadeClicks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Gerador de Números"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              numeroGerado == null ? "" : numeroGerado.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            Text(qtdClick == null
                ? "Você clicou 0 vezes!!"
                : "Você clicou $qtdClick vezes!!")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            setState(() {
              numeroGerado = random.nextInt(1000);
              qtdClick = qtdClick == null ? 1 : qtdClick! + 1;
            });
            await storege.setNumeroAleatorio(numeroGerado!);
            await storege.setQuantidadeClicks(qtdClick!);
          }),
    ));
  }
}
