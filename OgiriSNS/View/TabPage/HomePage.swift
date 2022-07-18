//
//  HomePage.swift
//  OgiriSNS
//
//  Created by 宮崎直久 on 2022/04/23.
//

import SwiftUI

struct HomePage: View {
    
    @State var fruits = [
        "Apple 🍎", "Orange 🍊", "Banana 🍌", "Grape 🍇", "strawberry 🍓"
    ]
    
    @State private var profielModal = false
    @State private var postModal = false
    
    var body: some View {
        NavigationView {
            // 1-1. Buttonが手前に来るようにZStackを作る
            ZStack {
                ScrollView {
                    // ここにメインのUIを配置する。下記はSample。
                    VStack {
                        ForEach(0..<fruits.count) { num in
                            Text("\(fruits[num])")
                        }
                        .font(.system(size: 40))
                        .foregroundColor(.gray)
                        .frame(width: 340, height: 150)
                        .background(Color(red: 0.93, green: 0.94, blue: 0.95, opacity: 0.5))
                        .padding(10)
                    }
                }
                // 1-2. FloatingButtonをZStackで手前側に配置
                floatingButton
            }
            .navigationTitle("List")
        }
    }
    
    var floatingButton: some View {
        VStack {
            // ButtonをViewの下方に配置
            Spacer()
            HStack {
                Button(action: { print("PersonButtonを押下");self.profielModal.toggle()}) {
                    // Buttonのデザインを作成。Personを配置。
                    Image(systemName: "person.fill")
                    // Fontサイズ
                        .font(.system(size: 24))
                    // Buttonの文字色
                        .foregroundColor(.white)
                    // Buttonのサイズ
                        .frame(width: 60, height: 60)
                    // Buttonの色
                        .background(Color.blue)
                    // Buttonの角の丸み
                        .cornerRadius(30.0)
                    // Buttonの陰
                        .shadow(color: .gray, radius: 3, x: 3, y: 3)
                    // Buttonの端からViewの端までの距離
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 16.0, trailing: 0))
                }.sheet(isPresented: $profielModal) {
                    SettingPage()
                }
                // Viewの右方に配置
                Spacer()
                Button(action: {
                    // ボタンを押した時のアクションを記載
                    print("PlusButtonを押下");self.postModal.toggle()
                }) {
                    // Buttonのデザインを作成。記号の"+"を配置。
                    Image(systemName: "plus.circle.fill")
                        // Fontサイズ
                        .font(.system(size: 24))
                        // Buttonの文字色
                        .foregroundColor(.white)
                        // Buttonのサイズ
                        .frame(width: 60, height: 60)
                        // Buttonの色
                        .background(Color.blue)
                        // Buttonの角の丸み
                        .cornerRadius(30.0)
                        // Buttonの陰
                        .shadow(color: .gray, radius: 3, x: 3, y: 3)
                        // Buttonの端からViewの端までの距離
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 20))
                }.sheet(isPresented: $postModal) {
                    PostPage()
                }
            }
        }
    }
    
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
