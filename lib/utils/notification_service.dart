import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

class NotificationService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static Logger logger = Logger();

  static Future<void> initMessaging() async {
    String token = await firebaseMessaging.getToken() ?? "-";
    print("TOKEN: $token");
    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  //DETECTAR EL MENSAJE CUANDO EL APP ESTA ABIERTO
  static _onMessage(RemoteMessage message) {
    if (message.notification != null) {
      logger.i(message.notification!.title);
      logger.d(message.notification!.body);
    }
  }

  //DETECTAR CUANDO EL APP ESTA EN SEGUNDO PLANO
  static Future _onBackgroundMessage(RemoteMessage message) async {
    if (message.notification != null) {
      logger.i(message.notification!.title);
      logger.d(message.notification!.body);
    }
  }
}
