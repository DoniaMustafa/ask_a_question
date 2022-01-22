part of 'fav_cubit.dart';

@immutable
abstract class FavState {}

class FavInitialState extends FavState {}

class FavLoadingState extends FavState {}

class FavLoadedState extends FavState {
  final ArticleResponseModel? article;

  FavLoadedState(this.article);
}

class FavExceptionState extends FavState {}

class FavLoadingAddAndRemoveFav extends FavState {}

class FavLoadedAddAndRemoveFav extends FavState {
  final ChangeFavoriteModel? changeFavorite;

  FavLoadedAddAndRemoveFav(this.changeFavorite);
}

class FavErrorAddAndRemoveFav extends FavState {}

class FavChangeAction extends FavState {}

class FavLoadingRemoveFav extends FavState {}

class FavLoadedRemoveFav extends FavState {
  final ChangeFavoriteModel? changeFavorite;

  FavLoadedRemoveFav(this.changeFavorite);
}

class FavErrorRemoveFav extends FavState {}
