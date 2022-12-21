import 'package:friends_app/src/src.dart';

class AdaptiveCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Color? lightModeC;
  final Color? darkModeC;

  const AdaptiveCard({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.borderRadius,
    this.lightModeC,
    this.darkModeC,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveBuilder(
      controller: X.themeMode,
      builder: (ThemeMode mode) {
        return Container(
          padding: padding ?? const EdgeInsets.all(10),
          height: height,
          width: width,
          decoration: BoxDecoration(
            boxShadow: myShadow,
            borderRadius: borderRadius ?? semiRounded,
            color: mode == ThemeMode.dark
                ? darkModeC ?? darkC1
                : lightModeC ?? lightC1,
          ),
          child: child,
        );
      },
    );
  }
}
