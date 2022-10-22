import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.white],
          ),
        ),
        child: Column(
          children: [
            Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    FadeInLeft(
                      duration: Duration(milliseconds: 1000),
                      child: Image.asset(
                        'assets/images/amirreza.jpg',
                        width: 195,
                        height: 195,
                        fit: BoxFit.fill,
                      ),
                    ),
                    FadeInRight(
                      duration: Duration(milliseconds: 1000),
                      child: Image.asset(
                        'assets/images/amirsepehr.jpg',
                        width: 195,
                        height: 195,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: FadeIn(
                duration: Duration(milliseconds: 2000),
                child: Text(
                  "Amir Reza    Amir Sepehr",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: FadeInRight(
                duration: Duration(milliseconds: 2000),
                child: Text(
                  "github : Amirmohseni87" +
                      "\n" +
                      "github : AmirsepehrAbedini",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: FadeInLeft(
                duration: Duration(milliseconds: 2000),
                child: Text(
                  "Email : Amirmohseni87@yahoo.com" +
                      "\n" +
                      "Email : amirsepehrabedini@gmail.com",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: FadeInUp(
                  duration: Duration(milliseconds: 2000),
                  child: Text(
                    "Reddit AP project made by\n Amir Reza and Amir Sepehr",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
