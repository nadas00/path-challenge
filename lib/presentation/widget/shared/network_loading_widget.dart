import 'package:flutter/material.dart';

class NetworkLoadingWidget extends Center {
  const NetworkLoadingWidget({
    Key? key,
  }) : super(
          key: key,
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        );
}
