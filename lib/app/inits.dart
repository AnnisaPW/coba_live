part of '_index.dart';

Future<void> inits() async {
  logx.wtf('inits start');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Serv.sample.init();
  Serv.product.init();

  setPathUrlStrategy();

  logx.wtf('inits success');
}
