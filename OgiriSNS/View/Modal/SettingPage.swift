//
//  SettingPage.swift
//  OgiriSNS
//
//  Created by 宮崎直久 on 2022/04/24.
//

import UIKit
import SwiftUI

struct SettingPage: View {
    
    @State private var image: UIImage?
    // imagePicker用のBool値
    @State var showingImagePicker = false
    @State private var userName = ""
    @State private var editingText = ""
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                if let uiImage = image {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }

                Button(action: { print("PencilButtonを押下"); showingImagePicker.toggle() }) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 50)
                }.sheet(isPresented: $showingImagePicker) {
                    ImagePicker(selectedImage: $image, sourceType: .photoLibrary)
                }
            }.padding(25)
            
            HStack {
                Text("もらった笑い:")
                Label("○件", image: "")
                    .padding()
                Text("投稿:")
                Label("○件", image: "")
            }
            HStack {
                Text("ボケ:")
                Label("○件", image: "")
                    .padding()
                Text("笑ったボケ:")
                Label("○件", image: "")
            }
            
            HStack {
                Text("フォロワー:")
                Label("○人", image: "")
                    .padding()
                Text("フォロー:")
                Label("○人", image: "")
            }
            
            VStack {
                Text("ユーザー名")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("", text: $userName)
                    .font(.system(size: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding()
                Text("自己紹介")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextEditor(text: $editingText)
                    .font(.system(size: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding()
            }
        }
    }
}

struct SettingPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage()
    }
}
