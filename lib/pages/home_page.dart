import 'package:flutter/material.dart';
import 'package:myappbootcamp/pages/dados_cadastrais.dart';
import 'package:myappbootcamp/pages/pagina1.dart';
import 'package:myappbootcamp/pages/pagina2.dart';
import 'package:myappbootcamp/pages/pagina3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(initialPage: 0);
  int posicaoPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      width: double.infinity,
                      child: const Text("Dados Cadastrais")),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DadosCadastraisPage(
                          titleText: "Meus Dados",
                        ),
                      ),
                    );
                  },
                ),
                const Divider(),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      width: double.infinity,
                      child: const Text("Anotações")),
                  onTap: () {},
                ),
                const Divider(),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      width: double.infinity,
                      child: const Text("Cronograma Semanal")),
                  onTap: () {},
                ),
                const Divider(),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      width: double.infinity,
                      child: const Text("Lista de Compras")),
                  onTap: () {},
                ),
                const Divider(),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      width: double.infinity,
                      child: const Text("Termos de Privacidade")),
                  onTap: () {},
                ),
                const Divider(),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      width: double.infinity,
                      child: const Text("Configurações")),
                  onTap: () {},
                ),
                const Divider(),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      width: double.infinity,
                      child: const Text("Sair")),
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPage = value;
                  });
                },
                children: const [
                  Pagina1Page(),
                  Pagina2Page(),
                  Pagina3Page(),
                ],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  pageController.jumpToPage(value);
                },
                currentIndex: posicaoPage,
                items: const [
                  BottomNavigationBarItem(
                      label: "Pag1", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "Pag3", icon: Icon(Icons.person))
                ])
          ],
        ),
      ),
    );
  }
}
