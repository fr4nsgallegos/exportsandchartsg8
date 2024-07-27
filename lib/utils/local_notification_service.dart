import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // const DarwinInitializationSettings initializationSettingsIos =
  //     DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingAndroid,
    // iOS: initializationSettingsIos,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> mostrarNotificacion() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    "channe_id",
    "channel_name",
    importance: Importance.max,
    priority: Priority.high,
    // showWhen: false,
  );

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    "Título de notificación",
    "Esto es una prueba de notificaion local ",
    notificationDetails,
  );
}
