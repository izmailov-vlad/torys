part of domain;

@Injectable()
class GoogleLoginUseCase implements UseCase<GoogleAuthUiModel?, NoParams> {
  final GoogleAuthRepository _googleAuthRepository;

  GoogleLoginUseCase(this._googleAuthRepository);

  @override
  Future<GoogleAuthUiModel?> call(NoParams params) async {
    final result = await _googleAuthRepository.login();
    return result?.toUiModel();
  }
}
