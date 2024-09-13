import 'package:flutter/material.dart';
import 'package:klontong/utility/device_utility.dart';

class ButtonPagination extends StatelessWidget {
  const ButtonPagination({
    super.key,
    required this.onPressed,
    required this.pagination,
  });

  final Function()? onPressed;
  final String pagination;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(
        width: DeviceUtility.getScreenWidth(context) * .30,
        height: 20,
        child: Center(child: Text(pagination)),
      ),
    );
  }
}
