import 'package:cmflutter0/src/bloc/login/login_bloc.dart';
import 'package:cmflutter0/src/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  int _Counter = 0;

  @override
  void initState() {
    super.initState();
    _usernameController.text = "";
    _passwordController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Text("LoginPage : ${state.count}");
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            // color: Colors.pink.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  //height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ..._buildTextField(),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return Center(
                              child: Text(
                            "Login Result : ${state.isAuthened ? "Success" : "Not Login"}",
                            style: TextStyle(
                                color: state.isAuthened
                                    ? Colors.green
                                    : Colors.red),
                          ));
                        },
                      ),
                      SizedBox(height: 32),
                      ..._buildButton(),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return Text("CounterX : ${state.count}");
                            },
                          ),
                          IconButton(
                              onPressed: () => context
                                  .read<LoginBloc>()
                                  .add(LoginEventAdd()),
                              icon: Icon(Icons.add)),
                          IconButton(
                              onPressed: () => context
                                  .read<LoginBloc>()
                                  .add(LoginEventRemove()),
                              icon: Icon(Icons.remove))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void _handleClickLogin() {
    final user = User(
      username: _usernameController.text,
      password: _passwordController.text,
    );
    context.read<LoginBloc>().add(LoginEventLogin(user));
    // Navigator.pushNamed(context, AppRoute.home);
  }

  void _handleClickRegister() {
    Navigator.pushNamed(context, AppRoute.register);
    // _Counter = _Counter + 1;
  }

  void _handleClickReset() {
    _usernameController.text = "";
    _passwordController.text = "";
  }

  void _handleClickIconadd() {
    _Counter++;
    setState(() {});
  }

  void _handleClickIconremove() {
    _Counter--;
    setState(() {});
  }

  _buildTextField() {
    return [
      TextField(
        controller: _usernameController,
        decoration: InputDecoration(labelText: "Username"),
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(labelText: "Password"),
      ),
    ];
  }

  _buildButton() {
    return [
      MaterialButton(
        onPressed: _handleClickLogin,
        color: Colors.greenAccent,
        child: Text("Login"),
      ),
      OutlinedButton(
        onPressed: _handleClickRegister,
        child: Text("Register"),
      ),
      OutlinedButton(
        onPressed: _handleClickReset,
        child: Text("Reset"),
      ),
    ];
  }
}
