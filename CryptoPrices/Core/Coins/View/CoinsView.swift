//
//  ContentView.swift
//  CryptoPrices
//
//  Created by Daniel Gabriel on 27/09/23.
//

import SwiftUI

// Main View
struct CoinsView: View {
	@StateObject var viewModel = CoinsViewModel()
	
	var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                CoinItemView(coin: coin)
            }
        }
        .overlay {
            if let error = viewModel.errorMessage {
                Text(error)
            }
        }
	}
}

// SubView
struct CoinItemView: View {
    let coin: CoinModel
    
    var body: some View {
        Text(coin.name)
    }
}

#Preview {
    CoinsView()
}
