import 'package:discy_application/sre/data/datasource/remote/dio_server.dart';
import 'package:discy_application/sre/data/repositories/action_implement.dart';
import 'package:discy_application/sre/data/repositories/articles_repository_impl.dart';
import 'package:discy_application/sre/data/repositories/category_implement.dart';
import 'package:discy_application/sre/data/repositories/current_user_implement.dart';
import 'package:discy_application/sre/data/repositories/favorite_implement.dart';
import 'package:discy_application/sre/data/repositories/search_implement.dart';
import 'package:discy_application/sre/data/repositories/setting_implement.dart';
import 'package:discy_application/sre/data/repositories/single_post_implement.dart';
import 'package:discy_application/sre/data/repositories/tags_implement.dart';
import 'package:discy_application/sre/domain/repositories/actions_repo.dart';
import 'package:discy_application/sre/domain/repositories/article_repo.dart';
import 'package:discy_application/sre/domain/repositories/category_repo.dart';
import 'package:discy_application/sre/domain/repositories/settings_repo.dart';
import 'package:discy_application/sre/domain/repositories/single_question_repo.dart';
import 'package:discy_application/sre/presentation/bloc/categories_bloc/category_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/drawer_bloc/drawer_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/fav_bloc/fav_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/bump_bloc/bump_que_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/home_bloc/home_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/most_bloc/most_answer_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/no_answer_cubit/no_answer__qus_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/recent_bloc/recent_ques_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/recent_post_cubit/recent_post_ques_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/vote_cubit/vote_ques_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/layout_bloc/layout_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/settings_bloc/notify_bloc/notify_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/singel_post_bloc/singel_post_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/single_category_bloc/single_category_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/tag_bloc/tag_cubit.dart';
import 'package:get_it/get_it.dart';

import 'core/usecases/usecase.dart';
import 'domain/repositories/current_user_repo.dart';
 import 'domain/repositories/fav_repo.dart';
import 'domain/repositories/search_repo.dart';
import 'domain/repositories/tags_repo.dart';
import 'presentation/bloc/home_blocs/answer_bloc/answer_ques_cubit.dart';
import 'presentation/bloc/settings_bloc/faq_bloc/faq_cubit.dart';

GetIt di = GetIt.I..allowReassignment = true;

Future<void> initializeDependency() async {
  // final shared = await SharedPreferences.getInstance();
  //
  // di.registerLazySingleton<SharedPreferences>(
  //       () => shared,
  // );
  // di.registerLazySingleton<CacheHelper>(() => CacheImp(
  //   di<SharedPreferences>(),
  // ));

  di.registerLazySingleton<DioServer>(() => DioServer());
  di.registerLazySingleton<UseCase>(
      () => DataUseCases(di<DioServer>()));
  di.registerLazySingleton<ArticleRepository>(
      () => ArticlesRepositoryImplementation(di<UseCase>()));
  di.registerLazySingleton<CategoryRepository>(
      () => CategoryImplement(di<UseCase>()));
  di.registerLazySingleton<SingleQuestionRepository>(
      () => SingleQuestionImpl(di<UseCase>()));
  di.registerLazySingleton<SettingRepository>(
      () => SettingImplementation(di<UseCase>()));
  di.registerLazySingleton<FavoriteRepository>(
      () => FavoriteImplement(di<UseCase>()));
  di.registerLazySingleton<SearchRepository>(
      () => SearchImplement(di<UseCase>()));
  di.registerSingleton<TagsRepository>(SingleTagsImplementation(di<UseCase>()));

  di.registerSingleton<CurrentUserRepository>(CurrentUserImplement(di<UseCase>()));
  di.registerSingleton<ActionRepository>(ActionImplement(di<UseCase>()));
  di.registerSingleton<LayoutCubit>(LayoutCubit());
  di.registerSingleton<SearchCubit>(SearchCubit(di<SearchRepository>()));

  di.registerSingleton<HomeCubit>(HomeCubit(di<ActionRepository>()));
  di.registerSingleton<UserInfoCubit>(UserInfoCubit(di<CurrentUserRepository>()));
  di.registerSingleton<RecentQuesCubit>(
      RecentQuesCubit(di<ArticleRepository>()));
  di.registerSingleton<MostAnswerCubit>(
      MostAnswerCubit(di<ArticleRepository>()));
  di.registerSingleton<AnswerQuesCubit>(
      AnswerQuesCubit(di<ArticleRepository>()));
  di.registerSingleton<BumpQueCubit>(BumpQueCubit(di<ArticleRepository>()));
  di.registerFactory<MostVoteCubit>(() => MostVoteCubit(di<ArticleRepository>()));
  di.registerSingleton<NoAnswerQusCubit>(
      NoAnswerQusCubit(di<ArticleRepository>()));
  di.registerSingleton<RecentPostQuesCubit>(
      RecentPostQuesCubit(di<ArticleRepository>()));

  di.registerSingleton<FavCubit>(FavCubit(di<FavoriteRepository>()));

  di.registerLazySingleton<CategoryCubit>(
      () => CategoryCubit(di<CategoryRepository>()));
  di.registerFactory<SingleCategoryCubit>(
      () => SingleCategoryCubit(di<CategoryRepository>()));

  di.registerLazySingleton<SinglePostCubit>(
      () => SinglePostCubit(di<SingleQuestionRepository>()));

  di.registerLazySingleton<FaqCubit>(() => FaqCubit(di<SettingRepository>()));
  di.registerLazySingleton<NotifyCubit>(
      () => NotifyCubit(di<SettingRepository>()));
  di.registerSingleton<TagCubit>(TagCubit(di<TagsRepository>()));
}
