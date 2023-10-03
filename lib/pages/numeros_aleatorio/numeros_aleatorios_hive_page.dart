import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NumerosAleatoriosHivePage extends StatefulWidget {
  const NumerosAleatoriosHivePage({super.key});

  @override
  State<NumerosAleatoriosHivePage> createState() =>
      _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosHivePage> {
  int? numeroGerado = 0;
  int? qtdClick = 0;
  var random = Random();
  late Box boxNumerosAleatorio;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    if (Hive.isBoxOpen('box_numeros_aleatorio')) {
      boxNumerosAleatorio = Hive.box('box_numeros_aleatorio');
    } else {
      boxNumerosAleatorio = await Hive.openBox('box_numeros_aleatorio');
    }

    numeroGerado = boxNumerosAleatorio.get('numeroGerado') ?? 0;
    qtdClick = boxNumerosAleatorio.get('quantidadeClicks') ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Números com Hive"),
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
            boxNumerosAleatorio.put('numeroGerado', numeroGerado);
            boxNumerosAleatorio.put('quantidadeClicks', qtdClick);
          }),
    ));
  }
}
