part of '_index.dart';

class AuthProv {
  final rxRandom = RM.inject<int>(
    () => 0,
    autoDisposeWhenNotUsed: false,
    sideEffects: SideEffects(
      onSetState: (p0) => _sv.onSetState(),
    ),
  );

  final rxUser = RM.injectStream<User?>(
    () => Stream.value(null),
    sideEffects: SideEffects.onData(
      (data) async {
        logxx.wtf(AuthProv, 'user => $data');
        logxx.i(AuthProv, 'user => ${data.runtimeType}');
        await _sv.responseAuthState(data);
      },
    ),
  );
}
