import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_challenge/presentation/home/model/network/characters_response_model.dart';
import 'package:path_challenge/presentation/widget/cached_network_image/cached_network_image_fail_widget.dart';
import 'package:path_challenge/presentation/widget/cached_network_image/cached_network_image_loading_widget.dart';

class CharacterCard extends StatelessWidget {
  final CharactersModel charactersModel;
  final double height;
  final double width;
  final bool displayImageOnly;

  final GestureTapCallback? onTap;

  const CharacterCard({
    Key? key,
    required this.charactersModel,
    this.height = 350,
    this.width = double.infinity,
    this.onTap,
    this.displayImageOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            if (charactersModel.hasThumbnail)
              CachedNetworkImage(
                imageUrl: charactersModel.createThumbnailUrl!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: ShapeDecoration(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CachedNetworkLoadingWidget(),
                errorWidget: (context, url, error) =>
                    const CachedNetworkFailWidget(),
              ),
            if (!displayImageOnly)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: charactersModel.hasCharacterNameAndDescription
                        ? Colors.black54
                        : null,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (charactersModel.hasCharacterName)
                        Text(
                          charactersModel.name!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                      if (charactersModel.hasDescription)
                        Text(
                          charactersModel.description!,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white70),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
