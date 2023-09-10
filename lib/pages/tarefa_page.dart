import 'package:flutter/material.dart';
import 'package:myappbootcamp/model/tarefa.dart';
import 'package:myappbootcamp/repositories/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var tarefasRepository = TarefaRepository();
  var _tarefas = const <Tarefa>[];
  var descricaoController = TextEditingController();
  var apenasNaoConcluido = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    if (mounted) {
      if (apenasNaoConcluido) {
        _tarefas = await tarefasRepository.listarNaoConcluidas();
      } else {
        _tarefas = await tarefasRepository.listarTarefas();
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            descricaoController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar Tarefa"),
                    content: TextField(
                      controller: descricaoController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () async {
                            await tarefasRepository.adicionar(
                                Tarefa(descricaoController.text, false));
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: const Text("Adicionar"))
                    ],
                  );
                });
          }),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Listar Apenas Não Concluidas"),
                  Switch(
                      value: apenasNaoConcluido,
                      onChanged: (bool value) {
                        setState(() {
                          apenasNaoConcluido = value;
                          obterTarefas();
                        });
                      })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = _tarefas[index];
                    return Dismissible(
                      onDismissed: (DismissDirection dismissDirection) async {
                        await tarefasRepository.remove(tarefa.id);
                      },
                      key: Key(tarefa.id),
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                            value: tarefa.concluido,
                            onChanged: (bool value) async {
                              await tarefasRepository.alterar(tarefa.id, value);
                              obterTarefas();
                            }),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
