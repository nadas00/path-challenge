part of '../home_view.dart';

class _FetchingPlaceHolderCards extends StatelessWidget {
  final bool initialFetch;
  const _FetchingPlaceHolderCards({Key? key, this.initialFetch = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return !initialFetch
        ? buildNewFetchPlaceHolders()
        : buildInitialFetchPlaceHolders();
  }

  Column buildNewFetchPlaceHolders() {
    return Column(
      children: List.generate(
        4,
        (index) => index == 3
            ? const CachedNetworkLoadingWidget()
            : const _ShimmerBundleCard(),
      ),
    );
  }

  Column buildInitialFetchPlaceHolders() {
    return Column(
      children: List.generate(4, (index) => const _ShimmerBundleCard()),
    );
  }
}

class _ShimmerBundleCard extends StatelessWidget {
  const _ShimmerBundleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white.withOpacity(.2),
      baseColor: Colors.grey.withOpacity(.2),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Container(
          height: 350,
          decoration: ShapeDecoration(
            color: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
