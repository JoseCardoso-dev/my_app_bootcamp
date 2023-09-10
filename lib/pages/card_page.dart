import 'package:flutter/material.dart';
import 'package:myappbootcamp/model/card_detali.dart';
import 'package:myappbootcamp/pages/card_detali_page.dart';
import 'package:myappbootcamp/repositories/card_detali_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetali? cardDetali;
  var cardDetaliRepository = CardDetaliRepository();

  @override
  void initState() {
    super.initState();
    carregandoDados();
  }

  void carregandoDados() async {
    cardDetali = await cardDetaliRepository.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: double.infinity,
          child: cardDetali == null
              ? const LinearProgressIndicator()
              : Hero(
                  tag: cardDetali!.id,
                  child: Card(
                    elevation: 8,
                    shadowColor: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Image.network(
                              cardDetali!.url,
                              width: 50,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              cardDetali!.title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ]),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(cardDetali!.text,
                              style: const TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify),
                          Container(
                              alignment: Alignment.centerRight,
                              width: double.infinity,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CardDetaliPage(
                                                    cardDetali: cardDetali!)));
                                  },
                                  child: const Text("Ler mais...")))
                        ],
                      ),
                    ),
                  ),
                ),
        )
      ],
    );
  }
}
