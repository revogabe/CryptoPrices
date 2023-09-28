//
//  CustomTab.swift
//  CryptoPrices
//
//  Created by Daniel Gabriel on 28/09/23.
//

import SwiftUI
import Foundation

struct TabItemModel: Codable {
    var title: String
    var image: String
    var imagefill: String
}

struct CustomTabView: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace

    let tabBarItems: [(title: String, image: String, imageSelect: String)] = [
        ("Home", "house", "house.fill"),
        ("Home", "house", "house.fill"),
        ("Home", "house", "house.fill"),
        ("Home", "house", "house.fill")
    ]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 80)
                .foregroundColor(Color("backgroundColor"))
                .shadow(radius: 8)

            HStack(alignment: .center) {
                ForEach(0..<4) { index in
                    Button {
                        tabSelection = index
                    } label: {
                        VStack(spacing: 8) {
                            Spacer()

                            Image(systemName: index == tabSelection ? tabBarItems[index].imageSelect : tabBarItems[index].image)
                                .frame(width: 30, height: 30)
                                .background(index == tabSelection ? Color("accentColor") : Color("secondaryColor"))
                                .foregroundStyle(index == tabSelection ? .white : Color("foregroundColor"))
                                .clipShape(RoundedRectangle(cornerRadius: 6))

                            Text(tabBarItems[index].title)
                                .foregroundStyle(index == tabSelection ? .white : Color("foregroundColor"))
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
            .padding(.horizontal)
    }
}

struct CustomTabView_Preview: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabSelection: .constant(0))
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
