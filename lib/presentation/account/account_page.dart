import 'package:flutter/material.dart';
import 'package:flutter_assignment/login/bloc/login_bloc.dart';
import 'package:flutter_assignment/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _formKey = GlobalKey<FormState>();
  User user = User(password: '', username: '');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10), child: Text("Log in", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),),
          Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      contentPadding: EdgeInsets.only(left: 10)
                    ),
                    onSaved: (value) {
                      user.username = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding: EdgeInsets.only(left: 10)
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      user.password = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length <= 6) {
                        return 'Password should be minimum 6 characters';
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Success')),
                        );
                        _formKey.currentState!.save();
                        context.read<LoginBloc>().add(Logging(username: user.username, password: user.password));
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              )),
          Container(
            height: 200,
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text('Logged as: ' + state.username),
                    Text('Your password: ' + state.password),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
