import 'package:flutter/material.dart';

import '../providers/providers.dart';

class CustomHistory extends StatelessWidget {
  final IconData icon;
  const CustomHistory({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, i) => Dismissible(
        key:
            UniqueKey(), // aca se utiliza el id del elemento a borrar, o el unique genera autom el id
        background: Container(
          color: Colors.blueGrey,
        ),
        onDismissed: (direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteScansById(scans[i].id!);
        },
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          title: Text(scans[i].valor,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
              maxLines: 2),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.arrow_forward_ios_rounded,
              color: Theme.of(context).primaryColor),
          onTap: () {},
        ),
      ),
    );
  }
}
