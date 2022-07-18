//
//  PostPage.swift
//  OgiriSNS
//
//  Created by 宮崎直久 on 2022/04/30.
//

import SwiftUI

struct PostPage: View {
    
    // 写真投稿用の変数
    @State private var image: UIImage?
    // imagePicker用のBool値
    @State var showingImagePicker = false
    // PostSentencePage用の変数
    @State private var postSentenceModal = false
    
    var body: some View {
        VStack {
            Text("お題を投稿しよう！").padding(50)
            Button(action: { print("「文章を投稿」Buttonを押下 ");postSentenceModal.toggle() }) {
                HStack {
                    Image(systemName: "text.bubble.fill")
                    Text("文章を投稿")
                }
            }.sheet(isPresented: $postSentenceModal) {
                PostSentencePage()
            }.padding(30)
            Button(action: { print("「写真を投稿」Buttonを押下"); showingImagePicker.toggle() }) {
                HStack {
                    Image(systemName: "photo.fill")
                    Text("写真を投稿")
                }
            }.sheet(isPresented: $showingImagePicker) {
                ImagePicker(selectedImage: $image, sourceType: .photoLibrary)
            }.padding(30)
        }
    }
}

struct PostPage_Previews: PreviewProvider {
    static var previews: some View {
        PostPage()
    }
}
