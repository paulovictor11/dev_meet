import 'dart:ui';

import 'package:devmeet/modules/events/cubit/event_cubit.dart';
import 'package:devmeet/shared/theme/app_colors.dart';
import 'package:devmeet/shared/widgets/button/back_button_widget.dart';
import 'package:devmeet/shared/widgets/button/icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({Key? key}) : super(key: key);

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  final EventCubit _cubit = Modular.get<EventCubit>();

  Widget _header(String date, String time) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: date + '\n',
            style: GoogleFonts.rajdhani(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: PrimaryColors.$orange,
              height: 1.4,
            ),
            children: [
              TextSpan(
                text: time,
                style: GoogleFonts.rajdhani(
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
        const BackButtonWidget(),
      ],
    );
  }

  Widget _eventLink(String link) {
    return Container(
      height: 47,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF323232),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Text(
            link,
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: PrimaryColors.$white.withOpacity(0.7),
            ),
          ),
          const Spacer(),
          IconButtonWidget(
            height: 24,
            width: 24,
            iconSize: 14,
            radius: 6,
            icon: Icons.notifications_outlined,
            iconColor: PrimaryColors.$grey,
            color: PrimaryColors.$white.withOpacity(0.2),
            onTap: () {},
          ),
          const SizedBox(width: 9),
          IconButtonWidget(
            height: 24,
            width: 24,
            iconSize: 14,
            radius: 6,
            icon: Icons.arrow_forward_rounded,
            iconColor: SemanticColors.$green,
            color: SemanticColors.$green.withOpacity(0.2),
            onTap: () {},
          )
        ],
      ),
    );
  }

  Widget _dateText(String value, String time) {
    return Row(
      children: [
        Text(
          value,
          style: GoogleFonts.rajdhani(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: PrimaryColors.$white,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          time,
          style: GoogleFonts.rajdhani(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: PrimaryColors.$white.withOpacity(0.5),
          ),
        )
      ],
    );
  }

  Widget _timeLeft() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _dateText('02', 'DAY(s)'),
        _dateText('12', 'HOUR(s)'),
        _dateText('30', 'MIN(s)'),
      ],
    );
  }

  Widget _eventStarted() {
    return Column(
      children: [
        Container(
          height: 90,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          decoration: const BoxDecoration(
            color: Color(0xFF323232),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
          ),
          child: Text(
            'O Evento já está rolando! 🎉',
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: PrimaryColors.$white,
              height: 1.4,
            ),
          ),
        ),
        Container(
          height: 9,
          decoration: const BoxDecoration(
            color: SemanticColors.$green,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(5),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColors.$background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: BlocBuilder<EventCubit, EventState>(
              bloc: _cubit,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _header(state.event!.date, state.event!.time),
                    const SizedBox(height: 32),
                    Text(
                      state.event!.title,
                      style: GoogleFonts.epilogue(
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                        color: PrimaryColors.$white,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      state.event!.content,
                      style: GoogleFonts.epilogue(
                        fontSize: 14,
                        color: PrimaryColors.$grey,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 27),
                    Text.rich(
                      TextSpan(
                        text: 'Organizado por: ',
                        style: GoogleFonts.epilogue(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: PrimaryColors.$grey,
                        ),
                        children: [
                          TextSpan(
                            text: state.event!.by,
                            style: GoogleFonts.epilogue(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 41),
                    Text(
                      'Link do evento',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.epilogue(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: PrimaryColors.$white,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _eventLink(state.event!.link),
                    const SizedBox(height: 46),
                    Text(
                      'Tempo até o evento',
                      style: GoogleFonts.epilogue(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: PrimaryColors.$white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _timeLeft(),
                    const SizedBox(height: 6),
                    const LinearProgressIndicator(
                      value: 0.8,
                      color: PrimaryColors.$orange,
                      backgroundColor: Color(0xFF3C3C3C),
                      minHeight: 7,
                    ),
                    const SizedBox(height: 40),
                    _eventStarted()
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
