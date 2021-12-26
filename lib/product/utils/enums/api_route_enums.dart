abstract class ApiRoutes {
  static const String characters = "/characters?limit={limit}&offset={offset}";
  static const String charactersComics =
      "/characters/{characterId}/comics?startYear={startYear}&orderBy=-onsaleDate&limit={limit}";
}
