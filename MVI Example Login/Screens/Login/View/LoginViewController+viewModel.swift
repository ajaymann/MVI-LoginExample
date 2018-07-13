//
//  LoginViewController+viewModel.swift
//  MVI Example Login
//
//  Created by Ajay Mann on 7/13/18.
//  Copyright © 2018 Ajay Mann. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxSwiftExt

extension LoginViewController {
    internal func bindActions(reactor: LoginReactor) {
        bindSubmitButtonTap(reactor: reactor)
    }
    
    private func bindSubmitButtonTap(reactor: LoginReactor) {
        submitButton.rx.tap
            .map { [weak self] _ -> (String?, String?)? in
                guard let strongSelf = self else { return nil }
                return (strongSelf.usernameTextField.text, strongSelf.passwordTextField.text)
            }
            .unwrap()
            .do(onNext: { [weak self] _ in
                guard let strongSelf = self else { return }
                strongSelf.activityIndicator.startAnimating()
            })
            .map { params in .login(username: params.0, password: params.1) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    internal func bindState(reactor: LoginReactor) {
        reactor.state.map { $0.loggedIn }
            .unwrap()
            .filter { $0 }
            .mapTo("Logged in!")
            .bind(to: errorLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.errorMessage }
            .unwrap()
            .bind(to: errorLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.loggedIn }
            .unwrap()
            .not()
            .bind(to: activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.errorMessage }
            .unwrap()
            .mapTo(false)
            .bind(to: activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}
