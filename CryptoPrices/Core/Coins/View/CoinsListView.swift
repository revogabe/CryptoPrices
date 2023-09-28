//
//  ContentView.swift
//  CryptoPrices
//
//  Created by Daniel Gabriel on 27/09/23.
//

import SwiftUI

// Main View
struct CoinsListView: View {
    @StateObject var viewModel = CoinsViewModel()
    @State private var isShowingSafariView = false
    @State private var searchText = ""

    var filteredCoins: [CoinModel] {
        guard !searchText.isEmpty else { return viewModel.mockData }
        return viewModel.coins.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    init () {
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(filteredCoins) { coin in
                        CoinItemView(coin: coin)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {
                                print("Favorite: \(coin.id)")
                            } label: {
                                Label("Favoritar", systemImage: "star.fill")
                                    .tint(Color.orange)
                            }
                        }
                            .onTapGesture {
                            viewModel.coinID = coin.id
                            isShowingSafariView = true
                        }
                    }
                        .listRowBackground(Color("ui-secondary"))

                }
            }
                .navigationBarTitle("Market", displayMode: .automatic)
                .searchable(text: $searchText, placement: .toolbar, prompt: "Search for crypto")
                .listRowSpacing(12)
                .sheet(isPresented: $isShowingSafariView) {
                SafariView(url: URL(string: "https://www.coingecko.com/en/coins/\(viewModel.coinID)")!)
            }
                .scrollContentBackground(.hidden)
                .background {
                Color("ui-background")
                    .ignoresSafeArea(.all)
            }

        }
    }
}



// SubView
struct CoinItemView: View {
    let coin: CoinModel


    var body: some View {
        let formattedPrice = formatPrice(coin.currentPrice, currencySymbol: "$")
        let percentPrice = percentChange(coin.priceChangePercentage24H)

        HStack(alignment: .center, spacing: 18) {
            // Async Image for fetch images
            AsyncImage(url: URL(string: coin.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .foregroundColor(Color(.label).opacity(0.5))
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                @unknown default:
                    EmptyView()
                }

            }

            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                Text("\(coin.symbol) - Rank #\(coin.marketCapRank)")
                    .textCase(.uppercase)
                    .foregroundColor(Color(.label).opacity(0.6))
                    .font(.system(size: 12))
            }

            Spacer()

            VStack(alignment: .trailing) {
                Text(formattedPrice)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                HStack(alignment: .center, spacing: 6) {
                    if coin.priceChangePercentage24H >= 0 {
                        Image(systemName: "chevron.up")
                            .resizable()
                            .foregroundStyle(.green)
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                    } else {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .foregroundStyle(.red)
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                    }

                    Text("\(percentPrice)%")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundStyle(coin.priceChangePercentage24H >= 0 ? .green : .red)
                }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(coin.priceChangePercentage24H >= 0 ? .green.opacity(0.1) : .red.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 4))

            }
        }
    }

    func percentChange(_ percent: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2

        return numberFormatter.string(from: NSNumber(value: percent)) ?? ""
    }

    func formatPrice(_ price: Double, currencySymbol: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.currencySymbol = currencySymbol

        if let result = numberFormatter.string(from: NSNumber(value: price)) {
            return result
        } else {
            return ""
        }
    }
}



#Preview {
    CoinsListView()
}
