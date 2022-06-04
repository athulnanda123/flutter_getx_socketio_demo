import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socketio_demo/app/data/helpers.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  late IO.Socket socket;
  final TextEditingController messageInputController = TextEditingController();

  var response = "".obs;

  @override
  void onInit() {
    super.onInit();

    socket = IO.io('http://127.0.0.1:8000',
        IO.OptionBuilder().setTransports(['polling', 'websocket']).build());
    connectSocket();
  }

  sendMessage() {
    socket.emit('message', messageInputController.text.trim());
    messageInputController.clear();
  }

  connectSocket() {
    socket.onConnect((data) => print('Connection established'));
    socket.onConnectError((data) => print('Connect Error: $data'));
    socket.onDisconnect((data) => print('Socket.IO server disconnected'));
    socket.on(
      'response',
      (data) {
        response.value = data;

        pushSnack(t: "Awesome... Server given a response", d: data);
      },
    );
  }
}
