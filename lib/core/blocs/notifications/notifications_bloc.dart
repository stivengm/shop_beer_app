import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shop_beer_app/core/config/local_notifications.dart';
import 'package:shop_beer_app/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

Future <void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  LocalNotifications.showLocalNotifications(
    id: 1, // message.messageId,
    body: message.notification!.body,
    data: "",
    title: message.notification!.title
  );

  print("Handling a background message: ${message.messageId}");
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc() : super(const NotificationsState()) {
  
    on<NotificationsStatusChanged>( _notificationsStatusChanged );

    on<GetToken>((event, emit) {
      emit( state.copyWith( token: event.token ) );
    });

    // Verificar estado de las notificaciones 
    _initialStatusCheck();

    // Listener para notificaciones en Foreground
    _onForegroundMessage();
  }

  static Future<void> initializeFirebaseCloudMessage() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
  }

  getToken() async {
    final settings = await messaging.getNotificationSettings();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

    final token = await messaging.getToken();
    print(token);
    add(GetToken(token ?? ''));
  }

  void _handleRemoteMessage(RemoteMessage message) {
    print('Aplicación abierta');
    print('Message data: ${message.data}');

    if (message.notification == null) return;


    LocalNotifications.showLocalNotifications(
      id: 1, // message.messageId,
      body: message.notification!.body,
      data: "",
      title: message.notification!.title
    );

    print('message notifications: ${message.notification}');
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(_handleRemoteMessage);
  }

  localNotifications({String? title, required String body}) {
    LocalNotifications.showLocalNotifications(
      id: 1, // message.messageId,
      body: body,
      data: "",
      title: title ?? 'ShopBeer'
    );
  }

  void _notificationsStatusChanged( NotificationsStatusChanged event, Emitter<NotificationsState> emit) {
    emit(
      state.copyWith(
        status: event.status
      )
    );
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add( NotificationsStatusChanged(settings.authorizationStatus));
  }

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true
    );

    // Solicitar permiso a las Local Notifications
    await LocalNotifications.requestPermissionLocalNotifications();

    add( NotificationsStatusChanged(settings.authorizationStatus));
  }

  // PushMessage? getMessageById( String pushMessageId ) {
  //   final exist = state.notifications.any((element) => element.messageId == pushMessageId );
  //   if ( !exist ) return null;

  //   return state.notifications.firstWhere((element) => element.messageId == pushMessageId );
  // }
}
