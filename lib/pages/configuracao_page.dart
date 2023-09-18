import 'package:flutter/material.dart';
import 'package:myappbootcamp/service/app_storage_service.dart';

class ConfiguracaoPage extends StatefulWidget {
  const ConfiguracaoPage({super.key});

  @override
  State<ConfiguracaoPage> createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  AppStorageService storege = AppStorageService();
  var nomeUsuarioController = TextEditingController();
  var alturaUsuarioController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    nomeUsuarioController.text = await storege.getConfiguracoesNomeUsuario();
    alturaUsuarioController.text =
        (await storege.getConfiguracoesAltura()).toString();
    receberNotificacoes = await storege.getConfiguracoesReceberNotificacao();
    temaEscuro = await storege.getConfiguracoesTemaEscuro();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Configurações")),
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
                value: receberNotificacoes,
                onChanged: (bool value) {
                  setState(() {
                    receberNotificacoes = value;
                  });
                }),
            SwitchListTile(
                title: const Text("Tema Escuro"),
                value: temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    temaEscuro = value;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storege.setConfiguracoesAltura(
                        double.parse(alturaUsuarioController.text));
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
                  await storege
                      .setConfiguracoesNomeUsuario(nomeUsuarioController.text);
                  await storege
                      .setConfiguracoesReceberNotificacao(receberNotificacoes);
                  await storege.setConfiguracoesTemaEscuro(temaEscuro);
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
