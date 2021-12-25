enum EnvFields { baseUrl, apiKey, privateApiKey }

extension EnvFieldsName on EnvFields {
  String get name {
    switch (this) {
      case EnvFields.baseUrl:
        return "BASE_URL";
      case EnvFields.apiKey:
        return "API_KEY";
      case EnvFields.privateApiKey:
        return "PRIVATE_API_KEY";
    }
  }
}
