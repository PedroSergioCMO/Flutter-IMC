import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final TextEditingController _alturacontroller = TextEditingController();
  final TextEditingController _pesocontroller = TextEditingController();
  double imc = 0;
  String imcexibido = "";
  String _resultado = "";
  String imagem = "assets/imgs/aguardando.png";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                style: FlutterLogoStyle.horizontal,
                size: 90,
                textColor: Colors.white,
              ),
              Text(
                " - IMC",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/imgs/imc.png'),
              height: 90,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 30,
              ),
              child: TextField(
                controller: _alturacontroller,
                style: const TextStyle(fontSize: 15),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text(
                    "Altura",
                    style: TextStyle(fontSize: 20),
                  ),
                  prefix: Text(
                    "Ex: 1.80  ",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 30,
              ),
              child: TextField(
                controller: _pesocontroller,
                style: const TextStyle(fontSize: 15),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text(
                    "Peso",
                    style: TextStyle(fontSize: 20),
                  ),
                  prefix: Text(
                    "Ex: 75.1  ",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: 250,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  double altura = double.parse(_alturacontroller.text);
                  double peso = double.parse(_pesocontroller.text);

                  imc = peso / (altura * altura);
                  imcexibido = imc.toStringAsFixed(1);
                  setState(() {
                    if (imc <= 18.5) {
                      _resultado = "Abaixo do Peso";
                      imagem = "assets/imgs/baixo_peso.jpg";
                    } else if (imc >= 18.6 && imc < 25) {
                      _resultado = "Peso ideal (Congratulations)";
                      imagem = "assets/imgs/peso_normal.jpg";
                    } else if (imc >= 25 && imc < 30) {
                      _resultado = "Levemente cima do peso";
                      imagem = "assets/imgs/excesso_peso.jpg";
                    } else if (imc >= 30 && imc < 35) {
                      _resultado = "Obesidade grau I";
                      imagem = "assets/imgs/obesidade.jpg";
                    } else if (imc >= 35 && imc < 40) {
                      _resultado = "Obesidade grau II (Severa)";
                      imagem = "assets/imgs/obessidade_extrema.jpg";
                    } else if (imc > 40) {
                      _resultado = "Obesidade grau III (Vai morrer em)";
                      imagem = "assets/imgs/morte.png";
                    }
                  });
                  _alturacontroller.clear();
                  _pesocontroller.clear();
                  FocusScope.of(context).unfocus();
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Seu IMC é $imcexibido, Análise: $_resultado",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Image.asset(
                      imagem,
                      height: 200,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
