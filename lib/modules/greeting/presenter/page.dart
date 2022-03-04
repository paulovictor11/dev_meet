import 'package:devmeet/shared/theme/app_colors.dart';
import 'package:devmeet/shared/widgets/button/icon_button_widget.dart';
import 'package:devmeet/shared/widgets/illustration/illustration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingPage extends StatefulWidget {
  const GreetingPage({Key? key}) : super(key: key);

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  Widget _title() {
    return Text.rich(
      TextSpan(
        text: 'Olá, Dev ',
        style: GoogleFonts.epilogue(
          fontWeight: FontWeight.bold,
          fontSize: 40,
          color: PrimaryColors.$white,
        ),
        children: [
          TextSpan(
            text: '!',
            style: GoogleFonts.epilogue(
              color: PrimaryColors.$orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _subtitle() {
    return Text.rich(
      TextSpan(
        text: 'Encontre o seu\n',
        style: GoogleFonts.epilogue(
          fontSize: 24,
          color: PrimaryColors.$grey,
          height: 1.4,
        ),
        children: [
          TextSpan(
            text: 'próximo',
            style: GoogleFonts.epilogue(
              backgroundColor: PrimaryColors.$orange,
              color: PrimaryColors.$white,
            ),
          ),
          const TextSpan(
            text: ' evento de\nprogramação!',
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColors.$background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                _title(),
                const SizedBox(height: 29),
                _subtitle(),
                IllustrationWidget.person(size: const Size(277.24, 374)),
                Center(
                  child: IconButtonWidget(
                    icon: Icons.arrow_forward_rounded,
                    onTap: () {
                      Modular.to.pushNamed('chose/');
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
