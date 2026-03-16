//
//  SetupDi.swift
//  gymx
//
//  Created by Mustafa Ghazi on 11/03/26.
//


func setupDi(){
    let container = DIContainer.shared
    setupLoginDi(container: container)
    setupSignupDi(container: container)

}

func setupLoginDi(container : DIContainer){
    container.register(GoogleSigninClient.self) {_ in
        GoogleSigninClient()
    }
    container.register(LoginRemoteDataSource.self) {resolver in
        let googleClient = resolver.resolve(GoogleSigninClient.self)
        return LoginRemoteDataSourceImpl(googleClient: googleClient)
    }
    container.register(LoginRepository.self) {resolver in
        let remoteDataSource = resolver.resolve(LoginRemoteDataSource.self)
        return LoginRepositryImplementation(remoteDataSource: remoteDataSource)
    }
    container.register(LoginWithEmailPasswordUseCase.self) {resolver in
        let repo = resolver.resolve(LoginRepository.self)
        return LoginWithEmailPasswordUseCase(repository: repo)
    }
    container.register(LoginWithGoogleUseCase.self) {resolver in
        let repo = resolver.resolve(LoginRepository.self)
        return LoginWithGoogleUseCase(repository: repo)
    }
    container.register(LoginViewModel.self) {resolver in
        let loginWithEmailAndPassUseCase = resolver.resolve(LoginWithEmailPasswordUseCase.self)
        let loginWithGoogle = resolver.resolve(LoginWithGoogleUseCase.self)
        return LoginViewModel(
            loginWithEmailPasswordUseCase: loginWithEmailAndPassUseCase,
            loginWithGoogleUseCase: loginWithGoogle)
    }
}

func setupSignupDi(container : DIContainer){
    container.register(SignupRemoteDataSource.self) { _ in
        return SignupRemoteDataSourceImpl()
    }
    container.register(SignupRepo.self) { resolver in
        let remoteDataSource = resolver.resolve(SignupRemoteDataSource.self)
        return SignupRepoImpl(remoteDataSource: remoteDataSource)
    }
    container.register(SignupWithEmailUseCase.self) { resolver in
        let repoImp = resolver.resolve(SignupRepo.self)
        return SignupWithEmailUseCase(repository: repoImp)
    }
    container.register(SignupViewModel.self) { resolver in
        let useCase = resolver.resolve(SignupWithEmailUseCase.self)
        return SignupViewModel(signupWithEmailUseCase: useCase)
    }
}
