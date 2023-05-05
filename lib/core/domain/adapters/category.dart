part of domain;

extension GenreExtension on CategoryModel {
  CategoryUIModel toUiModel() {
    return CategoryUIModel(
      id: id,
      title: name,
    );
  }

  CategoryBooksCompanion toCompanionModel() {
    return CategoryBooksCompanion(
      id: Value<int>(id),
      name: Value<String>(name),
    );
  }
}

extension CategoryBookEntityExtension on CategoryBook {
  CategoryUIModel toUiModel() {
    return CategoryUIModel(
      id: id,
      title: name,
    );
  }
}
