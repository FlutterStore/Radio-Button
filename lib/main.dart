import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int curr = 0;

  List age = [
    '0 - 9',
    '10 - 19',
    '20 - 29',
    '30 - 39',
    '40 - 49',
    '50 - 59',
    '60 - 69',
    '70 - 80',
  ];

  String yourage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Radio Button",style: TextStyle(fontSize: 15),),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 18,top: 20),
              child: Text("Select Age Group",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.7,
              child: ListView.builder(
                itemCount: age.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    title: Text(age[index]),
                    value: index+1, 
                    groupValue: curr, 
                    onChanged: (value){
                      setState(() {
                        curr= int.parse(value.toString());
                        yourage = age[index];
                      });
                    },
                  );
                },
              )
            ),
            Center(
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1(yourage: yourage,),));
                  }, 
                  child: const Text("Save")
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatefulWidget {
  Screen1({super.key,required this.yourage});

  String yourage;

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Age Group',style: TextStyle(fontSize: 15),),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text("1",style: const TextStyle(color: Colors.black),),
              backgroundColor: Colors.green.withOpacity(0.2),
            ),
            title: Text('Your age group is between ${widget.yourage}'),
          ),
        ],
      ),
    );
  }
}
