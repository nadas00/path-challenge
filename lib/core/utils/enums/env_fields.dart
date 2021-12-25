enum EnvFields { baseUrl, apiKey }

extension EnvFieldsName on EnvFields {
  String get name {
    switch (this) {
      case EnvFields.baseUrl:
        return "BASE_URL";
      case EnvFields.apiKey:
        return "API_KEY";
    }
  }
}
