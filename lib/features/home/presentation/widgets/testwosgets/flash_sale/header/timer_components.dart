import 'package:flutter/material.dart';
import 'dart:async';

class TimerComponents extends StatefulWidget {
  const TimerComponents({super.key});

  @override
  State<TimerComponents> createState() => _TimerComponentsState();
}

class _TimerComponentsState extends State<TimerComponents> {
  late Timer _timer;
  Duration _remainingTime = const Duration(hours: 2); // Set your duration here

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds <= 0) {
        _timer.cancel();
      } else {
        setState(() {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours.remainder(24));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final parts = _formatDuration(_remainingTime).split(':');
    final hours = parts[0];
    final minutes = parts[1];
    final seconds = parts[2];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Closing in : ", style: TextStyle(fontSize: 10)),
        _TimeContainer(time: hours),
        const Text(" : ", style: TextStyle(fontSize: 10)),
        _TimeContainer(time: minutes),
        const Text(" : ", style: TextStyle(fontSize: 10)),
        _TimeContainer(time: seconds),
      ],
    );
  }
}

class _TimeContainer extends StatelessWidget {
  final String time;

  const _TimeContainer({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Text(time, style: const TextStyle(fontSize: 10)),
    );
  }
}
