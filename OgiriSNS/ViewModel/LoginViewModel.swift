//
//  LoginViewModel.swift
//  OgiriSNS
//
//  Created by 宮崎直久 on 2022/05/28.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var id: String = ""
    @Published var password: String = ""
    // TextFieldに入力した文字が半角英数かどうか判別する変数
    @Published var isValidId: Bool = false
    @Published var isValidPassword: Bool = false
    
    @Published var isLoginButtonTapped: Bool = false
    
    // SubscriberはPublisherの購読を終了
    private var disposables = [AnyCancellable]()
    
    init() {
        $id
            .sink(receiveValue: {
                self.isValidId = $0.isAlphanumeric && !$0.isEmpty ? true : false
            })
            .store(in: &disposables)
        
        $password
            .sink(receiveValue: {
                self.isValidPassword = $0.isAlphanumeric && !$0.isEmpty ? true : false
            })
            .store(in: &disposables)
        
        $isLoginButtonTapped
            .sink(receiveValue: { isTapped in
                if isTapped == true {
                    print("ここでログイン処理を呼び出す")
                }
            })
            .store(in: &disposables)
    }
    
    
}

extension String {
    // 半角英数かどうか判別
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}
