import 'package:friends_app/src/src.dart';

class MaterialForm extends StatelessWidget {
  final Widget child;
  const MaterialForm({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Padding(
          padding: EdgeInsets.only(bottom: X.mediaQuery.viewInsets.bottom + 50),
          child: Margin(
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: child,
          ),
        ),
      ),
    );
  }
}
