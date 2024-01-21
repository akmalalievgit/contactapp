import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ContactItem(String name, String number, void Function() onDelete, void Function() onEdit) {
  return Container(
    height: 65,
    child: Column(
      children: [
        Row(
          children: [
            Icon(Icons.person),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.nunito(
                    color: const Color(0xFF333333),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Opacity(
                  opacity: 0.50,
                  child: Text(
                    number,
                    style: GoogleFonts.nunito(
                      color: const Color(0xFF333333),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'Edit') {
                  onEdit();
                } else if (value == 'Delete') {
                  onDelete();
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Edit',
                  child: Text('Edit'),
                ),
                const PopupMenuItem<String>(
                  value: 'Delete',
                  child: Text('Delete'),
                ),
              ],
              icon: const Icon(
                Icons.more_horiz,
                size: 24,
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xFFE0E0E0),
        ),
      ],
    ),
  );
}