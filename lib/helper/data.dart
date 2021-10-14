// ignore_for_file: prefer_collection_literals, deprecated_member_use, unnecessary_new

import 'package:news_app/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName = "business";
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1532048304129-314d4c34fbc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Headlines";
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1532048304129-314d4c34fbc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Popular News";
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1532048304129-314d4c34fbc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "sports";
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1532048304129-314d4c34fbc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80';
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  return category;
}
