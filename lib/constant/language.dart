enum Language{
  Uzbek,
  Uzbek_cyrillic,
  Russian,
  English
}

String enumToLanguageString({required Language language}) {
  return language.toString().split('.').last;
}

Language stringToLanguage(String value) {
  if(value.trim() == "") return Language.Uzbek;

  for (Language id in Language.values) {
    if (enumToLanguageString(language: id) == value) {
      return id;
    }
  }
  return Language.Uzbek;
}