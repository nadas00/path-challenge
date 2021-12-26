part of '../detail_view.dart';

class _CharacterComicsListView extends StatelessWidget {
  final Series? comics;
  const _CharacterComicsListView({
    this.comics,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 36),
      itemCount: comics?.items?.length ?? 0,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(16),
        child: Text(
          comics?.items?[index].name ?? "Unknown",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white),
        ),
        decoration: const ShapeDecoration(
          color: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 20),
    );
  }
}
