import 'package:flutter/material.dart';

class CachedNetworkLoadingWidget extends StatelessWidget {
  const CachedNetworkLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    );
  }
}
