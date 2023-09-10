import 'package:flutter/material.dart';
import 'package:myappbootcamp/model/card_detali.dart';

class CardDetaliPage extends StatelessWidget {
  final CardDetali cardDetali;
  const CardDetaliPage({super.key, required this.cardDetali});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetali.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
                Container(
                  alignment: Alignment.center,
                  child: Image.network(
                    cardDetali.url,
                    width: 80,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  cardDetali.title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Text(cardDetali.text,
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CardDetaliPage(cardDetali: cardDetali)));
                        },
                        child: const Text("Ler mais...")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
