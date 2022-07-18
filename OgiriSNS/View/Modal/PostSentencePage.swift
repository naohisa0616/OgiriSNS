//
//  PostSentencePage.swift
//  OgiriSNS
//
//  Created by 宮崎直久 on 2022/05/04.
//

import SwiftUI

struct PostSentencePage: View {
    
    @State private var editingSentenceText = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $editingSentenceText)
                .font(.system(size: 25))
                .frame(width: 350, height: 300)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
            HStack {
                Button(action: { editingSentenceText.self = "" }) { // 文章を削除
                    Text("テキストをクリア")
                }.padding()
                Button(action: { print("Buttonを押下") }) {
                    HStack {
                        Image(systemName: "paperplane.fill")
                        Text("投稿を送る")
                    }
                }.padding()
            }
        }
    }

}

struct PostSentencePage_Previews: PreviewProvider {
    static var previews: some View {
        PostSentencePage()
    }
}
