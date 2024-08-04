import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExercisePage2 extends StatefulWidget {
  @override
  _ExercisePage2State createState() => _ExercisePage2State();
}

class _ExercisePage2State extends State<ExercisePage2> {
  int _selectedDay = 1;
  final List<Map<String, dynamic>> _workouts = [
    {
      'day': 1,
      'exercises': [
        {'name': 'Wall Push-ups-10', 'done': false},
        {'name': 'Toe taps-10', 'done': false},
      ],
    },
    {
      'day': 2,
      'exercises': [
        {'name': 'Knee lifts - 10', 'done': false},
        {'name': 'Planks-3 sets of 30 seconds each', 'done': false},
      ],
    },
    {
      'day': 3,
      'exercises': [{'name': 'Push-ups-10', 'done': false},
        {'name': 'Jumping jacks-10', 'done': false},],
    },
    {
      'day': 4,
      'exercises': [{'name': 'Planks-3 sets of 30 seconds each', 'done': false},
        {'name': 'Squats-10', 'done': false},],
    },
    {
      'day': 5,
      'exercises': [{'name': 'Lounges-10 each side', 'done': false},
        {'name': 'Wall push ups-10', 'done': false},],
    },
    {
      'day': 6,
      'exercises': [{'name': 'Push-ups-10', 'done': false},
        {'name': 'Russian twist-15', 'done': false},],
    },
    {
      'day': 7,
      'exercises': [{'name': 'Push-ups-10', 'done': false},
        {'name': 'Hollow hold-20 counts', 'done': false},],
    },
    {
      'day': 8,
      'exercises': [{'name': 'Bicycle crunch-10', 'done': false},
        {'name': 'Planks-3 sets of 30 seconds each', 'done': false},],
    },
    {
      'day': 9,
      'exercises': [{'name': 'Push-ups-10', 'done': false},
        {'name': 'Planks-3 sets of 30 seconds each', 'done': false},],
    },
    {
      'day': 10,
      'exercises': [{'name': 'Dead bug-10 counts', 'done': false},
        {'name': 'Bicycle crunch-10', 'done': false},],
    },
    {
      'day': 11,
      'exercises': [{'name': 'Push-ups-15', 'done': false},
        {'name': 'Sit ups-15', 'done': false},],
    },
    {
      'day': 12,
      'exercises': [{'name': 'Push-ups-15', 'done': false},
        {'name': 'Planks-3 sets of 40 seconds each', 'done': false},],
    },
    {
      'day': 13,
      'exercises': [{'name': 'Push-ups-15', 'done': false},
        {'name': 'Jumping jacks-15', 'done': false},],
    },
    {
      'day': 14,
      'exercises': [{'name': 'Planks-3 sets of 40 seconds each', 'done': false},
        {'name': 'Squats-15', 'done': false},],
    },
    {
      'day': 15,
      'exercises': [{'name': 'Lounges-15 each side', 'done': false},
        {'name': 'Wall push ups-15', 'done': false},],
    },
    {
      'day': 16,
      'exercises': [{'name': 'Push-ups-15', 'done': false},
        {'name': 'Russian twist-25', 'done': false},],
    },
    {
      'day': 17,
      'exercises': [{'name': 'Push-ups-15', 'done': false},
        {'name': 'Hollow hold-30 counts', 'done': false},],
    },
    {
      'day': 18,
      'exercises': [{'name': 'Bicycle crunch-15', 'done': false},
        {'name': 'Planks-3 sets of 40 seconds each', 'done': false},],
    },
    {
      'day': 19,
      'exercises': [{'name': 'Push-ups-15', 'done': false},
        {'name': 'Planks-3 sets of 40 seconds each', 'done': false},],
    },
    {
      'day': 20,
      'exercises': [{'name': 'Dead bug-15 counts', 'done': false},
        {'name': 'Bicycle crunch-15', 'done': false},],
    },
    {
      'day': 21,
      'exercises': [{'name': 'Push-ups-20', 'done': false},
        {'name': 'Sit ups-20', 'done': false},],
    },
    {
      'day': 22,
      'exercises': [{'name': 'Push-ups-20', 'done': false},
        {'name': 'Planks-3 sets of 50 seconds each', 'done': false},],
    },
    {
      'day': 23,
      'exercises': [{'name': 'Push-ups-20', 'done': false},
        {'name': 'Jumping jacks-20', 'done': false},],
    },
    {
      'day': 24,
      'exercises': [{'name': 'Planks-3 sets of 50 seconds each', 'done': false},
        {'name': 'Squats-20', 'done': false},],
    },
    {
      'day': 25,
      'exercises': [{'name': 'Lounges-20 each side', 'done': false},
        {'name': 'Wall push ups-20', 'done': false},],
    },
    {
      'day': 26,
      'exercises': [{'name': 'Push-ups-20', 'done': false},
        {'name': 'Russian twist-30', 'done': false},],
    },
    {
      'day': 27,
      'exercises': [{'name': 'Push-ups-20', 'done': false},
        {'name': 'Hollow hold-30 counts', 'done': false},],
    },
    {
      'day': 28,
      'exercises': [{'name': 'Bicycle crunch-20', 'done': false},
        {'name': 'Planks-3 sets of 50 seconds each', 'done': false},],
    },
    {
      'day': 29,
      'exercises': [{'name': 'Push-ups-20', 'done': false},
        {'name': 'Planks-3 sets of 50 seconds each', 'done': false},],
    },
    {
      'day': 30,
      'exercises': [{'name': 'Dead bug-20 counts', 'done': false},
        {'name': 'Bicycle crunch-20', 'done': false},],
    },
  ];

