//
//  APIService.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/7/22.
//

import Foundation

class APIService
{
    static let shared = APIService()
    
    func login(credentials: Credentials,
               compelation: @escaping (Result<Bool,Authentication.AuthenticationError>) -> Void)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
        {
            if credentials.password == "password"
            {
                compelation(.success(true))
            } else
            {
                compelation(.failure(.invalidCredentials))
            }
        }
    }
}

