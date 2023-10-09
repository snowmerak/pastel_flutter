import 'package:flutter/material.dart';
import 'package:pastel/pastel.dart';
import 'package:pastel_flutter/pastel_flutter.dart';

final loginState = Reactive<(String, String)>(('', ''));

class LoginBox extends StatelessWidget {
  const LoginBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveWidget<(String, String)>(
      reactive: loginState,
      builder: (context, state) => Column(
        children: [
          TextField(
            onChanged: (value) {
              loginState.write = (value, state.$2);
            },
          ),
          TextField(
            onChanged: (value) {
              loginState.write = (state.$1, value);
            },
          ),
          TextButton(
            onPressed: () {
              print('ID: ${state.$1}, PW: ${state.$2}');
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
