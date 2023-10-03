import 'package:flutter/material.dart';
import 'package:myappbootcamp/model/configuracao_model.dart';
import 'package:myappbootcamp/repositories/configuracao_repository.dart';

class ConfiguracaoHivePage extends StatefulWidget {
  const ConfiguracaoHivePage({super.key});

  @override
  State<ConfiguracaoHivePage> createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoHivePage> {
  late ConfiguracoesRepository configuracoesRepository;
  late ConfiguracoesModel configuracoesModel;

  var nomeUsuarioController = TextEditingController();
  var alturaUsuarioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    configuracoesModel = configuracoesRepository.obterDados();

    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaUsuarioController.text = configuracoesModel.altura.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Configurações - Hive")),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: const InputDecoration(hintText: "Nome Usuário"),
                controller: nomeUsuarioController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Altura Usuário"),
                controller: alturaUsuarioController,
              ),
            ),
            SwitchListTile(
                title: const Text("Receber Notificações"),
                value: configuracoesModel.receberNotificacoes,
                onChanged: (bool value) {
                  setState(() {
                    configuracoesModel.receberNotificacoes = value;
                  });
                }),
            SwitchListTile(
                title: const Text("Tema Escuro"),
                value: configuracoesModel.temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    configuracoesModel.temaEscuro = value;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    configuracoesModel.altura =
                        double.parse(alturaUsuarioController.text);
                  } catch (e) {
                    // ignore: use_build_context_synchronously
                    showDialog(
                        context: context,
                        builder: (bc) {
                          return AlertDialog(
                            title: const Text("Erro"),
                            content:
                                const Text("Favor, informa uma altura válida!"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"))
                            ],
                          );
                        });
                    return;
                  }
                  configuracoesModel.nomeUsuario = nomeUsuarioController.text;

                  configuracoesRepository.salvar(configuracoesModel);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    ));
  }
}
