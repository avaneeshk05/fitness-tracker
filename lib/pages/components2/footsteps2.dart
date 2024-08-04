import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pedometer/pedometer.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp2> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  //late int stepstart=Pedometer.stepCountStream as int;
  int initial=0;
  int step2=0;
  String _status = '?', _steps = '?';
  int _counter1=0;
  int _counter2=0;
  int _ans=10;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = prefs.getInt('start') ?? 0;
      _counter2 = prefs.getInt('end') ?? 0;
    });
  }

  Future<void> _startCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = int.parse(_steps);
      prefs.setInt('start', _counter1);
    });
  }


  Future<void> _stopCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter2 = int.parse(_steps);//int.parse(Pedometer.stepCountStream);
      prefs.setInt('end', _counter2);
      _ans=prefs.getInt('start')!;
      prefs.setInt('ans', _counter2-_ans);
      _ans=_counter2-_ans;
      print(_ans);
    });
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pedometer'),
          backgroundColor: Colors.amberAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Steps Taken',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _steps,
                style: TextStyle(fontSize: 35),
              ),
              Divider(
                height: 50,
                thickness: 0,
                color: Colors.white,
              ),
              ElevatedButton(onPressed: _startCounter/*()async{
                stepstart=Pedometer.stepCountStream as int;
                initial=5;
                final SharedPreferences prefs = await _prefs;
                prefs.setInt('start', Pedometer.stepCountStream as int);
              }*/, child:Text(
                'Start',
                style: TextStyle(color: Colors.black),)),

              ElevatedButton(onPressed: _stopCounter/*()async{
                step2=Pedometer.stepCountStream as int;
                initial=step2-stepstart;
                //prefs.setInt('end', Pedometer.stepCountStream as int);
                print(initial);
              }*/, child:Text(
                'Stop',
                style: TextStyle(color: Colors.black),)),
              Text('$_ans',
                style: TextStyle(fontSize: 35),),
              Text(
                'Pedestrian Status',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                    ? Icons.accessibility_new
                    : Icons.error,
                size: 50,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? TextStyle(fontSize: 30)
                      : TextStyle(fontSize: 20, color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:pedometer/pedometer.dart';
//
// String formatDate(DateTime d) {
//   return d.toString().substring(0, 19);
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late Stream<StepCount> _stepCountStream;
//   late Stream<PedestrianStatus> _pedestrianStatusStream;
//   String _status = '?', _steps = '?';
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }
//
//   void onStepCount(StepCount event) {
//     print(event);
//     setState(() {
//       _steps = event.steps.toString();
//     });
//   }
//
//   void onPedestrianStatusChanged(PedestrianStatus event) {
//     print(event);
//     setState(() {
//       _status = event.status;
//     });
//   }
//
//   void onPedestrianStatusError(error) {
//     print('onPedestrianStatusError: $error');
//     setState(() {
//       _status = 'Pedestrian Status not available';
//     });
//     print(_status);
//   }
//
//   void onStepCountError(error) {
//     print('onStepCountError: $error');
//     setState(() {
//       _steps = 'Step Count not available';
//     });
//   }
//
//   void initPlatformState() {
//     _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
//     _pedestrianStatusStream
//         .listen(onPedestrianStatusChanged)
//         .onError(onPedestrianStatusError);
//
//     _stepCountStream = Pedometer.stepCountStream;
//     _stepCountStream.listen(onStepCount).onError(onStepCountError);
//
//     if (!mounted) return;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Pedometer Example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Steps Taken',
//                 style: TextStyle(fontSize: 30),
//               ),
//               Text(
//                 _steps,
//                 style: TextStyle(fontSize: 60),
//               ),
//               Divider(
//                 height: 100,
//                 thickness: 0,
//                 color: Colors.white,
//               ),
//               Text(
//                 'Pedestrian Status',
//                 style: TextStyle(fontSize: 30),
//               ),
//               Icon(
//                 _status == 'walking'
//                     ? Icons.directions_walk
//                     : _status == 'stopped'
//                     ? Icons.accessibility_new
//                     : Icons.error,
//                 size: 100,
//               ),
//               Center(
//                 child: Text(
//                   _status,
//                   style: _status == 'walking' || _status == 'stopped'
//                       ? TextStyle(fontSize: 30)
//                       : TextStyle(fontSize: 20, color: Colors.red),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//------------------------
// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:pedometer/pedometer.dart';
//
// String formatDate(DateTime d){
//   return d.toString().substring(0,19);
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late Stream<StepCount> _stepCount;
//   late Stream<PedestrianStatus> _pedStats;
//   String _status ='?', _steps ='?';
//
//   @override
//   void initState(){
//     super.initState();
//     initPlatformState();
//   }
//
//   void onStepCount(StepCount event) {
//     print(event);
//     setState(() {
//       _steps = event.steps.toString();
//     });
//   }
//
//   void onPedestrianStatusChanged(PedestrianStatus event) {
//     print(event);
//     setState(() {
//       _status = event.status;
//     });
//   }
//
//   void onPedestrianStatusError(error) {
//     print('onPedestrianStatusError: $error');
//     setState(() {
//       _status = 'Pedestrian Status not available';
//     });
//     print(_status);
//   }
//
//   void onStepCountError(error) {
//     print('onStepCountError: $error');
//     setState(() {
//       _steps = 'Step Count not available';
//     });
//   }
//
//   void initPlatformState(){
//     _pedStats=Pedometer.pedestrianStatusStream;
//     _pedStats.listen(onPedestrianStatusChanged).onError(onStepCountError);
//
//     if(!mounted) return;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home:Scaffold(
//         appBar: AppBar(
//           title: const Text('Daily Steps',
//           style: TextStyle(color:Colors.black)),
//           backgroundColor: Colors.blue,
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Steps Taken',
//                 style: TextStyle(fontSize: 30),
//               ),
//               Text(
//                 _steps,
//                 style: TextStyle(fontSize: 60),
//               ),
//               Divider(
//                 height: 100,
//                 thickness: 0,
//                 color: Colors.white,
//               ),
//               Text(
//                 'Pedestrian Status',
//                 style: TextStyle(fontSize: 30),
//               ),
//               Icon(
//                 _status == 'walking'
//                     ? Icons.directions_walk
//                     : _status == 'stopped'
//                     ? Icons.accessibility_new
//                     : Icons.error,
//                 size: 100,
//               ),
//               Center(
//                 child: Text(
//                   _status,
//                   style: _status == 'walking' || _status == 'stopped'
//                       ? TextStyle(fontSize: 30)
//                       : TextStyle(fontSize: 20, color: Colors.red),
//                 ),
//               )
//             ],
//           ),
//         ),
//
//       ),
//         );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'dart:async';
// // import 'package:percent_indicator/circular_percent_indicator.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:pedometer/pedometer.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatefulWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //   String showSteps="";
// //   String _km= "unknown";
// //   String _calories ="Unknown";
// //   String _stepCountValue="Unknown";
// //   StreamSubscription<int> _subscription;
// //
// //   double _stepsNo;
// //   double _kmx;
// //   double burned;
// //
// //   @override
// //   void initState()
// //   {
// //     super.initState();
// //     setUpPedometer();
// //   }
// //
// //   void setUpPedometer()
// //   {
// //     Pedometer pedometer =new Pedometer();
// //     _subscription=Pedometer.stepCountStream.listen(onData,
// //         onError: _onError,
// //         onDone: _onDone,
// //         cancelOnError: true
// //     ) as StreamSubscription<int>;
// //   }
// //
// //   void _onDone(){}
// //
// //   void _onError(error){
// //     print("Flutter Pedometer Error: $error");
// //   }
// //
// //   void _onData(int stepCountValue) async {
// //     print(stepCountValue);
// //     setState(() {
// //       _stepCountValue = "$stepCountValue";
// //       print(_stepCountValue);
// //     });
// //
// //     var distance=stepCountValue;
// //     double y=(distance+.0);
// //
// //     setState(() {
// //       _stepsNo=y;
// //     });
// //
// //     var long3=(_stepsNo/100);
// //     long3= num.parse(y.toStringAsFixed(4));
// //     long3=(long3/100);
// //     getDistanceRun(_stepsNo);
// //   }
// //
// //   void getDistanceRun(double _stepsNo){
// //       var distance = ((_stepsNo * 78)/100000);
// //       distance=num.parse(distance.toString(2));
// //       setState(() {
// //         _km="$distance";
// //       });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
