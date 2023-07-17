
import 'package:cinearts_academy_app/Infrastructure/Internet/conectivity_provider.dart';
import 'package:cinearts_academy_app/Infrastructure/Internet/internet_connection_check.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckNetwork extends StatelessWidget {
  final Widget child;

  const CheckNetwork({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isOnline = Provider.of<ConnectivityProvider>(context).isOnline;

    return !isOnline ? const InternetConnectionCheck() : child;
  }
}