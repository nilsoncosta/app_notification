import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _checkbox = false;
  String time = "";

  @override
  void initState() {
    Timer mytimer = Timer.periodic(Duration(seconds: 12), (timer) {
      DateTime timenow = DateTime.now(); //get current date and time
      time = timenow.hour.toString() +
          ":" +
          timenow.minute.toString() +
          ":" +
          timenow.second.toString();
      if (_checkbox) {
        NotificationService.showNotification(
          title: "Venda Aprovada!",
          body: "Sua comissão R\$ 134.000.000,23",
        );
        setState(() {});
      } else {}
      //mytimer.cancel() //to terminate this timer
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Kiwify')),
        backgroundColor: Colors.green.shade300,
      ),
      backgroundColor: Colors.green.shade100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/ic_launcher.png')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _checkbox,
                onChanged: (value) {
                  setState(() {
                    _checkbox = !_checkbox;
                  });
                },
              ),
              Text('Enviar Notificações'),
            ],
          ),
          Center(child: Text(time)),
        ],
      ),
    );
  }
}
