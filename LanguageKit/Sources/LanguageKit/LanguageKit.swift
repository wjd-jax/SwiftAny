//
//  LanguageKit.swift
//  TOPCore
//
//  Created by Jax on 2020/6/10.
//  Copyright © 2020 TOP. All rights reserved.
//

import Foundation
import UIKit

public extension String {

    /// 国际化扩展
    var localized: String {
        LanguageManager.shared.localize(string: self, bundle: Bundle.main)
    }

    /// 带参数的国际化
    func localized(_ arguments: CVarArg...) -> String {
        LanguageManager.shared.localize(string: self, bundle: Bundle.main, arguments: arguments)
    }
}
