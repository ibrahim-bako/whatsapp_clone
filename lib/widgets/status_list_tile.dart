import 'package:flutter/material.dart';

class StatusListTile extends StatelessWidget {
  const StatusListTile({
    super.key,
    this.color = Colors.blue,
    required this.name,
    required this.lastUpdate,
    this.onTap,
    this.onLongPress,
    this.avatar,
  });

  final Color color;
  final String name;
  final DateTime lastUpdate;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final ImageProvider? avatar;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      onLongPress: onLongPress,
      leading: CircleAvatar(
        backgroundColor: color,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: avatar,
          ),
        ),
      ),
      title: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        durationToString(DateTime.now().difference(lastUpdate)),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  String durationToString(Duration duration) {
    if (duration.inSeconds < 60) return "maintenant";

    if (duration.inMinutes <= 30) {
      return "il y'a ${duration.inMinutes} minutes ";
    }

    if (duration.inHours < 24 && duration.inMinutes > 30) {
      return '${lastUpdate.hour}:${lastUpdate.minute}';
    }

    if (duration.inDays < 7) return "il y'a ${duration.inDays} jours";

    if (duration.inDays < 30) return "il y'a ${duration.inDays ~/ 7} semaines";

    if (duration.inDays < 365) return "il y'a ${duration.inDays ~/ 30} mois";

    if (duration.inDays < 365 * 2) {
      return "il y'a ${duration.inDays ~/ 365} ans";
    }

    return "";
  }
}
