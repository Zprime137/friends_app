import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:friends_app/src/src.dart';

/// This is just a lazy widget I take with me every project
class ImageWidget extends StatelessWidget {
  final String path;
  final BoxFit? fit;
  final Widget? loadWidget;
  final Widget? loadingErrorWidget;
  final Color? svgColor;

  const ImageWidget({
    super.key,
    required this.path,
    this.fit = BoxFit.contain,
    this.loadWidget,
    this.loadingErrorWidget,
    this.svgColor,
  });

  Widget errorWidgetBuilder(_, __, ___) =>
      loadingErrorWidget ?? closeIcon(color: red, size: 50);

  Widget loadingWidgetBuilder(_, __, ___) => loadWidget!;

  networkImage() => XUtils.isSVG(path)
      ? SvgPicture.network(path, color: svgColor)
      : Image.network(
          path,
          fit: fit,
          errorBuilder: errorWidgetBuilder,
          loadingBuilder: loadingWidgetBuilder,
        );

  fileImage() => XUtils.isSVG(path)
      ? SvgPicture.file(File(path), color: svgColor)
      : Image.file(
          File(path),
          fit: fit,
          errorBuilder: errorWidgetBuilder,
        );

  assetImage() => XUtils.isSVG(path)
      ? SvgPicture.asset(path, color: svgColor)
      : Image.asset(
          path,
          fit: fit,
          errorBuilder: errorWidgetBuilder,
        );

  @override
  Widget build(BuildContext context) {
    return XUtils.isUrl(path)
        ? networkImage()
        : XUtils.isAsset(path)
            ? assetImage()
            : fileImage();
  }
}

// class MyLogo extends StatelessWidget {
//   const MyLogo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const ImageWidget(
//       path:
//           'https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png',
//     );
//   }
// }
