import 'package:myappbootcamp/model/card_detali.dart';

class CardDetaliRepository {
  Future<CardDetali> get() async {
    await Future.delayed(const Duration(seconds: 3));
    return CardDetali(
        1,
        "Universidade: UFBA",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Bras%C3%A3o_da_UFBA.png/388px-Bras%C3%A3o_da_UFBA.png",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque a dui pulvinar, placerat dui eleifend, vulputate ex. Mauris id quam arcu. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed faucibus ex non eros elementum commodo. Nulla rutrum aliquam ante, fringilla ullamcorper orci.");
  }
}
