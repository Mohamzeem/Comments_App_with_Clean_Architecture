import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'features/comments/data/datasources/local_data_source.dart';
import 'features/comments/data/datasources/remote_data_source.dart';
import 'features/comments/data/repositories/comments_repository_impl.dart';
import 'features/comments/domain/repositories/comments_repository.dart';
import 'features/comments/domain/usecases/add_comment.dart';
import 'features/comments/domain/usecases/delete_comment.dart';
import 'features/comments/domain/usecases/get_all_comments.dart';
import 'features/comments/domain/usecases/update_comment.dart';
import 'features/comments/presentation/bloc/add_upd_del_bloc/add_upd_del_bloc.dart';
import 'package:http/http.dart' as http;
import 'features/comments/presentation/bloc/comments_bloc/comments_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CommentsBloc(getAllCommentsUseCase: sl()));
  sl.registerFactory(() => AddUpdDelBloc(
      addCommentUseCase: sl(),
      updateCommentUseCase: sl(),
      deleteCommentUseCase: sl()));

  sl.registerLazySingleton(
      () => GetAllCommentsUseCase(commentsRepository: sl()));
  sl.registerLazySingleton(() => AddCommentUseCase(commentsRepository: sl()));
  sl.registerLazySingleton(
      () => UpdateCommentUseCase(commentsRepository: sl()));
  sl.registerLazySingleton(
      () => DeleteCommentUseCase(commentsRepository: sl()));

  sl.registerLazySingleton<CommentsRepository>(() => CommentsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetWorkInfoImpl(internetConnectionChecker: sl()));

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));
  // sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
