//
//  DiContainer.swift
//  gymx
//
//  Created by Mustafa Ghazi on 11/03/26.
//

final class DIContainer {
    static let shared = DIContainer()
    
    private var registry: [String: (DIContainer) -> Any] = [:]

    private init() {}


    func register<T>(_ type: T.Type, factory: @escaping (DIContainer) -> T) {
        registry[String(describing: type)] = factory
    }

    func resolve<T>(_ type: T.Type) -> T {
        guard let factory = registry[String(describing: type)],
              let instance = factory(self) as? T
        else { fatalError("No registration for \(type)") }
        return instance
    }
}
