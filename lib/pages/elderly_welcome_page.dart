import 'package:flutter/material.dart';
import 'components2/diet2.dart';
import 'components2/exercises2.dart';
import 'components2/footsteps2.dart';

class ElderlyWelcomePage extends StatefulWidget {
  final String name;

  ElderlyWelcomePage({required this.name});

  @override
  _ElderlyWelcomePage createState() => _ElderlyWelcomePage();
}

class _ElderlyWelcomePage extends State<ElderlyWelcomePage> {
  @override
  Widget build(BuildContext context) {
    String profilePicture = 'assets/profile.jpg';
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Container(
        color: Colors.yellow[200],
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(profilePicture),
                    radius: 30,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Welcome, ${widget.name}!',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Get started with your health and fitness journey.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNavigableImage('assets/diet.jpg', 'DIET', DietPage2()),
                  SizedBox(height: 20),
                  _buildNavigableImage(
                      'assets/exercises.jpg', 'EXERCISE', ExercisePage2()),
                  SizedBox(height:20),
                  _buildNavigableImage(
                      'assets/footsteps.jpg', 'FOOTSTEPS', MyApp2()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buildNavigableImage(String assetName, String text,
      Widget destination) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Stack(
        children: [
          Image.asset(
            assetName,
            height: 120,
            width: 200,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.black.withOpacity(0.5),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}