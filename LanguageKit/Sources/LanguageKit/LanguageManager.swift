//
//  LanguageManager.swift
//  TOPCore
//
//  Created by Jax on 2020/6/10.
//  Copyright © 2020 TOP. All rights reserved.
//  设置语言并且切换

import Foundation

public class LanguageManager {
    public static let shared = LanguageManager()
    private static let userDefaultsKey = "current_language"
    private static let defautLanguage = "en"

    init() {
        currentLanguage = LanguageManager.storedCurrentLanguage ?? LanguageManager.defautLanguage
    }

    /// 可用的语言
    public static var availableLanguages: [String] {
        Bundle.main.localizations.sorted()
    }

    /// 当前语言
    public var currentLanguage: String {
        didSet {
            storeCurrentLanguage()
        }
    }

    /// 当前语言展示的名字
    public var currentLanguageDisplayName: String? {
        displayName(language: currentLanguage)
    }

    /// 根据语言国际化展示的名字
    public func displayName(language: String) -> String? {
        (currentLocale as NSLocale).displayName(forKey: NSLocale.Key.identifier, value: language)?.capitalized
    }
    /// 原始语言显示名称
    public static func nativeDisplayName(language: String) -> String? {
        let locale = NSLocale(localeIdentifier: language)
        return locale.displayName(forKey: NSLocale.Key.identifier, value: language)?.capitalized
    }
}

extension LanguageManager {

    /// 存储当前语言
    private func storeCurrentLanguage() {
        UserDefaults.standard.set(currentLanguage, forKey: LanguageManager.userDefaultsKey)
    }

    /// 获取存设置的语言
    private static var storedCurrentLanguage: String? {
        UserDefaults.standard.value(forKey: userDefaultsKey) as? String
    }

    /// 推荐语言
    private static var preferredLanguage: String? {
        Bundle.main.preferredLocalizations.first { availableLanguages.contains($0) }
    }
}

extension LanguageManager {

    public var currentLocale: Locale {
        Locale(identifier: currentLanguage)
    }
}

extension LanguageManager {

    public func localize(string: String, bundle: Bundle?) -> String {
        if let languageBundleUrl = bundle?.url(forResource: currentLanguage, withExtension: "lproj"), let languageBundle = Bundle(url: languageBundleUrl) {
            return languageBundle.localizedString(forKey: string, value: nil, table: nil)
        }

        return string
    }

    public func localize(string: String, bundle: Bundle?, arguments: [CVarArg]) -> String {
        String(format: localize(string: string, bundle: bundle), locale: currentLocale, arguments: arguments)
    }
}

