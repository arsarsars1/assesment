import 'package:assesment/services/authentication_service.dart';

class AuthenticationRepository {
  final AuthenticationService _authenticationService;

  AuthenticationRepository(this._authenticationService);

  Future<bool> isAuthenticated() async {
    return await _authenticationService.isAuthenticated();
  }

  Future<void> persistToken(String token) async {
    return await _authenticationService.persistToken(token);
  }

  Future<void> deleteToken() async {
    return await _authenticationService.deleteToken();
  }
}
