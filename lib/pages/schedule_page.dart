import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/schedule_model.dart';
import '../widgets/app_card.dart';

class SchedulePage extends StatefulWidget {
  final UserData user;

  const SchedulePage({
    super.key,
    required this.user,
  });

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  double amount = 50;

  String formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} น.';
  }

  Future<void> addSchedule() async {
    final time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 8, minute: 0),
    );

    if (time == null) return;

    setState(() {
      widget.user.schedules.add(
        FeedSchedule(
          time: formatTime(time),
          amount: amount.toInt(),
        ),
      );
    });
  }

  void runSchedule(FeedSchedule schedule) {
    if (!schedule.enabled) {
      showMessage('รอบนี้ปิดใช้งานอยู่');
      return;
    }

    if (widget.user.foodInTank <= 0) {
      showMessage('อาหารหมด กรุณาเติมอาหาร');
      return;
    }

    if (widget.user.foodInTank < schedule.amount) {
      showMessage(
        'ปริมาณอาหารไม่เพียงพอ เหลือ ${widget.user.foodInTank} กรัม',
      );
      return;
    }

    setState(() {
      widget.user.foodInTank -= schedule.amount;
      widget.user.history.insert(
        0,
        '${schedule.time} ให้อาหาร ${schedule.amount} กรัม',
      );
    });

    showMessage('จ่ายอาหาร ${schedule.amount} กรัมแล้ว');
  }

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EC),
      appBar: AppBar(title: const Text('ตั้งเวลาให้อาหาร')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          AppCard(
            child: Column(
              children: [
                const Text(
                  'กำหนดปริมาณสำหรับรอบใหม่',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${amount.toInt()} กรัม',
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Slider(
                  value: amount,
                  min: 10,
                  max: 1000,
                  divisions: 99,
                  activeColor: Colors.orange,
                  onChanged: (value) {
                    setState(() {
                      amount = value;
                    });
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: addSchedule,
                    icon: const Icon(Icons.add_alarm),
                    label: const Text('เพิ่มเวลาให้อาหาร'),
                  ),
                ),
              ],
            ),
          ),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'รายการเวลาที่ตั้งไว้',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                if (widget.user.schedules.isEmpty)
                  const Text('ยังไม่มีการตั้งเวลา')
                else
                  ...widget.user.schedules.asMap().entries.map((entry) {
                    final index = entry.key;
                    final schedule = entry.value;

                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.alarm, color: Colors.orange),
                        title: Text(schedule.time),
                        subtitle: Text('ปริมาณ ${schedule.amount} กรัม'),
                        trailing: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Switch(
                              value: schedule.enabled,
                              activeColor: Colors.orange,
                              onChanged: (value) {
                                setState(() {
                                  schedule.enabled = value;
                                });
                              },
                            ),
                            IconButton(
                              onPressed: () => runSchedule(schedule),
                              icon: const Icon(Icons.play_arrow, color: Colors.green),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.user.schedules.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}