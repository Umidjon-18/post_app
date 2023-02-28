import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/failure.dart';

abstract class Cache<Type, Params> {
  Future<void> save(Params params);
  Future<void> saveSelecteds(Params params);
  Future<Either<Failure, Type>> getSaveds(Params params);
  Future<Either<Failure, Type>> deleteSaved(Params params);
  Future<Either<Failure, Type>> deleteSelectedSaveds(Params params);
}
