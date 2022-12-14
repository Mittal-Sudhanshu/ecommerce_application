import 'dart:async';

mixin Validator {
//email validator
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.isEmpty) {
        return sink.addError("This field can't be empty be empty");
      }
      if (email.length > 32) {
        return sink.addError("Email can't be more than 32 characters");
      }
      if (email.length < 6) {
        return sink.addError("Email can't be less than 6 characters");
      }
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email)) {
        return sink.addError("Please enter a valid email");
      } else {
        sink.add(email);
      }
    },
  );
  var loginPasswordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (loginPassword, sink) {
      if (loginPassword.isEmpty) {
        return sink.addError("This field can't be empty");
      }

      if (loginPassword.length < 8) {
        return sink.addError("Password can't be less than 8 characters");
      } else {
        sink.add(loginPassword);
      }
    },
  );
  var nameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink) {
      if (name.isEmpty) {
        return sink.addError("This field can't be empty");
      }
      if (name.length > 32) {
        return sink.addError("Name can't be more than 32 characters");
      }
      if (name.length < 3) {
        return sink.addError("Name can't be less than 3 characters");
      }
      if (!RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z])?[a-zA-Z]*)*$")
          .hasMatch(name)) {
        return sink.addError("Please enter a valid email");
      } else {
        sink.add(name);
      }
    },
  );
  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.isEmpty) {
        return sink.addError("This field can't be empty");
      }
      if (password.length > 32) {
        return sink.addError("Password can't be more than 32 characters");
      }
      if (password.length < 8) {
        return sink.addError("Password can't be less than 8 characters");
      }
      if (!RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(password)) {
        return sink.addError("Please enter a valid password");
      } else {
        sink.add(password);
      }
    },
  );
}
