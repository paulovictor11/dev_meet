import 'package:devmeet/modules/events/cubit/event_cubit.dart';
import 'package:devmeet/shared/theme/app_colors.dart';
import 'package:devmeet/shared/widgets/button/back_button_widget.dart';
import 'package:devmeet/shared/widgets/card/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final EventCubit _cubit = Modular.get<EventCubit>();

  Widget _header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Eventos\ndisponíveis',
          style: GoogleFonts.epilogue(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: PrimaryColors.$white,
            height: 1.2,
          ),
        ),
        const BackButtonWidget(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _cubit.getEvents();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                const SizedBox(height: 8),
                Text(
                  'Selecione um evento desejado.\nE espere sua data!',
                  style: GoogleFonts.epilogue(
                    fontSize: 16,
                    color: PrimaryColors.$grey,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 18),
                BlocListener<EventCubit, EventState>(
                  bloc: _cubit,
                  listener: (context, state) {
                    if (state.error != null) {
                      final snackBar = SnackBar(content: Text(state.error!));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: BlocBuilder<EventCubit, EventState>(
                    bloc: _cubit,
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 32),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: PrimaryColors.$orange,
                            ),
                          ),
                        );
                      }

                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: state.events.map((event) {
                          return Column(
                            children: [
                              const SizedBox(height: 28),
                              EventCard(
                                event: event,
                                onTap: () => _cubit.selectEvent(event),
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
