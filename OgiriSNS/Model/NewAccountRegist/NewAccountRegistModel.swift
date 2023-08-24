//
//  NewAccountRegistModel.swift
//  OgiriSNS
//
//  Created by 宮崎直久 on 2023/08/24.
//

import Foundation
import Firebase

class NewAccountRegistModel {
    
    /// 新規アカウント登録
    func registUserInfo(userName: String,
                        email: String,
                        password: String,
                        Success: @escaping () -> Void,
                        Error: @escaping (String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
            if let error = error {
                print("Firebase Auth 新規登録失敗 errorInfo: " + error.localizedDescription)
                Error(error.localizedDescription)
            }
            
            if let user = result?.user {
                print("ユーザー作成完了 uid: " + user.uid)
                Firestore.firestore().collection("users").document(user.uid).setData([
                    "userName": userName
                ], completion: { error in
                    if let error = error {
                        print("Firestore 新規登録失敗 errorInfo: " + error.localizedDescription)
                        Error(error.localizedDescription)
                    } else {
                        print("ユーザー作成完了 userName: " + userName)
                        Success()
                    }
                })
            }
        })
    }
}
