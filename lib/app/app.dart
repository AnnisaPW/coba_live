part of '_index.dart';

class App extends TopStatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NC Flutter Template',
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(),
      routeInformationParser: nav.routeInformationParser,
      routerDelegate: nav.routerDelegate,
    );
  }
}
