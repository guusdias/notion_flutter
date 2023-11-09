//vai ser um stateful widget pq vai ter variável que não vai ser final
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notion/utils/constants.dart';
import 'package:notion/widgets/rounded_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
//primeiro cria as variaveis
  late String email;
  late String password; //isso aqui serve para receber as informações
  final auth = FirebaseAuth
      .instance; //aqui a gente usa a instancia do firebase para facilitar o processo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Notas - Nova Conta',
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            TextField(
              //vamos pegar agora do arquivo constants.dart
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Entre seu email'),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(
              height: 48,
            ),
            TextField(
              //vamos pegar agora do arquivo constants.dart
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Entre seu senha'),
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            RoundedButton(
                title: 'Registrar-se',
                color: Colors.green,
                onPressed: () {
                  auth
                      .createUserWithEmailAndPassword(
                          email: email, password: password)
                      .then((value) => Navigator.pushNamed(context, '/main'));
                })
          ],
        ),
      ),
    );
  }
}
