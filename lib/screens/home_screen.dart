import 'package:flutter/material.dart';
import 'package:onesignal/services/notification_service.dart';
import 'package:onesignal/services/user_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _tBoxCtrl = TextEditingController();
  String? _uid;

  Future<void> _getUser() async {
    _uid = await UserService().getUser();
    setState(() {});
  }

  @override
  void initState() {
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _uid == null
            ? const CircularProgressIndicator(color: Colors.white)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Bildirim metni giriniz",
                          hintStyle: TextStyle(color: Colors.white)),
                      controller: _tBoxCtrl,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => NotificationService()
                          .sendSpesificNotification(
                              uid: _uid!,
                              message: _tBoxCtrl.text.isEmpty
                                  ? "Test Bildirimi"
                                  : _tBoxCtrl.text),
                      child: const Text("Ömer'e bildirim gönder"))
                ],
              ),
      ),
    );
  }
}
