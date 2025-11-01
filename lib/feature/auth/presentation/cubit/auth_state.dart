part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class SaveUserLoading extends AuthState {}
final class SaveUserError extends AuthState {}
final class SaveUserSuccess extends AuthState {}

