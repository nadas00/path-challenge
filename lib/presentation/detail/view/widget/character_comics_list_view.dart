part of '../detail_view.dart';

class _CharacterComicsListView extends StatelessWidget {
  final List<CharacterComics>? comics;
  const _CharacterComicsListView({
    this.comics,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          (comics?.isNotEmpty ?? false) ? "Comics" : "No Comics Currently",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
        const SizedBox(height: 36),
        Expanded(
          child: ListView.separated(
            itemCount: comics?.length ?? 0,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (comics?[index].hasThumbnail ?? false)
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CachedNetworkImage(
                        imageUrl: comics![index].createThumbnailUrl!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const NetworkLoadingWidget(),
                        errorWidget: (context, url, error) =>
                            const CachedNetworkFailWidget(),
                      ),
                    ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comics?[index].title ?? "Unknown",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          comics?[index].dates?.first.date?.substring(0, 10) ??
                              "Unknown",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
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
          ),
        ),
      ],
    );
  }
}
