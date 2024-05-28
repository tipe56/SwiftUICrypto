//
//  Coin.swift
//  SwiftUICrypto
//
//  Created by Siarhei Ramaniuk on 27.05.24.
//

import Foundation

// Coin Gecko API Info:
/*
 curl --request GET \
      --url 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h' \
      --header 'accept: application/json' \
      --header 'x-cg-demo-api-key: CG-ikuGwVrPLfkyczRLj3z9cZoQ'

*/


struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String?
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?

    var currentHoldingsValue: Double {
        currentPrice * (currentHoldings ?? 0)
    }

    var rank: Int {
        Int(marketCapRank ?? 0)
    }

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }

    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}


#if DEBUG
extension CoinModel {
    static var swiftUIMock: CoinModel {
        let data = uiMock.data(using: String.Encoding.utf8)!
        let suData = try! JSONDecoder().decode(CoinModel.self, from: data)
        return suData
    }
}

private let uiMock = """
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 70164,
     "market_cap": 1382249757185,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1473141313538,
     "total_volume": 18613601831,
     "high_24h": 70602,
     "low_24h": 68256,
     "price_change_24h": 1434.38,
     "price_change_percentage_24h": 2.087,
     "market_cap_change_24h": 26715506752,
     "market_cap_change_percentage_24h": 1.97085,
     "circulating_supply": 19704318,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 73738,
     "ath_change_percentage": -4.86094,
     "ath_date": "2024-03-14T07:10:36.635Z",
     "atl": 67.81,
     "atl_change_percentage": 103357.62769,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2024-05-27T18:02:16.034Z",
     "sparkline_in_7d": {
       "price": [
         67004.79188347509,
         66942.83800825503,
         67077.79216279765,
         67014.3702652234,
         67381.92303601895,
         68180.54404758656
       ]
     },
     "price_change_percentage_24h_in_currency": 2.086999039962819
   }
"""

#endif
