import 'package:flutter/material.dart';
import 'package:quizz/widgets/colors.dart';
import 'package:quizz/widgets/custom_button.dart';
import 'package:quizz/widgets/custom_text.dart' ;
import 'package:quizz/widgets/page_quizz.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool trouver=false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color3,
        title: Text(widget.title,style: const TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image:  DecorationImage(
            image: AssetImage(
              "images/img-1.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              TextButton(
                style:TextButton.styleFrom(
                  backgroundColor: color3,
                  elevation: 10.0,
                  minimumSize: Size(
                      MediaQuery.of(context).size.width/2,
                      10.0
                  ),
                ),
                onPressed:(){
                      Navigator.push(
                          context,
                        MaterialPageRoute(builder: (context)
                        {
                          return  const PageQuizz();
                        }
                        )
                      );
                },
                child:CustomButton(
                  "Commencez le quiz",
                  factor: 1.2,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ]
        ),
      ),
    );
  }

}
