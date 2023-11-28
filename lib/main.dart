import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController radiusController = TextEditingController();
  TextEditingController sideLengthController = TextEditingController();
  TextEditingController baseController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  double circleArea = 0.0;
  double triangleArea = 0.0;
  double squareArea = 0.0;

  void calculateArea() {
    double radius = double.tryParse(radiusController.text) ?? 0.0;
    double sideLength = double.tryParse(sideLengthController.text) ?? 0.0;
    double base = double.tryParse(baseController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    setState(() {
      circleArea = 3.14 * radius * radius;
      triangleArea = 0.5 * sideLength * height;
      squareArea = base * height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('โปรแกรมคำนวณพื้นที่ของนารีรัตน์'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purpleAccent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'วงกลม',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: radiusController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'รัศมี',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        calculateArea();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.purpleAccent), // เปลี่ยนสีพื้นหลังที่นี่
                      ),
                      child: Text('คำนวณพื้นที่'),
                    ),
                    SizedBox(height: 8.0),
                    Text('พื้นที่: $circleArea'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pinkAccent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'สามเหลี่ยม',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: sideLengthController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'ความยาวด้าน',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'ความสูง',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        calculateArea();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.pinkAccent), // เปลี่ยนสีพื้นหลังที่นี่
                      ),
                      child: Text('คำนวณพื้นที่'),
                    ),
                    SizedBox(height: 8.0),
                    Text('พื้นที่: $triangleArea'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'สี่เหลี่ยม',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: baseController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'ความยาวฐาน',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'ความสูง',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        calculateArea();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.greenAccent), // เปลี่ยนสีพื้นหลังที่นี่
                      ),
                      child: Text('คำนวณพื้นที่'),
                    ),
                    SizedBox(height: 8.0),
                    Text('พื้นที่: $squareArea'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
