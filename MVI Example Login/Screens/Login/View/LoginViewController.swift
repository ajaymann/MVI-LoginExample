//
//  LoginViewController.swift
//  MVI Example Login
//
//  Created by Ajay Mann on 7/13/18.
//  Copyright © 2018 Ajay Mann. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift

class LoginViewController: UIViewController, View {
    
    // MARK: Properties
    
    internal var disposeBag: DisposeBag = DisposeBag()
    
    // MARK: UI Elements
    internal lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    internal lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "username"
        textField.font = .systemFont(ofSize: 16)
        return textField
    }()
    
    internal lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        textField.font = .systemFont(ofSize: 16)
        return textField
    }()
    
    internal lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
        return button
    }()
    
    internal lazy var activityIndicator: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .white)
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }()
    
    internal lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .red
        return label
    }()
    
    // MARK: Init Methods
    
    init(reactor: LoginReactor) {
        defer { self.reactor = reactor }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func bind(reactor: LoginReactor) {
        bindActions(reactor: reactor)
        bindState(reactor: reactor)
    }
    
}

