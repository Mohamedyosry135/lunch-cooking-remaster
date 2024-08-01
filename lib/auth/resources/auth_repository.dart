part of 'auth_repo_imports.dart';

class AuthRepository {
  late BuildContext _context;
  late AuthHttpMethods _authHttpMethods;

  AuthRepository(BuildContext context) {
    _context = context;
    _authHttpMethods = new AuthHttpMethods(_context);
  }

  Future<void> signInUser(String email, String password) =>
      _authHttpMethods.signInUser(email, password);

  // Future<void> signUpUser(String username,String password) =>
  //     _authHttpMethods.signUpUser(username,password);
  //
  // Future<void> resendSignUpCode(String email) =>
  //     _authHttpMethods.resendSignUpCode(email);
  //
  // Future<void> confirmUser(String username, String pass, String confirmationCode) =>
  //     _authHttpMethods.confirmUser(username,pass,confirmationCode);

  Future<void> signup(String email, String password) =>
      _authHttpMethods.signup(email, password);

  Future<bool> confirmSignup(
          String email, String code, String username, String password) =>
      _authHttpMethods.confirmSignup(email, code, username, password);

  Future<void> resendSignup(String email) =>
      _authHttpMethods.resendSignup(email);

  Future<void> signInWithSocialWebUI(AuthProvider provider) =>
      _authHttpMethods.signInWithSocialWebUI(provider);

  Future<void> resetPassword(String email) =>
      _authHttpMethods.resetPassword(email);

  Future<void> confirmResetPassword(String email, String pass, String code) =>
      _authHttpMethods.confirmResetPassword(email, pass, code);
}
