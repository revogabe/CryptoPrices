//
//  CoinsModel.swift
//  CryptoPrices
//
//  Created by Daniel Gabriel on 27/09/23.
//

import Foundation

struct CoinModel: Codable, Identifiable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation, totalVolume: Int
    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double
    let marketCapChange24H, marketCapChangePercentage24H, circulatingSupply, totalSupply: Double
    let ath, athChangePercentage: Double
    let athDate: String
    let atl, atlChangePercentage: Double
    let atlDate: String
    let lastUpdated: String
    let priceChangePercentage24HInCurrency: Double

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
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
    }

}

struct MockData {
    static let sampleCoins: [CoinModel] = [
        CoinModel(
            id: "bitcoin",
            symbol: "btc",
            name: "Bitcoin",
            image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
            currentPrice: 26269,
            marketCap: 511923185720,
            marketCapRank: 1,
            fullyDilutedValuation: 551367123286,
            totalVolume: 13843415705,
            high24H: 26819,
            low24H: 26139,
            priceChange24H: 129.55,
            priceChangePercentage24H: 0.49562,
            marketCapChange24H: 2160735646,
            marketCapChangePercentage24H: 0.42387,
            circulatingSupply: 19497693,
            totalSupply: 21000000,
            ath: 69045,
            athChangePercentage: -61.97311,
            athDate: "2021-11-10T14:24:11.849Z",
            atl: 67.81,
            atlChangePercentage: 38619.90045,
            atlDate: "2013-07-06T00:00:00.000Z",
            lastUpdated: "2023-09-27T21:28:57.717Z",
            priceChangePercentage24HInCurrency: 0.4956164724991087
        ),
        CoinModel(
            id: "ethereum",
            symbol: "eth",
            name: "Ethereum",
            image: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
            currentPrice: 1594.39,
            marketCap: 191673944170,
            marketCapRank: 2,
            fullyDilutedValuation: 191673944170,
            totalVolume: 9184868952,
            high24H: 1631.64,
            low24H: 1586.59,
            priceChange24H: 7.09,
            priceChangePercentage24H: 0.44668,
            marketCapChange24H: 931106519,
            marketCapChangePercentage24H: 0.48815,
            circulatingSupply: 120233867.541488,
            totalSupply: 120233867.541488,
            ath: 4878.26,
            athChangePercentage: -67.32063,
            athDate: "2021-11-10T14:24:19.604Z",
            atl: 0.432979,
            atlChangePercentage: 368089.97492,
            atlDate: "2015-10-20T00:00:00.000Z",
            lastUpdated: "2023-09-27T21:28:50.669Z",
            priceChangePercentage24HInCurrency: 0.44668014472264644
        ),
        CoinModel(
            id: "tether",
            symbol: "usdt",
            name: "Tether",
            image: "https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663",
            currentPrice: 0.999348,
            marketCap: 83204637415,
            marketCapRank: 3,
            fullyDilutedValuation: 83204637415,
            totalVolume: 19233007800,
            high24H: 1.001,
            low24H: 0.997228,
            priceChange24H: 0.00001088,
            priceChangePercentage24H: 0.00109,
            marketCapChange24H: 32871294,
            marketCapChangePercentage24H: 0.03952,
            circulatingSupply: 83266848432.5498,
            totalSupply: 83266848432.5498,
            ath: 1.32,
            athChangePercentage: -24.47612,
            athDate: "2018-07-24T00:00:00.000Z",
            atl: 0.572521,
            atlChangePercentage: 74.53558,
            atlDate: "2015-03-02T00:00:00.000Z",
            lastUpdated: "2023-09-27T21:25:00.542Z",
            priceChangePercentage24HInCurrency: 0.0010891083597856619
        ),
    ]

}

