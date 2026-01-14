import 'package:day_task_app/core/exports.dart';

class SpaceW extends StatelessWidget {
  const SpaceW(this.width, {super.key});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w);
  }
}

class SpaceH extends StatelessWidget {
  const SpaceH(this.height, {super.key});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h);
  }
}
