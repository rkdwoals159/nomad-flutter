import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 3;
  int totalSeconds = twentyFiveMinutes;
  late Timer timer;
  bool isRunning = false;
  int totalPomodoros = 0;

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros++;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds--;
      });
    }
  }

  void onStartPressed() {
    setState(() {
      isRunning = !isRunning;
    });
    setState(() {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        onTick,
      );
    });
  }

  void onPausePressed() {
    setState(() {
      timer.cancel();
      isRunning = !isRunning;
    });
  }

  void onStopPressed() {
    setState(() {
      timer.cancel();
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
      totalPomodoros = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline,
                  ),
                  color: Theme.of(context).cardColor,
                  iconSize: 128,
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                ),
                Visibility(
                  visible: isRunning,
                  child: IconButton(
                    icon: const Icon(Icons.stop_circle_outlined),
                    color: Theme.of(context).cardColor,
                    iconSize: 128,
                    onPressed: onStopPressed,
                  ),
                ),
              ],
            )),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodors',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
