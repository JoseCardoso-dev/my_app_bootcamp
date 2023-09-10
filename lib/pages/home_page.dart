import 'package:flutter/material.dart';
import 'package:myappbootcamp/pages/card_page.dart';
import 'package:myappbootcamp/pages/images_page.dart';
import 'package:myappbootcamp/pages/list_view.dart';
import 'package:myappbootcamp/pages/list_view_horizontal.dart';
import 'package:myappbootcamp/shared/widgets/custon_draw.dart';

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
        drawer: const CustonDraw(),
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
                  CardPage(),
                  ImagesPage(),
                  ListViewPage(),
                  ListViewHorizontal(),
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  pageController.jumpToPage(value);
                },
                currentIndex: posicaoPage,
                items: const [
                  BottomNavigationBarItem(
                      label: "Pag1", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "Pag3", icon: Icon(Icons.person)),
                  BottomNavigationBarItem(label: "Pag4", icon: Icon(Icons.list))
                ])
          ],
        ),
      ),
    );
  }
}
