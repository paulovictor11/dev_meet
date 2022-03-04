import 'package:devmeet/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Modular.to.pop();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.arrow_back_rounded,
            color: PrimaryColors.$grey,
            size: 16,
          ),
          const SizedBox(width: 7),
          Text(
            'Voltar',
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: PrimaryColors.$grey,
            ),
          )
        ],
      ),
    );
  }
}
