import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: JogoMemoria(),
  ));
}

class JogoMemoria extends StatefulWidget {
  @override
  _JogoMemoriaState createState() => _JogoMemoriaState();
}

class _JogoMemoriaState extends State<JogoMemoria> {
  String img1 = '';
  String img2 = '';
  int id1 = 0;
  int id2 = 0;
  int pontos = 0;
  List<String> imgList = ['', '', '', '', '', '', '', '', ''];

  setAll() {
    setState(() {
      imgList[id1] = '';
      imgList[id2] = '';
      img1 = '';
      img2 = '';
      id1 = 0;
      id2 = 0;
    });
  }

  comper(String imgUrl, int id) {
    if (img1.isEmpty) {
      setState(() {
        imgList[id] = imgUrl;
        img1 = imgUrl;
        id1 = id;
      });
    } else {
      setState(() {
        imgList[id] = imgUrl;
        img2 = imgUrl;
        id2 = id;
      });

      if (img1 == img2 && id1 != id2) {
        setState(() {
          imgList[id1] = img1;
          imgList[id2] = img2;
          pontos++;
          img1 = '';
          img2 = '';
          id1 = 0;
          id2 = 0;
        });
      } else {
        pontos--;
        setAll();
      }
    }
  }

  Widget bildImage(String imgUrl, int id) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          // color: Colors.white,
          height: 300,
          width: 300,
          child: GestureDetector(
            child: Image(
              image: AssetImage(imgList[id]),
              fit: BoxFit.cover,
            ),
            onTap: () {
              comper(imgUrl, id);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          Text(
            pontos.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  imgList = ['', '', '', '', '', '', '', '', ''];
                  pontos = 0;
                  setAll();
                });
              },
              child: Icon(
                Icons.settings_backup_restore,
                size: 40.0,
                color: Colors.amber,
              ),
            ),
          ),
        ],
        title: Text(
          'Jogo da Memória',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 20),
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  bildImage('assets/images/desenho01.jpg', 1),
                  bildImage('assets/images/desenho02.jpg', 2),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  bildImage('assets/images/desenho03.jpg', 3),
                  bildImage('assets/images/desenho04.jpg', 4),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  bildImage('assets/images/desenho01.jpg', 5),
                  bildImage('assets/images/desenho02.jpg', 6),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  bildImage('assets/images/desenho03.jpg', 7),
                  bildImage('assets/images/desenho04.jpg', 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* Image(
            height: 180.0,
            width: 180.0,
            image: AssetImage(img),
            fit: BoxFit.cover,
          ), */
