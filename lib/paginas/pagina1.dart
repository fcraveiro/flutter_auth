import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase/supabase.dart';
import '../services/config.cfg';

class Pagina1 extends StatefulWidget {
  const Pagina1({Key? key}) : super(key: key);

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  SupabaseClient cliente = SupabaseClient(supabaseUrl, supabaseKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 65,
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: ElevatedButton(
                onPressed: () => {},
                child: const Text('SignUp'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  Future<void> signUp() async {
    final response =
        await cliente.auth.signUp('eletroluke@hotmail.com', '123456');

    if (response.error != null) {
      log(response.error.toString());
      // ERROR: Prompt the user to try again!
    } else {
      // SUCCESS: User and session available!
      final User? user = response.user;
      log(user.toString());
      log(user!.email.toString());
      final Session? session = response.data;
      log(session.toString());
      log(user.emailConfirmedAt.toString());
      log(user.aud);
      log(user.id);
      log(user.toJson().toString());
      log(user.runtimeType.toString());
      log(user.lastSignInAt.toString());
    }
  }

  Future<void> signIn() async {
    final response = await cliente.auth.signIn(
      email: 'eletroluke@hotmail.com',
      password: '123456',
    );

    if (response.error != null) {
      log(response.error.toString());
      // ERROR: Prompt the user to try again!
    } else {
      // SUCCESS: User and session available!
      final User? user = response.user;
      log(user.toString());
      log(user!.email.toString());
      final Session? session = response.data;
      log(session.toString());
      log(user.emailConfirmedAt.toString());
      log(user.aud);
      log(user.id);
      log(user.toJson().toString());
      log(user.runtimeType.toString());
      log(user.lastSignInAt.toString());
    }
  }

  Future<void> sair() async {
    final response = await cliente.auth.signOut();
    if (response.error != null) {
      log(response.error.toString());
      // ERROR: Prompt the user to try again!
    } else {
      log('sei la');
      // ERROR: Prompt the user to try again!
    }
  }

  Future<void> sair3() async {
    final response = await cliente.auth.signIn();
    if (response.error != null) {
      log(response.error.toString());
      // ERROR: Prompt the user to try again!
    } else {
      log('sei la');
      // ERROR: Prompt the user to try again!
    }
  }

  Future<void> entrarGoogle() async {
    var authRedirectUri = 'com.example.flutter_auth://menu';
    final response = await cliente.auth.signIn(
      provider: Provider.google,
      options: AuthOptions(redirectTo: authRedirectUri),
    );
    if (response.error != null) {
      log(response.error.toString());
      // ERROR: Prompt the user to try again!
    } else {
      log('sei la');
      log(response.error.toString());

      // ERROR: Prompt the user to try again!
    }
  }
*/
