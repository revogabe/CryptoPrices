//
//  CustomTab.swift
//  CryptoPrices
//
//  Created by Daniel Gabriel on 28/09/23.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace

    let tabItems: [TabItemModel] = [
        TabItemModel(title: "Home", image: "house", imageFill: "house.fill"),
        TabItemModel(title: "Market", image: "square.grid.2x2", imageFill: "square.grid.2x2.fill"),
        TabItemModel(title: "News", image: "newspaper", imageFill: "newspaper.fill"),
        TabItemModel(title: "Settings", image: "gearshape", imageFill: "gearshape.fill"),
    ]

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 120)
                .foregroundColor(Color("ui-background"))
                .shadow(color: Color("ui-background").opacity(0.6), radius: 6, y: -2)

            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("ui-secondary"))
                .offset(y: -60)

            HStack(alignment: .center) {
                ForEach(0..<4) { index in
                    Button {
                        tabSelection = index
                    } label: {
                        VStack(spacing: 8) {

                            Image(systemName: index == tabSelection ? tabItems[index].imageFill : tabItems[index].image)
                                .frame(width: index == tabSelection ? 34 : 30, height: index == tabSelection ? 34 : 30)
                                .background(index == tabSelection ? Color("ui-accent") : Color("ui-secondary"))
                                .foregroundStyle(index == tabSelection ? .white : Color("ui-foreground"))
                                .clipShape(RoundedRectangle(cornerRadius: 6))

                            Text(tabItems[index].title)
                                .foregroundStyle(index == tabSelection ? .white : Color("ui-foreground"))
                                .font(.system(size: 14))
                                .fontWeight(.semibold)

                            Spacer()
                        }
                            .padding(.horizontal)
                    }
                }
            }
                .frame(height: 80)
        }
    }
}

struct CustomTabView_Preview: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabSelection: .constant(0))
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
