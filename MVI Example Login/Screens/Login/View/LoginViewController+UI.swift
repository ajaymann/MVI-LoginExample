//
//  LoginViewController+UI.swift
//  MVI Example Login
//
//  Created by Ajay Mann on 7/13/18.
//  Copyright © 2018 Ajay Mann. All rights reserved.
//

import Foundation
import SnapKit

extension LoginViewController {
    internal func setup() {
        view.backgroundColor = .white
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(loginLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(submitButton)
        view.addSubview(activityIndicator)
        view.addSubview(errorLabel)
    }
    
    private func addConstraints() {
        loginLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(80)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(loginLabel.snp.bottom).offset(32)
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(usernameTextField.snp.bottom).offset(14)
            make.height.equalTo(40)
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.55)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.centerY.equalTo(submitButton)
            make.right.equalTo(submitButton).inset(8)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(submitButton.snp.bottom).offset(12)
        }
    }
}
