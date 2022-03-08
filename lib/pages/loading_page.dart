import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/usuarios_page.dart';
import 'package:chat/services/socket_service.dart';
import 'package:chat/services/auth_service.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoadingState(context),
        builder: (context, snapshot) {
          return const Center(
            child: Text('Espere....'),
          );
        },
      ),
    );
  }

  Future checkLoadingState(BuildContext context) async {
    final authService = Provider.of<AuthSetvice>(context);
    final socketService = Provider.of<SocketService>(context);

    final autenticado = await authService.isLoggedIn();

    if (autenticado) {
      socketService.connect();

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const UsuariosPage(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginPage(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );
    }
  }
}
