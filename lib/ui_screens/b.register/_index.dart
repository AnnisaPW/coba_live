import 'package:coba_live/ui_widgets/spaces/_index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../app/_index.dart';
import '../../dt_domains/_index.dart';
import '../../xtras/_index.dart';

part 'a.register.data.dart';
part 'b.register.ctrl.dart';
part 'c.register.view.dart';
part 'widgets/a.register.appbar.dart';
part 'widgets/b.register.fab.dart';
part 'widgets/c.register.email.dart';
part 'widgets/d.register.password.dart';
part 'widgets/e.register.retype_password.dart';
part 'widgets/f.register.submit.dart';
part 'widgets/g.register.to_login.dart';

RegisterData get _dt => Data.register.st;
RegisterCtrl get _ct => Ctrl.register;
AuthServ get _sv => Serv.auth;
