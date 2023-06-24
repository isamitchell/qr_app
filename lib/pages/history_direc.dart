import 'package:flutter/material.dart';

class HistoryAdress extends StatelessWidget {
  const HistoryAdress({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.insert_link_rounded,
            color: Theme.of(context).primaryColor),
        title: const Text('efef'),
        subtitle: const Text('eded'),
        trailing: Icon(Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).primaryColor),
      ),
    );
  }
}
