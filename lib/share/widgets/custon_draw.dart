import 'package:flutter/material.dart';
import 'package:myappbootcamp/pages/dados_cadastrais.dart';
import 'package:myappbootcamp/pages/login_page.dart';

class CustonDraw extends StatelessWidget {
  const CustonDraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Câmera"),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(Icons.photo_library_outlined),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 125, 192, 247)),
                currentAccountPicture: CircleAvatar(
                    child: Image.network(
                        "https://avatars.githubusercontent.com/u/56493465?v=4")),
                accountName: const Text("José Cardoso"),
                accountEmail: const Text("jose@email.com")),
          ),
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
            onTap: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  context: context,
                  builder: (BuildContext bc) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Column(
                        children: [
                          const Text(
                            "Termos de Privacidade",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 16),
                          ),
                          Expanded(child: Container()),
                          Row(
                            children: [
                              const Text("Negar"),
                              Expanded(child: Container()),
                              const Text("Aceitar"),
                            ],
                          )
                        ],
                      ),
                    );
                  });
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
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                      title: const Text(
                        "Meu App",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      content: const Wrap(children: [
                        Text("Você sairá do aplicativo!!"),
                        Text("Deseja Realmente sair do aplicativo?"),
                      ]),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancelar")),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text("Sair")),
                      ],
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
