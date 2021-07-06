import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  //const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //Definition des variables
  int currenteQuestion = 0;
  int score = 0;
  var quiz = [
    {
      'title': "Question 1",
      "answers": [
        {"answer": "Answer 11", "correct": false},
        {"answer": "Answer 12", "correct": true},
        {"answer": "Answer 13", "correct": false}
      ]
    },
    {
      'title': "Question 2",
      "answers": [
        {"answer": "Answer 21", "correct": false},
        {"answer": "Answer 22", "correct": true},
        {"answer": "Answer 33", "correct": false}
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
      ),
      body:
      (this.currenteQuestion>= quiz.length)?
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('votre score est de: ${(100*score/quiz.length).round()}%',
                  style:  TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      letterSpacing: 0.5),
                ),
                SizedBox(height: 20,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[900],
                  ),
                  onPressed: (){
                    setState(() {
                      this.currenteQuestion = 0;
                      this.score = 0;
                    });
                },
                child: Text('Restart',
                 style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5),
                ),
                )
              ],
            ),
          )
      : ListView(
        children: [
          ListTile(
            title: Center(
              child: Text(
                'Question ${currenteQuestion + 1}/${quiz.length}',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    letterSpacing: 0.5),
              ),
            ),
          ),
          ListTile(
            title: Text(
              quiz[currenteQuestion]['title'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...(quiz[currenteQuestion]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return ListTile(
              title: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[900],
                ),
                onPressed: () {
                  setState(() {
                    if(answer['correct'] == true) {++score;}
                    ++this.currenteQuestion;
                  });
                },
                child: Text(
                  answer['answer'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
