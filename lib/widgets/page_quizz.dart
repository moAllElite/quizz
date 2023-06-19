import 'package:flutter/material.dart';
import 'package:quizz/widgets/custom_button.dart';
import 'package:quizz/widgets/question.dart';
import 'package:quizz/widgets/colors.dart';
import 'custom_text.dart';
class PageQuizz extends StatefulWidget{
  const PageQuizz({super.key});
  @override
  State<StatefulWidget> createState() =>_PageQuizzState();

}
class _PageQuizzState extends State<PageQuizz>{
  Question?  question;
  List<Question>listeQuestion=[
    Question("Il n'y a pas de manga dans cette image ?", false, "En effet le jeune fille tiens un manga", "img-2.jpg"),
    Question("Je suis Obito Uzumaki ", false, "Je suis Kakashi Hatake", "img-3.jpg"),
    Question("C'est un bouillon  ", false, "C'est un ramen", "img-4.jpg"),
    Question("je suis Boruto Uzumaki ", true, "Je suis boruto le fils du hokage", "boruto.png")
  ];
  int index=0;
  int score=0;
  @override
  void initState() {
    super.initState();
    question=listeQuestion[index] ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            "Le Quizz"
        ),
      ),
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText("Qustion numéro ${listeQuestion.length}",
              fontSize: 23.0,
              textAlign: TextAlign.center,
            ),
            CustomText("Score: $score / $index"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.2 ,
              width: MediaQuery.of(context).size.width / 1.1,
              child:Card(
                semanticContainer: false,
                shape:const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)
                ),
                borderOnForeground: true,
                color: Colors.transparent,
                elevation: 18.0,
                child:Image.asset(
                    "images/${question!.imagePath}",
                    fit: BoxFit.cover
                ),
              ),
            ),
            CustomText(question!.question,factor: 1.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style:  TextButton.styleFrom(
                    backgroundColor: color2,
                  ),
                  onPressed:() {
                    dialogue(true);
                  },
                  child:  CustomButton("vrai".toUpperCase(),
                    color:Colors.white,
                    fontSize: 17.0,
                  ),
                ),

                OutlinedButton(
                  onPressed: (){
                    dialogue(false);
                  },
                  style: OutlinedButton.styleFrom(
                      elevation:15.0,
                      side:const BorderSide(color: color2)
                  ),
                  child: CustomButton("faux".toUpperCase(),
                    fontSize: 17.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Future dialogue(bool b)async{
    bool bonneReponse=(b==question!.reponse);
    String vrai="images/right.jpg";
    String faux="images/wrong.jpg";
    if(bonneReponse){
      score++;
    }
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return SimpleDialog(
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.zero
              ),
            ),
            title: Center(
              child: CustomButton(
                (bonneReponse)?"C'est gagné ":"Oups! perdue",
                color: (bonneReponse)?Colors.green[900]: Colors.red[500],
                textAlign: TextAlign.center,
              ),
            ),
            elevation: 10.0,
            contentPadding: const EdgeInsets.all(10.0),
            children: <Widget>[
              SizedBox(
                width:MediaQuery.of(context).size.width / 1.1  ,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width * 1.2,
                      child: Image.asset(
                        (bonneReponse)? vrai:faux,
                        fit: BoxFit.cover,
                      ),
                    ),
                    CustomText(question!.explication,factor: 1.0,fontSize: 17.0,textAlign: TextAlign.center),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                        questionSuivante();
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            color2
                        ),
                      ),
                      child: CustomButton(
                        "Suivant",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }
    );

  }
  void questionSuivante() {
    if(index < listeQuestion.length - 1){
      index++;
      setState(() {
        question=listeQuestion[index];
      });
    }else{
      alert();
    }
  }

  Future alert () async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: CustomButton(
              "C'est fini !",
              color: color3,
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero)
            ),
            content: CustomText(
                "Votre score $score / ${index + 1}"
            ),
            actions: <Widget>[
              ElevatedButton(

                onPressed: () {
                  Navigator.pop(buildContext);
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        color3
                    )
                ),
                child: CustomButton(
                  "ok".toUpperCase(),
                  color: Colors.white,
                  factor: 1.0,
                ),)
            ],
          );
        }
    );
  }

}