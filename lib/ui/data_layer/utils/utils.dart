import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';


///Cette fonction peut être utilisée pour afficher un simple objet Row 
/// avec juste deux widget afficher de part à gauche et à droite de l'écran.

buildRow(Widget leftSize, Widget rightSide, Size size) => SizedBox(
        width: size.width,
        height: size.height * 0.05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: leftSize,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: rightSide,
            ),
          ],
        ),
      );

///Cette fonction peut être utilisée pour afficher un simple point ou marqueur
/// de petite taille dans l'interface utilisateur.
buildDot() => Container(
      width: 2.0,
      height: 2.0,
      decoration:
          const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
    );

///Cette fonction permet de créer un bouton personnalisé avec du texte et un style visuel cohérent.
///Les lignes de texte supplémentaires peuvent être utilisées pour afficher
/// des informations complémentaires ou des détails associés au bouton.
Container customButon(Size size, String title, List<String> text) {
  assert(
      !(text.length > 2), 'The text argument must have less than 3 elements.');
  return Container(
    height: 66.0,
    width: size.width,
    margin: const EdgeInsets.symmetric(horizontal: 40.0),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.54),
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        for (int i = 0; i < text.length; i++)
          Text(
            text[i].toString(),
            style: const TextStyle(
                fontSize: 10.0,
                color: Colors.white,
                fontWeight: FontWeight.w400),
          ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    ),
  );
}

///Cette fonction permet de créer un bouton d'étape personnalisé avec un texte spécifié,
///une fonction onPressed facultative et un style visuel cohérent.
Container customStepButton(Size size, String text, Function()? onPressed) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                onPressed == null ? Colors.grey : Palette.appThemeColor),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23.46),
              ),
            ),
            fixedSize: MaterialStatePropertyAll(
                Size(size.width, size.height * 0.065))),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
    );

Container customStepOutlinedButton(
        Size size, String text, Function()? onPressed) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                onPressed == null ? Colors.transparent : Palette.appThemeColor),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23.46),
              ),
            ),
            fixedSize: MaterialStatePropertyAll(
                Size(size.width, size.height * 0.065))),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
            fontSize: 14.0,
          ),
        ),
      ),
    );

///cette fonction facilite l'affichage d'une boîte de dialogue personnalisée avec un
///titre et un contenu spécifiés, en utilisant
///la taille fournie pour déterminer les dimensions de la boîte de dialogue.
void showAlertDialog(
    BuildContext context, Size size, Text? title, Widget content,
    [double height = 100.0]) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        alignment: Alignment.center,
        contentPadding:
            title == null ? EdgeInsets.zero : const EdgeInsets.all(20.0),
        content: SizedBox(
          width: size.width * 0.4,
          height: height == 100.0 ? size.height * 0.12 : height,
          child: content,
        ),
      );
    },
  );
}
