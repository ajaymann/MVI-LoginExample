//
//  LoginReactor.swift
//  MVI Example Login
//
//  Created by Ajay Mann on 7/13/18.
//  Copyright © 2018 Ajay Mann. All rights reserved.
//

import Foundation
import RxSwift
import ReactorKit

final class LoginReactor: Reactor {
    enum Action {
        case login(username: String?, password: String?)
    }
    
    enum Mutation {
        case setLoggedIn
        case showError(message: String)
    }
    
    struct State {
        var loggedIn: Bool?
        var errorMessage: String?
    }
    
    var initialState: LoginReactor.State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .login(username: username, password: password):
            return mutateLoggingin(username: username, password: password)
        }
    }
    
    private func mutateLoggingin(username: String?, password: String?) -> Observable<Mutation> {
        guard let `username` = username, !username.isEmpty else {
            return .just(.showError(message: "Please enter a username"))
        }
        
        guard let `password` = password, password.count > 5 else {
            return .just(.showError(message: "Password length should be greater than 5"))
        }
        let loggedIn = Bool.random()
        if loggedIn {
            return Observable.just(.setLoggedIn)
                .delay(2, scheduler: MainScheduler.instance)
        } else {
            return Observable.just(.showError(message: "Sorry! Could not log-in"))
                .delay(2, scheduler: MainScheduler.instance)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        state.loggedIn = nil
        state.errorMessage = nil
        switch mutation {
        case .setLoggedIn:
            state.loggedIn = true
        case let .showError(message: errorMessage):
            state.errorMessage = errorMessage
        }
        return state
    }
}
