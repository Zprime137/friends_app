import 'package:friends_app/src/src.dart';

class AdaptiveText extends StatelessWidget {
  final String text;
  final Color? lightModeC;
  final Color? darkModeC;
  final double? fontSize;

  const AdaptiveText(
    this.text, {
    super.key,
    this.lightModeC,
    this.darkModeC,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveBuilder(
      controller: X.themeMode,
      builder: (ThemeMode mode) => Text(
        text,
        style: TextStyle(
          color:
              mode == ThemeMode.dark ? darkModeC ?? white : lightModeC ?? black,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// final ValueController<ThemeMode> themeModeController =
//     ValueController<ThemeMode>(ThemeMode.dark);

// class SwitchThemeButton extends StatelessWidget {
//   const SwitchThemeButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ThemeMode value = themeModeController.value == ThemeMode.dark
//         ? ThemeMode.light
//         : ThemeMode.dark;
//     return TextButton(
//       onPressed: () => themeModeController.update(value),
//       child: const Text('Change Theme'),
//     );
//   }
// }
