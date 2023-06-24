import 'package:flutter/material.dart';
import 'package:qr_app/providers/scan_list_provider.dart';

class HistoryMaps extends StatelessWidget {
  const HistoryMaps({super.key});

  @override
  Widget build(BuildContext context) {
    final scan = ScanListProvider;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_on_outlined,
            color: Theme.of(context).primaryColor),
        title: const Text('efef'),
        subtitle: const Text('eded'),
        trailing: Icon(Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).primaryColor),
      ),
    );
  }
}
