import 'package:flutter/material.dart';
import 'package:myappbootcamp/pages/dados_cadastrais.dart';

class CustonDraw extends StatelessWidget {
  const CustonDraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 125, 192, 247)),
              currentAccountPicture: CircleAvatar(
                  child: Image.network(
                      "https://avatars.githubusercontent.com/u/56493465?v=4")),
              accountName: const Text("José Cardoso"),
              accountEmail: const Text("jose@email.com")),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 5),
                    Text("Dados Cadastrais"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DadosCadastraisPage(),
                ),
              );
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.note_alt_sharp),
                    SizedBox(width: 5),
                    Text("Anotações"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.calendar_month_outlined),
                    SizedBox(width: 5),
                    Text("Cronograma Semanal"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 5),
                    Text("Lista de Compras"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.privacy_tip_outlined),
                    SizedBox(width: 5),
                    Text("Termos de Privacidade"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 5),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {},
          ),
          Expanded(child: Container()),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 5),
                    Text("Sair"),
                  ],
                )),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
