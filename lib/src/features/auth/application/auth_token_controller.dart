import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todos_app/main.dart';
import 'package:riverpod_todos_app/src/constants/keys.dart';

part 'auth_token_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthTokenController extends _$AuthTokenController {
  @override
  String? build() {
    return ref.watch(sharedPreferencesProvider).getString(Keys.token);
  }

  void setToken(String token) {
    state = token;
    ref.read(sharedPreferencesProvider).setString(Keys.token, token);
  }

  void deleteToken() {
    state = null;
    ref.read(sharedPreferencesProvider).remove(Keys.token);
  }
}
