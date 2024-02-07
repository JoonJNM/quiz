import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0; // เพิ่มตัวแปรเก็บคะแนน

  List<Map<String, dynamic>> questions = [
    {
      "question": "1.ประเทศใดมีพื้นที่ทะเลสีท้องถิ่นมากที่สุดในโลก?",
      "options": [" ออสเตรเลีย ", " แคนาดา ", " สหรัฐอเมริกา ", " โรสเซีย "],
      "correctAnswer": 2
    },
    {
      "question": "2.ทวีปใดมีพื้นที่เล็กที่สุดในโลก?",
      "options": [" ออสเตรเลีย ", " ยุโรป ", " แอฟริกา ", " อินเดีย "],
      "correctAnswer": 1
    },
    {
      "question": "3.ภูมิศาสตร์ทางธรรมชาติมีผลต่อวัฒนธรรมได้อย่างไร?",
      "options": [" มีผลต่อพันธุกรรม ", " มีผลต่อการเปลี่ยนแปลงสภาพภูมิอากาศ ", " มีผลต่อการเกิดสถานที่ประวัติศาสตร์ ", " มีผลต่อการเคลื่อนย้ายประชากร "],
      "correctAnswer": 2
    },
    {
      "question": "4.ทวีปใดที่เป็นที่ที่มีประชากรมากที่สุดในโลก?",
      "options": [" แอฟริกา ", " เอเชีย ", " ยุโรป ", "  อเมริกา "],
      "correctAnswer": 1
    },
    {
      "question": "5.สายลมที่นำความชื้นจากมหาสมุทรไปยังฝั่งทะเลมากที่สุดในโลกคือ?",
      "options": [" มอนซูน ", " พาสาที ", " สามารถ ", " ทราด "],
      "correctAnswer": 0
    },
    {
      "question": "6.ภูมิศาสตร์ของประเทศมีผลต่อ?",
      "options": [" ประชากร ", " ประเทศและวัฒนธรรม ", " ภูมิอากาศ ", " ภูมิสังคม "],
      "correctAnswer": 1
    },
    {
      "question": "7.ทวีปใดมีเส้นรอบนอกที่ยาวที่สุดในโลก?",
      "options": [" อเมริกา ", " แอฟริกา ", " เอเชีย ", " ยุโรป "],
      "correctAnswer": 3
    },
    {
      "question": "8.ลักษณะภูมิศาสตร์ของสนามบินมีผลต่อ?",
      "options": [" เศรษฐกิจ ", " วัฒนธรรม ", " การท่องเที่ยว ", " ทรัพยากรธรรมชาติ "],
      "correctAnswer": 2
    },
    {
      "question": "9.หากมีการนำน้ำไปใช้ในการเกษตรกรรมมากเกินไป จะส่งผลต่อ?",
      "options": [" ภูมิอากาศ ", " การเกิดน้ำตก ", " ทรัพยากรน้ำ ", " การเกิดอุทกภัย "],
      "correctAnswer": 2
    },
    {
      "question": "10.สายลมที่นำความหนาแน่นของความชื้นจากฝั่งทะเลไปยังภูมิภาคอยู่ทางตะวันออกของทวีปอเมริกาเหนือคือ?",
      "options": [" สามารถ ", " แมนซูน ", " โบรานซ์ ", " แคนาดา "],
      "correctAnswer": 3
    },
    // เพิ่มคำถามต่อไปตามต้องการ
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Text(
      questions[currentQuestionIndex]["question"],
      style: TextStyle(fontSize: 20.0),
    ),
    SizedBox(height: 20.0),
    ...(questions[currentQuestionIndex]["options"] as List<String>).map((option) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: OutlinedButton(
          onPressed: () {
            checkAnswer(option);
          },
          style: ButtonStyle(
            side: MaterialStateProperty.resolveWith<BorderSide>(
              (Set<MaterialState> states) {
                return BorderSide(
                  color: states.contains(MaterialState.pressed) ? Colors.grey : Theme.of(context).primaryColor,
                  width: 2.0,
                );
              },
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(option),
          ),
        ),
      );
    }).toList(),
    SizedBox(height: 20.0),
    ElevatedButton(
      onPressed: nextQuestion,
      child: Text('Next'),
    ),
  ],
),

      ),
    );
  }

 void checkAnswer(String selectedOption) {
  int correctAnswerIndex = questions[currentQuestionIndex]["correctAnswer"];
  if (selectedOption == questions[currentQuestionIndex]["options"][correctAnswerIndex]) {
    setState(() {
      correctAnswers++; // เพิ่มคะแนนเมื่อตอบถูก
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Correct!'),
          content: Text('Your answer is correct.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                goToNextQuestion();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Incorrect!'),
          content: Text('Your answer is incorrect.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                goToNextQuestion(); // ไปยังคำถามถัดไปโดยไม่เพิ่มคะแนน
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}


  void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('End of Quiz'),
              content: Text('You have finished the quiz. Your score: $correctAnswers/10'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('End of Quiz'),
              content: Text('You have finished the quiz. Your score: $correctAnswers/10'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }
}