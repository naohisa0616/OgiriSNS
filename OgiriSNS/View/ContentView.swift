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
                    Image(systemName: "note.text")
                    Text("お題")
                }
            HotLaughterPage() //2枚目の子ビュー
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("週間お題イベント")
                }
            RankingPage() //3枚目の子ビュー
                .tabItem {
                    Image(systemName: "crown.fill")
                    Text("ランキング")
                }
            NewUsersPage() //3枚目の子ビュー
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("新しいユーザー")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
