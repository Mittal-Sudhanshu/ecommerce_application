import 'package:ecommerce/BLoC/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegistrationBloc with Validator {
  final _registerEmail = BehaviorSubject<String>();
  final _registerName = BehaviorSubject<String>();
  final _registerPassword = BehaviorSubject<String>();
  final _registerCnfPassword = BehaviorSubject<String>();

  //Getters

  Stream<String> get registrationEmail =>
      _registerEmail.stream.transform(emailValidator);
  Stream<String> get registrationName =>
      _registerName.stream.transform(nameValidator);
  Stream<String> get registrationPassword =>
      _registerPassword.stream.transform(passwordValidator);
  Stream<String> get registrationCnfPassword =>
      _registerCnfPassword.stream.transform(passwordValidator);

  Stream<bool> get isValid => Rx.combineLatest4(
      registrationEmail,
      registrationName,
      registrationPassword,
      registrationCnfPassword,
      (a, b, c, d) => true);
  Stream<bool> get isPasswordMatched =>
      Rx.combineLatest2(registrationPassword, registrationCnfPassword, (a, b) {
        if (a != b) {
          return false;
        } else {
          return true;
        }
      });
  //Setters

  Function(String) get changeRegistrationEmail => _registerEmail.sink.add;
  Function(String) get changeRegistrationName => _registerName.sink.add;
  Function(String) get changeRegistrationPassword => _registerPassword.sink.add;
  Function(String) get changeRegistrationCnfPassword =>
      _registerCnfPassword.sink.add;
  void dispose() {
    _registerCnfPassword.close();
    _registerEmail.close();
    _registerName.close();
    _registerPassword.close();
  }
}
