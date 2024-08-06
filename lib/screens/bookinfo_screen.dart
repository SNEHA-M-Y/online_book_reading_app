import 'package:flutter/material.dart';

class ScreenBookInfo extends StatefulWidget {
  const ScreenBookInfo({super.key});

  @override
  State<ScreenBookInfo> createState() => _ScreenBookInfoState();
}

class _ScreenBookInfoState extends State<ScreenBookInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Flowers For Algernon",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Image.network(
                "http://books.google.com/books/content?id=JLunPwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
              ),
            ),
            Text(
              "Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "The compelling story of Charlie Gordon, willing victim of a strange experiment - a moron, a genius, a man in search of himself. Poignant, funny, tragic, but with a hope for the indomitable spirit of man, this unusual play tells a story you will long remember. It also offers a magnificent role.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Buy Now",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 50), backgroundColor: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
