//
//  ImagePicker.swift
//  OgiriSNS
//
//  Created by 宮崎直久 on 2022/04/29.
//

import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    // ImagePickerに選択画像のバインディング変数
    @Binding var selectedImage: UIImage?
    //画面を閉じるための環境変数
    @Environment(\.presentationMode) private var presentationMode
    
    // makeUIViewController で初期化処理
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        // 読み込み元のタイプ
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        // 管理するUIKitのビューを格納する変数
        var parent: ImagePicker
        
        // 変数にUIKitのビューを渡すイニシャライザ
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        // フォトライブラリ画面で画像をタップ(イベント)して選択した後の処理
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
