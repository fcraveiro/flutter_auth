import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({Key? key}) : super(key: key);

  @override
  State<Pagina1> createState() => _Pagina1State();
}

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);

class _Pagina1State extends State<Pagina1> {
//  SupabaseClient cliente = SupabaseClient(supabaseUrl, supabaseKey);

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: teste(),
      ),
    );
  }

  teste() {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      log(user.toString());
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              leading: GoogleUserCircleAvatar(identity: user),
              title: const Text('user.displayName ?? '),
              subtitle: const Text('user.email'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Sucesso'),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: signOut,
              child: const Text('Sair'),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Voce não está Logado'),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                signIn();
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      );
    }
  }

  void signOut() {
    _googleSignIn.disconnect();
  }

  Future<void> signIn() async {
    log('aqui');
    try {
      await _googleSignIn.signIn();
      log('aqui 2');
    } catch (e) {
      log(e.toString());
    }
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
