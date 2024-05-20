import 'package:assesment/services/authentication_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late AuthenticationService authenticationService;
  SharedPreferences.setMockInitialValues({});

  setUp(() {
    authenticationService = AuthenticationService();
  });

  test('should persist token', () async {
    const token = 'test_token';
    await authenticationService.persistToken(token);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(AuthenticationService.tokenKey), token);
  });

  test('should delete token', () async {
    const token = 'test_token';
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AuthenticationService.tokenKey, token);

    await authenticationService.deleteToken();
    expect(prefs.getString(AuthenticationService.tokenKey), isNull);
  });

  test('should return true if token exists', () async {
    const token = 'test_token';
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AuthenticationService.tokenKey, token);

    final isAuthenticated = await authenticationService.isAuthenticated();
    expect(isAuthenticated, true);
  });

  test('should return false if token does not exist', () async {
    final isAuthenticated = await authenticationService.isAuthenticated();
    expect(isAuthenticated, false);
  });
}
