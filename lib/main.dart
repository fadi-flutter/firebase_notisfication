import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_fcm/green_screen.dart';
import 'package:flutter_fcm/red_screen.dart';
import 'package:flutter_fcm/send_screen.dart';

// Future<void> getbackgroundMessages(RemoteMessage message) async {
//   log(message.data.toString());
//   log(message.notification!.title.toString());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // NotificationChannal.initialize();
  await Firebase.initializeApp();

  //this is used for FirebaseMessaging.onMessageOpenedApp working properly
  // FirebaseMessaging.onBackgroundMessage(getbackgroundMessages);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SendScreen(),
        'red': (context) => const RedScreen(),
        'green': (context) => const GreenScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  // void initState() {
  //   super.initState();
  //   //when app is permanently terminated or not in background
  //   FirebaseMessaging.instance.getInitialMessage().then((message) async {
  //     if (message != null) {
  //       final routefromMessage = await message.data['route'];
  //       Navigator.pushNamed(context, routefromMessage);
  //     }
  //   });
  //   //for foreGround notifications or when app is opened
  //   FirebaseMessaging.onMessage.listen((message) {
  //     if (message.notification != null) {
  //       log(message.notification!.title.toString());
  //       log(message.notification!.body.toString());

  //       NotificationChannal.send(message);
  //     }
  //   });
  //   // for background notifications or when app is in background
  //   FirebaseMessaging.onMessageOpenedApp.listen((message) async {
  //     final routefromMessage = await message.data['route'];
  //     Navigator.pushNamed(context, routefromMessage);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'You will recieve a message soon',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
