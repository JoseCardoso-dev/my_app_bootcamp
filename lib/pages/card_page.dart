import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: double.infinity,
          child: Card(
            elevation: 8,
            shadowColor: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Bras%C3%A3o_da_UFBA.png/388px-Bras%C3%A3o_da_UFBA.png",
                      width: 50,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Universidade: UFBA",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ]),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque a dui pulvinar, placerat dui eleifend, vulputate ex. Mauris id quam arcu. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed faucibus ex non eros elementum commodo. Nulla rutrum aliquam ante, fringilla ullamcorper orci.",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify),
                  Container(
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {}, child: Text("Ler mais...")))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
