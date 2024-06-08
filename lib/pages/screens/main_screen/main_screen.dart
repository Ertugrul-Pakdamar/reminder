import 'package:flutter/material.dart';
import 'package:reminder_app/pages/screens/reminders/reminders_page.dart';
import 'package:reminder_app/pages/screens/routine_reminders/routine_reminders_page.dart';
import 'clock_widgets.dart';
import 'package:http/http.dart' as http;

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainAppState();
}

class MainAppState extends State {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBarWidget(),
        body: <Widget>[
          homePageWidet(),
          RoutineRemindersPage(),
          RemindersPage()
        ][currentPageIndex]);
  }

  Widget homePageWidet() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        welcomeCardWidget(),
        SizedBox(
          height: 10,
        ),
        ClockWidgets().analogClockWidget(),
        ClockWidgets().digitalClockWidget(),
        Expanded(child: SizedBox()),
      ],
    );
  }

  Widget NavigationBarWidget() {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      indicatorColor: Colors.amber,
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home, color: Color(0xff614151)),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.history, color: Color(0xff614151)),
          icon: Icon(Icons.history_outlined),
          label: 'Routines',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.notifications, color: Color(0xff614151)),
          icon: Icon(Icons.notifications_outlined),
          label: 'Reminders',
        ),
      ],
    );
  }

  Widget welcomeCardWidget() {
    return Card(
      child: Text(
        "Welcome",
        style: TextStyle(fontSize: 30),
      ),
      color: Colors.amber,
    );
  }
}