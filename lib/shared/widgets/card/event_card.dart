import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:devmeet/shared/models/event.dart';
import 'package:devmeet/shared/theme/app_colors.dart';
import 'package:devmeet/shared/widgets/button/icon_button_widget.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;

  const EventCard({
    Key? key,
    required this.event,
    required this.onTap,
  }) : super(key: key);

  Widget _dateTime() {
    return Row(
      children: [
        Text(
          event.date,
          style: GoogleFonts.rajdhani(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: PrimaryColors.$orange,
          ),
        ),
        const SizedBox(width: 2),
        const Text('-'),
        const SizedBox(width: 2),
        Text(
          event.time,
          style: GoogleFonts.rajdhani(
            fontSize: 16,
            color: PrimaryColors.$orange,
          ),
        ),
      ],
    );
  }

  Widget _text(String title, String subtitle) {
    return Text.rich(
      TextSpan(
        text: title,
        style: GoogleFonts.epilogue(
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: GreyColors.$background,
        ),
        children: [
          TextSpan(
            text: subtitle,
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _text('Organizado por: ', event.by),
        IconButtonWidget(
          height: 24,
          width: 24,
          iconSize: 14,
          radius: 6,
          icon: Icons.arrow_forward_rounded,
          iconColor: SemanticColors.$green,
          color: SemanticColors.$green.withOpacity(0.2),
          onTap: onTap,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: PrimaryColors.$white,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _dateTime(),
          const SizedBox(height: 8),
          Text(
            event.title,
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: GreyColors.$background,
              height: 1.2,
            ),
          ),
          const Spacer(),
          Text(
            event.content,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: GoogleFonts.epilogue(
              fontSize: 12,
              color: PrimaryColors.$grey,
              height: 1.1,
            ),
          ),
          const Spacer(),
          _footer(),
        ],
      ),
    );
  }
}
