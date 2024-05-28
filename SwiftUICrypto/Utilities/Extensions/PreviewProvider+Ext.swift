//
//  PreviewProvider+Ext.swift
//  SwiftUICrypto
//
//  Created by Siarhei Ramaniuk on 27.05.24.
//

import SwiftUI

extension PreviewProvider {

    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }

}

class DeveloperPreview {

    static let instance = DeveloperPreview()

    private init() { }

    let coin = CoinModel.swiftUIMock
}
