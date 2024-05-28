//
//  UIApplication+Ext.swift
//  SwiftUICrypto
//
//  Created by Siarhei Ramaniuk on 28.05.24.
//

import UIKit

extension UIApplication {
    static var topSafeAreaHeight: CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.safeAreaLayoutGuide.layoutFrame.minY ?? 0
    }

    static var bottomSafeAreaHeight: CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.safeAreaInsets.bottom ?? 0
    }

    static var screenBounds: CGRect? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.bounds
    }
}
