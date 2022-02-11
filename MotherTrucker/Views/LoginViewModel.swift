//
//  LoginView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/7/22.
//

import Foundation
import UIKit

class LoginViewModel: ObservableObject {
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    @Published var error: Authentication.AuthenticationError?
    
    var loginDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    func login(compeletion: @escaping (Bool) -> Void) {
        showProgressView = true
        APIService.shared.login(credentials: credentials) {
            [unowned self]
            (result:Result<Bool, Authentication.AuthenticationError>) in
            showProgressView = false
            switch result {
            case.success:
                compeletion(true)
            case.failure(let authError):
                credentials = Credentials()
                error = authError
                compeletion(false)
            }
        }
    }
}
