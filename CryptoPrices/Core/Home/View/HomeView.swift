//
//  HomeView.swift
//  CryptoPrices
//
//  Created by Daniel Gabriel on 27/09/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = 1

    var body: some View {
        TabView(selection: $selection) {
            ZStack {
                Color("ui-background")
                    .ignoresSafeArea(.all)
                Text("Tela 2")
                    .foregroundStyle(Color("ui-foreground"))

            }
                .tag(0)

            CoinsListView()
                .tag(1)

            ZStack {
                Color("ui-background")
                    .ignoresSafeArea(.all)
                
                Text("Tela 3")
                    .foregroundStyle(Color("ui-foreground"))

            }
                .tag(2)

            ZStack {
                Color("ui-background")
                    .ignoresSafeArea(.all)
                Text("Tela 4")
                    .foregroundStyle(Color("ui-foreground"))

            }
                .tag(3)

        }
            .overlay(alignment: .bottom) {
            CustomTabView(tabSelection: $selection)
        }
            .ignoresSafeArea(.all)
    }
}

#Preview {
    HomeView()
}
