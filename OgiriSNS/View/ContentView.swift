//
//  ContentView.swift
//  OgiriSNS
//
//  Created by 宮崎直久 on 2022/04/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView{
            HomePage() //1枚目の子ビュー
                .tabItem {
                    Image(systemName: "1.circle.fill")
                }
            HotLaughterPage() //2枚目の子ビュー
                .tabItem {
                    Image(systemName: "2.circle.fill")
                }
            RankingPage() //3枚目の子ビュー
                .tabItem {
                    Image(systemName: "3.circle.fill")
                }
            NewUsersPage() //3枚目の子ビュー
                .tabItem {
                    Image(systemName: "4.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
