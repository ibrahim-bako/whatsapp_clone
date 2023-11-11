import 'package:flutter/material.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
    this.color = Colors.blue,
    this.badgeTextStyle,
    required this.name,
    required this.lastMessage,
    this.avatar,
    this.isMuted = false,
    this.nbNewMessage,
    required this.lastMessageAt,
    this.onTap,
    this.onLongPress,
    this.selected = false,
  });

  final Color color;
  final TextStyle? badgeTextStyle;
  final String name;
  final String lastMessage;
  final ImageProvider? avatar;
  final DateTime lastMessageAt;
  final bool isMuted;
  final int? nbNewMessage;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    // final duration =
    //     Duration(seconds: lastMessageAt.difference(DateTime.now()).inSeconds);

    return ListTile(
      onTap: onTap,
      // dense: true,
      tileColor: selected ? color.withAlpha(50) : null,
      onLongPress: onLongPress,
      // isThreeLine: true,
      leading: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: avatar,
          ),
          // Badge(
          //   backgroundColor: color,
          // ),
        ],
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            durationToString(DateTime.now().difference(lastMessageAt)),
            style: TextStyle(
              color: color.withGreen(150).withBlue(70).withRed(70),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              lastMessage,
              overflow: TextOverflow.ellipsis,
              // maxLines: 2,
            ),
          ),
          Row(
            children: [
              if (isMuted)
                const Icon(
                  Icons.volume_off,
                  size: 18,
                ),
              const SizedBox(width: 5),
              if ((nbNewMessage != null))
                Badge.count(
                  backgroundColor: color,
                  textColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  count: nbNewMessage ?? 0,
                ),
            ],
          ),
        ],
      ),
    );
  }

  String durationToString(Duration duration) {
    if (duration.inSeconds < 60) return "now";
    if (duration.inMinutes <= 30) return "${duration.inMinutes} mn";
    if (duration.inHours < 24 && duration.inMinutes > 30) {
      return '${lastMessageAt.hour}:${lastMessageAt.minute}';
    }
    if (duration.inDays < 7) return "${duration.inDays} day";
    if (duration.inDays < 30) return "${duration.inDays ~/ 7} week";
    if (duration.inDays < 365) return "${duration.inDays ~/ 30} month";
    if (duration.inDays < 365 * 2) return "${duration.inDays ~/ 365} year";

    return "";
  }
}
