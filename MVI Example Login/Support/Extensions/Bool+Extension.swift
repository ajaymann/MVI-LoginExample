//
//  Bool+Extension.swift
//  MVI Example Login
//
//  Created by Ajay Mann on 7/13/18.
//  Copyright © 2018 Ajay Mann. All rights reserved.
//

import Foundation

extension Bool {
    static func random() -> Bool {
        return arc4random_uniform(2) == 0
    }
}
