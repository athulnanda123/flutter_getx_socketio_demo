import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:socketio_demo/app/data/helpers.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text(
          'Socket.IO Demo By Athul Nandaswaroop',
          style: getGTextStyle(fz: 20, fw: FontWeight.w800, c: Colors.white54),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Message something to Server',
              style:
                  getGTextStyle(fz: 15, fw: FontWeight.w500, c: Colors.black),
            ),
            Container(
              alignment: Alignment.center,
              width: 0.75 * Get.width,
              height: 100,
              child: TextField(
                controller: controller.messageInputController,
                decoration: const InputDecoration(
                  hintText: 'Type your message here...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueGrey.shade900)),
              onPressed: () {
                if (controller.messageInputController.text.trim().isNotEmpty) {
                  controller.sendMessage();
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 50,
                child: Text(
                  'Send',
                  style: getGTextStyle(
                      fz: 15, fw: FontWeight.w500, c: Colors.white70),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
