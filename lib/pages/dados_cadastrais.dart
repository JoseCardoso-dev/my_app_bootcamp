import 'package:flutter/material.dart';
import 'package:myappbootcamp/repositories/linguagens_repository.dart';
import 'package:myappbootcamp/repositories/nivel_repository.dart';
import 'package:myappbootcamp/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNacimentoController = TextEditingController(text: "");
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var nivelSelecionado = "";
  var niveis = [];
  var linguagens = [];
  var linguagensSelecionadas = [];
  int tempoExperiencia = 0;
  double salarioEscolhido = 0;
  DateTime? dataNascimento;

  bool salvado = false;

  @override
  void initState() {
    linguagens = linguagensRepository.retornarLinguagens();
    niveis = nivelRepository.retornarNiveis();
    super.initState();
  }

  List<DropdownMenuItem> retornaListDropdown(int quantidade) {
    var itens = <DropdownMenuItem>[];

    for (var i = 0; i <= quantidade; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text("${i.toString()} anos"),
      ));
    }

    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Dados"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: salvado
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(text: "Nome"),
                  TextField(
                    controller: nomeController,
                  ),
                  const TextLabel(text: "Data de Nascimento"),
                  TextField(
                      controller: dataNacimentoController,
                      readOnly: true,
                      onTap: () async {
                        var data = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000, 1, 1),
                            firstDate: DateTime(1900, 5, 20),
                            lastDate: DateTime(2023, 10, 23));
                        if (data != null) {
                          dataNacimentoController.text = data.toString();
                          dataNascimento = data;
                        }
                      }),
                  const TextLabel(text: "Nivel de Experiência"),
                  Column(
                      children: niveis
                          .map((nivel) => RadioListTile(
                              dense: true,
                              title: Text(nivel.toString()),
                              selected: nivelSelecionado == nivel,
                              value: nivel.toString(),
                              groupValue: nivelSelecionado,
                              onChanged: (value) {
                                setState(() {
                                  nivelSelecionado = value.toString();
                                });
                              }))
                          .toList()),
                  const TextLabel(text: "Linguagens Preferidas"),
                  Column(
                    children: linguagens
                        .map((linguagem) => CheckboxListTile(
                            dense: true,
                            title: Text(linguagem),
                            value: linguagensSelecionadas.contains(linguagem),
                            onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  linguagensSelecionadas.add(linguagem);
                                });
                              } else {
                                setState(() {
                                  linguagensSelecionadas.remove(linguagem);
                                });
                              }
                            }))
                        .toList(),
                  ),
                  const TextLabel(text: "Tempo de Experiência"),
                  DropdownButton(
                      value: tempoExperiencia,
                      isExpanded: true,
                      items: retornaListDropdown(30),
                      onChanged: (value) {
                        setState(() {
                          tempoExperiencia = int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      text:
                          "Pretenção Salarial. R\$ ${salarioEscolhido.round()}"),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: salarioEscolhido,
                      onChanged: (double value) {
                        setState(() {
                          salarioEscolhido = value;
                        });
                      }),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          salvado = false;
                        });

                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("O nome deve ser preenchido")));
                          return;
                        }
                        if (dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Data de nascimento inválida")));
                          return;
                        }
                        if (nivelSelecionado.trim() == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O nível deve ser selecionado")));
                          return;
                        }
                        if (linguagensSelecionadas.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Deve ser selecionado ao menos uma linguagem")));
                          return;
                        }
                        if (tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Deve ter ao menos um ano de experiência em uma das linguagens")));
                          return;
                        }
                        if (salarioEscolhido == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A pretenção salarial deve ser maior que 0")));
                          return;
                        }
                        setState(() {
                          salvado = true;
                        });
                        Future.delayed(const Duration(seconds: 3), () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Dados salvo com sucesso")));
                          setState(() {
                            salvado = false;
                          });
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("Salvar"))
                ],
              ),
      ),
    );
  }
}
