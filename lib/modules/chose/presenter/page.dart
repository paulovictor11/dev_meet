import 'package:devmeet/modules/chose/cubit/chose_cubit.dart';
import 'package:devmeet/shared/theme/app_colors.dart';
import 'package:devmeet/shared/widgets/button/icon_button_widget.dart';
import 'package:devmeet/shared/widgets/card/chose_card.dart';
import 'package:devmeet/shared/widgets/icon/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class ChosePage extends StatefulWidget {
  const ChosePage({Key? key}) : super(key: key);

  @override
  State<ChosePage> createState() => _ChosePageState();
}

class _ChosePageState extends State<ChosePage> {
  final ChoseCubit _cubit = Modular.get<ChoseCubit>();

  Color _cardBorder(String? value, String compare) {
    if (value == compare) {
      return PrimaryColors.$orange;
    }

    return PrimaryColors.$white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColors.$background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Text(
                  'Que tipo de evento você procura?',
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: PrimaryColors.$white,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 13),
                Text(
                  'Selecione a categoria que mais te agrada!',
                  style: GoogleFonts.epilogue(
                    fontSize: 20,
                    color: PrimaryColors.$grey,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 15),
                BlocBuilder<ChoseCubit, ChoseState>(
                  bloc: _cubit,
                  buildWhen: (prev, next) => prev.category != next.category,
                  builder: (context, state) {
                    return GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      children: [
                        ChoseCard(
                          icon: IconWidget.bash(),
                          title: 'Servidores Linux',
                          total: '5',
                          borderColor: _cardBorder(
                            state.category,
                            'Servidores Linux',
                          ),
                          onTap: () => _cubit.choseCategory('Servidores Linux'),
                        ),
                        ChoseCard(
                          icon: IconWidget.laptop(),
                          title: 'Desenvolvimento Front-end',
                          total: '5',
                          borderColor: _cardBorder(
                            state.category,
                            'Desenvolvimento Front-end',
                          ),
                          onTap: () =>
                              _cubit.choseCategory('Desenvolvimento Front-end'),
                        ),
                        ChoseCard(
                          icon: IconWidget.branch(),
                          title: 'Git e DevOps',
                          total: '4',
                          borderColor: _cardBorder(
                            state.category,
                            'Git e DevOps',
                          ),
                          onTap: () => _cubit.choseCategory('Git e DevOps'),
                        ),
                        ChoseCard(
                          icon: IconWidget.phone(),
                          title: 'Construindo Interfaces',
                          total: '2',
                          borderColor: _cardBorder(
                            state.category,
                            'Construindo Interfaces',
                          ),
                          onTap: () =>
                              _cubit.choseCategory('Construindo Interfaces'),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 36),
                BlocBuilder<ChoseCubit, ChoseState>(
                  bloc: _cubit,
                  buildWhen: (prev, next) => prev.category != next.category,
                  builder: (context, state) {
                    if (state.category == null) {
                      return Container();
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Próximo',
                          style: GoogleFonts.epilogue(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: PrimaryColors.$white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        IconButtonWidget(
                          height: 40,
                          width: 40,
                          iconSize: 24,
                          radius: 11,
                          icon: Icons.arrow_forward_rounded,
                          iconColor: PrimaryColors.$white,
                          color: SemanticColors.$green,
                          onTap: () {
                            Modular.to.pushNamed('/events/');
                          },
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
