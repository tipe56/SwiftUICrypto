//
//  CoinRowView.swift
//  SwiftUICrypto
//
//  Created by Siarhei Ramaniuk on 27.05.24.
//

import SwiftUI

struct CoinRowView: View {

    let coin: CoinModel
    let showHoldingColumn: Bool

    var body: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
            Spacer()
            if showHoldingColumn {
                VStack(alignment: .trailing) {
                    Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
                        .bold()
                    Text((coin.currentHoldings ?? 0).asNumberString(decimal: 2))
                }
                .foregroundStyle(Color.theme.accent)
            }

            VStack(alignment: .trailing) {
                Text(coin.currentPrice.asCurrencyWith6Decimals())
                    .bold()
                    .foregroundStyle(Color.theme.accent)
                Text(coin.priceChangePercentage24H?.asPercentString(decimal: 2) ?? "")
                    .foregroundStyle(
                        (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                    )
            }
//            .frame(width: UIApplication.)
        }
    }
}

#Preview {
    CoinRowView(coin: .swiftUIMock.updateHoldings(amount: 1), showHoldingColumn: true)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
}
