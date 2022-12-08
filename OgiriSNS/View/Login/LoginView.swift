//
//  LoginView.swift
//  OgiriSNS
//
//  Created by 宮崎直久 on 2022/05/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    // Home画面への遷移用の変数
    @State private var transitionToHomeScreen = false
    @State public var mail:String = ""
    @State public var password:String = ""
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Text("大喜利SNS Login")
                    .padding()
                Text("ユーザーID")
                    .padding()
                TextField("メールアドレスを入力してください",text: $viewModel.id)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Text("パスワード")
                    .padding()
                SecureField("パスワードを入力してください",text:$viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {
                    // ボタンが選択されたことをLoginViewModelの変数isLoginButtonTappedに通知
                    viewModel.isLoginButtonTapped = true
                }) {
                    HStack {
                        Image(systemName: "arrowtriangle.forward.fill")
                        Text("ログイン")
                    }
                }
                .padding(30)
                // ボタンの有効/無効状態に合わせて背景の色を変更
                .background(viewModel.isValidId && viewModel.isValidPassword ? Color.black : Color.gray)
                .cornerRadius(10, antialiased: true)
                // IDとパスワードがどちらも半角英数で入力されていればボタンを有効にする
                .disabled(!viewModel.isValidId || !viewModel.isValidPassword)
                NavigationLink(destination: NewLogin(),
                               isActive: $viewModel.isLoginButtonTapped){
                    EmptyView()
                }
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
