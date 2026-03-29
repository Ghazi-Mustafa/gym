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
    setupLoginSocialDi(container: container)
    setupHomeDi(container: container)
    setupAppLayoutDi(container: container)

}

func setupLoginDi(container : DIContainer){
    container.register(FirestoreClient.self) { _ in
        return FirestoreClient()
    }
    container.register(FirebaseAuthManager.self) { resolver in
       let firestore =  resolver.resolve(FirestoreClient.self)
        return FirebaseAuthManager(firestoreClient: firestore)
    }
    container.register(LoginRemoteDataSource.self) {_ in
        return LoginRemoteDataSourceImpl()
    }
    container.register(LoginRepository.self) {resolver in
        let remoteDataSource = resolver.resolve(LoginRemoteDataSource.self)
        return LoginRepositryImplementation(remoteDataSource: remoteDataSource)
    }
    container.register(LoginWithEmailPasswordUseCase.self) {resolver in
        let repo = resolver.resolve(LoginRepository.self)
        return LoginWithEmailPasswordUseCase(repository: repo)
    }

    container.register(LoginViewModel.self) {resolver in
        let loginWithEmailAndPassUseCase = resolver.resolve(LoginWithEmailPasswordUseCase.self)
        return LoginViewModel(
            loginWithEmailPasswordUseCase: loginWithEmailAndPassUseCase)
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

func setupLoginSocialDi(container : DIContainer){
    container.register(GoogleSigninClient.self) {_ in
        GoogleSigninClient()
    }
    container.register(LoginSocialDataSource.self) { resolver in
        let googleClient = resolver.resolve(GoogleSigninClient.self)
        return LoginSocialDataSourceImpl(googleClient: googleClient)
    }
    container.register(LoginSocialsRepository.self) { resolver in
        let dataSource = resolver.resolve(LoginSocialDataSource.self)
        return LoginSocialRepositoryImpl(loginSocialDataSource: dataSource)
    }
    
    container.register(LoginWithGoogleUseCase.self) { resolver in
        let repo = resolver.resolve(LoginSocialsRepository.self)
        return LoginWithGoogleUseCase(repository: repo)
    }
    
    container.register(AuthViewModel.self) { resolver in
        let loginWithGoogleUseCase =  resolver.resolve(LoginWithGoogleUseCase.self)
        return AuthViewModel(loginWithGoogleUseCase: loginWithGoogleUseCase)
    }
}

func setupAppLayoutDi(container:DIContainer){
    container.register(AppLayoutCoordinator.self) { container in
        return AppLayoutCoordinator()
    }
}

func setupHomeDi(container:DIContainer){
    container.register(HomeViewModel.self) { container in
        return HomeViewModel()
    }
}

