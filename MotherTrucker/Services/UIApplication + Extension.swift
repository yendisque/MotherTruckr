//
//  UIApplication + Extension.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/7/22.
//

import UIKit

extension UIApplication
{
    func endEditing()
    {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
