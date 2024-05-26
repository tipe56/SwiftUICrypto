//
//  ContentView.swift
//  SwiftUICrypto
//
//  Created by Siarhei Ramaniuk on 22.05.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.red
                .ignoresSafeArea()
            VStack {
                Text("Color.")
                    .foregroundStyle(Color.theme.green)
            }
        }
    }
}

#Preview {
    ContentView()
}