  List<Map<String, dynamic>> _selectedExercises = [];
  Map<int, bool> _isDayDoneMap = {};
  Map<String, bool> _exerciseCompletionStatusMap = {};

  @override
  void initState() {
    super.initState();
    _loadCompletionStatus();
    _loadExercisesForSelectedDay();
    clearSharedPreferences();
  }

  void clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  void _loadCompletionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _workouts.forEach((workout) {
      bool isDayDone = prefs.getBool('${workout['day']}') ?? false;
      _isDayDoneMap[workout['day']] = isDayDone;
    });
  }

  void _loadExercisesForSelectedDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedExercises = _workouts.firstWhere(
          (workout) => workout['day'] == _selectedDay,
      orElse: () => {'day': _selectedDay, 'exercises': []},)['exercises'];

    _selectedExercises.forEach((exercise) {
      String key = '$_selectedDay${exercise['name']}';
      bool completionStatus = prefs.getBool(key) ?? false;
      _exerciseCompletionStatusMap[key] = completionStatus;
    });

    setState(() {});
  }

  void _updateExerciseCompletionStatus(String name, bool done) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = '$_selectedDay$name';
    prefs.setBool(key, done);
    _exerciseCompletionStatusMap[key] = done;
    bool allExercisesCompleted = _selectedExercises.every((exercise) =>
    _exerciseCompletionStatusMap['$_selectedDay${exercise['name']}'] ?? false);
    _isDayDoneMap[_selectedDay] = allExercisesCompleted;
    prefs.setBool('$_selectedDay', allExercisesCompleted);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Workout Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow.shade200, Colors.yellow.shade700],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 6,
                shrinkWrap: true,
                children: List.generate(30, (index) {
                  int day = index + 1;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedDay = day;
                        _loadExercisesForSelectedDay();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _isDayDoneMap[day] ?? false ? Colors.green : Colors.grey,
                          width: 2,
                        ),
                        color: _isDayDoneMap[day] ?? false ? Colors.green[100] : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: EdgeInsets.all(4),
                      child: Center(
                        child: Text(
                          day.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedExercises.length,
                itemBuilder: (context, i) {
                  final exercise = _selectedExercises[i];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          exercise['name'],
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(
                            (_exerciseCompletionStatusMap['$_selectedDay${exercise['name']}'] ?? false)
                                ? Icons.done
                                : Icons.close,
                            color: (_exerciseCompletionStatusMap['$_selectedDay${exercise['name']}'] ?? false)
                                ? Colors.green
                                : Colors.red,
                          ),
                          onPressed: () async {
                            bool newStatus = !(_exerciseCompletionStatusMap['$_selectedDay${exercise['name']}'] ?? false);
                            setState(() {
                              _exerciseCompletionStatusMap['$_selectedDay${exercise['name']}'] = newStatus;
                            });
                            _updateExerciseCompletionStatus(exercise['name'], newStatus);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
