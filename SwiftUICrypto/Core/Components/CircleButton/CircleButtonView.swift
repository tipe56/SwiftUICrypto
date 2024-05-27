//
//  CircleButtonView.swift
//  SwiftUICrypto
//
//  Created by Siarhei Ramaniuk on 26.05.24.
//

import SwiftUI

struct CircleButtonView: View {

    let iconName: String

    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background {
                Circle()
                    .foregroundStyle(Color.theme.background)
            }
            .shadow(color: Color.theme.accent.opacity(0.25),
                    radius: 10, x: 0.0, y: 0.0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {

    static var iconInfo = "info"

    static var previews: some View {
        Group {
            CircleButtonView(iconName: iconInfo)
                .previewLayout(.sizeThatFits)

            CircleButtonView(iconName: iconInfo)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

