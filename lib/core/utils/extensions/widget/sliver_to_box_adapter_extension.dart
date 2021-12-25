import 'package:flutter/widgets.dart' show Widget, SliverToBoxAdapter;

extension SliverToBoxAdapterExtension on Widget {
  SliverToBoxAdapter get toSliver => SliverToBoxAdapter(child: this);
}
