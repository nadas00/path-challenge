import 'package:flutter/material.dart';

class CachedNetworkFailWidget extends StatelessWidget {
  const CachedNetworkFailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.error, color: Colors.white),
    );
  }
}
