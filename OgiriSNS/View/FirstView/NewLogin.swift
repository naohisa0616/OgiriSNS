import SwiftUI
import FirebaseAuth

struct NewLogin: View {
    @State public var mail: String = ""
    @State public var password:String = ""
    @State public var errorMessage:String = ""
    
    var body: some View {
        
        // TODO: ①新規会員登録
        VStack(spacing: 30) {
            // メールアドレス
            TextField("メールアドレスを入力してください", text: $mail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // パスワード
            SecureField("パスワードを入力してください",text:$password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // 認証
            Button(
                action:{
                    if(self.mail == ""){
                        self.errorMessage = "メールアドレスが入力されていません"
                    } else if(self.password == ""){
                        self.errorMessage = "パスワードが入力されていません"
                    } else {
                        Auth.auth().createUser(withEmail: self.mail, password: self.password) { authResult, error in
                           print(authResult)
                        }
                    }
                }, label: {
                    Text("新規会員登録する")
            })
            
        }
        
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        NewLogin()
    }
}
