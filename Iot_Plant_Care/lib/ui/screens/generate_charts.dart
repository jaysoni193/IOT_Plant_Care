import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
class DataGraph extends StatefulWidget {
  const DataGraph({Key? key}) : super(key: key);

  @override
  State<DataGraph> createState() => _DataGraphState();
}

class _DataGraphState extends State<DataGraph> {
  List<Map<String,dynamic>> Moisure = [
    {'Day':'Sun','Moisure': 90},
    {'Day':'Mon','Moisure': 80},
    {'Day':'Tue','Moisure': 60},
    {'Day':'Wed','Moisure': 78},
    {'Day':'Thu','Moisure': 86},
    {'Day':'Fri','Moisure': 98},
    {'Day':'Sat','Moisure': 58},
  ];
  List<Map<String,dynamic>>  Temperature= [
    {'Day':'Sun','Temperature': 95},
    {'Day':'Mon','Temperature': 85},
    {'Day':'Tue','Temperature': 65},
    {'Day':'Wed','Temperature': 76},
    {'Day':'Thu','Temperature': 86},
    {'Day':'Fri','Temperature': 88},
    {'Day':'Sat','Temperature': 58},
  ];
  List<Map<String,dynamic>> Humidity = [
    {'Day':'Sun','Humidity': 95},
    {'Day':'Mon','Humidity': 85},
    {'Day':'Tue','Humidity': 65},
    {'Day':'Wed','Humidity': 76},
    {'Day':'Thu','Humidity': 86},
    {'Day':'Fri','Humidity': 88},
    {'Day':'Sat','Humidity': 58},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Graph'),),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AspectRatio(aspectRatio: 16/9,
          child: DChartLine(
            data : [
              {
                'id' : 'Moisure',
                'data' : Moisure.map((e) {
                  return{
                    'domain': e['day'] - 2000,'measure':e['Moisure']
                  };
                }).toList(),
              },
              {
                'id' : 'Temperature',
                'data' : Temperature.map((e) {
                  return{
                    'domain': e['day'] - 2000,'measure':e['Temperature']
                  };
                }).toList(),
              },
              {
                'id' : 'Humidity',
                'data' : Humidity.map((e) {
                  return{
                    'domain': e['day'] - 2000,'measure':e['Humidity']
                  };
                }).toList(),
              }
            ], lineColor: (lineData, index,  id) {
              if (id == 'Moisure'){
                return Colors.blue;
              }
              if (id == 'Temperature'){
                return Colors.red;
              }
              else{
                return Colors.green;
              }
          },
          ),
          )
        ],
      ),
    );
  }
}
