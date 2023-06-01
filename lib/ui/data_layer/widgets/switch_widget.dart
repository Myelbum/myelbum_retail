
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Ces classes peuvent être utilisées pour créer des commutateurs personnalisés avec 
///des sélecteurs d'heure dans une interface utilisateur Flutter.

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key, required this.day});

  final String day;

  @override
  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch> {
  bool _switchValue = false;

  TimeOfDay? selectedInitTime;
  TimeOfDay? selectedEndTime;

// Méthode pour afficher le sélecteur d'heure initiale
  Future<void> _showInitimePicker() async {
      // Affiche le sélecteur d'heure avec l'heure actuelle comme valeur initiale
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedInitTime) {
        // Met à jour l'heure initiale sélectionnée
      setState(() {
        selectedInitTime = pickedTime;
      });
    }
  }
  // Méthode pour afficher le sélecteur d'heure de fin
  Future<void> _showEndtimePicker() async {
      // Affiche le sélecteur d'heure avec l'heure actuelle comme valeur initiale
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedEndTime) {
            // Met à jour l'heure de fin sélectionnée
      setState(() {
        selectedEndTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     // Gestion de l'affichage des textes d'heure initiale et de fin
    String timeInitText = '9:00 AM';
    String timeEndText = '5:00 PM';
    if (selectedInitTime != null) {
      final hour = selectedInitTime?.hourOfPeriod;
      final minute = selectedInitTime?.minute.toString().padLeft(2, '0');
      final period = selectedInitTime?.period == DayPeriod.am ? 'AM' : 'PM';
      timeInitText = '$hour:$minute $period';
    }

    if (selectedEndTime != null) {
      final hour = selectedEndTime?.hourOfPeriod;
      final minute = selectedEndTime?.minute.toString().padLeft(2, '0');
      final period = selectedEndTime?.period == DayPeriod.am ? 'AM' : 'PM';
      timeEndText = '$hour:$minute $period';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.day,
          style: const TextStyle(color: CupertinoColors.black),
        ),
        const SizedBox(width: 8),
        CupertinoSwitch(
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
        ),
        const SizedBox(
          width: 10.0,
        ),
        GestureDetector(
          onTap: _showInitimePicker,
          child: Container(
            width: 100.0,
            height: 50.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                timeInitText,
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        GestureDetector(
          onTap: _showEndtimePicker,
          child: Container(
            width: 100.0,
            height: 50.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                timeEndText,
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return CustomSwitch(
      day: day,
    );
  }
}
