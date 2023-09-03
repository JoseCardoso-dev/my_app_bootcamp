import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailControler = TextEditingController(text: "");
  var senhaControler = TextEditingController(text: "");
  bool isObscurePwd = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 155, 194, 206),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(flex: 5, child: Container()),
                      Expanded(
                        flex: 4,
                        child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Bras%C3%A3o_da_UFBA.png/388px-Bras%C3%A3o_da_UFBA.png",
                        ),
                      ),
                      Expanded(flex: 5, child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Já tem cadastro?",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Faça seu login e make the change_",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: Expanded(
                        child: TextField(
                      controller: emailControler,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: -2),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 29, 113, 192))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 29, 113, 192))),
                          hintText: "E-mail",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 29, 113, 192),
                          )),
                    )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: Expanded(
                        child: TextField(
                      obscureText: isObscurePwd,
                      controller: senhaControler,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: -2),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 29, 113, 192))),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 29, 113, 192))),
                          hintText: "Senha",
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 29, 113, 192),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isObscurePwd = !isObscurePwd;
                              });
                            },
                            child: Icon(
                                isObscurePwd
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                          )),
                    )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            if (emailControler.text.trim() ==
                                    "email@email.com" &&
                                senhaControler.text.trim() == "12345678") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Login efetuado com sucesso!!")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Erro ao logar!!")));
                            }
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 29, 113, 192))),
                          child: const Text(
                            "ENTRAR",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
                  Expanded(flex: 2, child: Container()),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Esqueci minha senha",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
