import 'package:flutter/material.dart';

void main() {
  tasks();
}

void  tasks() async {
  task1();
  task2();
  String data = await task2();
  task3(data);
}
void task1() {
  print('task1 done');
}

Future<String> task2() async
{
  Duration threeSeconds = Duration(seconds: 3);
  String result;
 await Future.delayed(threeSeconds, () {
    print('task two done!');
    result = 'task 2';
  });
  return result;
}

void task3(dataFromTask2)
{
  print('task 3 done! with data of $dataFromTask2');
}
