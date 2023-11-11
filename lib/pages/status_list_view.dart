import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widgets/status_list_tile.dart';

class StatusListView extends StatelessWidget {
  const StatusListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Mises à jour récentes"),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return StatusListTile(
                name: "name",
                lastUpdate: DateTime.now().subtract(const Duration(hours: 1)),
              );
            },
          ),
        ),
      ],
    );
  }
}
