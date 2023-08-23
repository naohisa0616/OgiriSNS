import Foundation
import Firebase


class LoginModel {
    var password: String?
    var email: String?
    
    func setUserInfo(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func loginUserInfo(Success: @escaping () -> Void, Error: @escaping () -> Void) {
        guard let email = email,
              let password = password else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else {
                return
            }
            
            if let error = error {
                print("ログイン失敗: \(error)")
                Error()
            }
            
            guard let user = authResult?.user else {
                print("ログイン失敗")
                Error()
                return
            }
            
            print("ログイン完了 uid:" + user.uid)
            Success()
        }
    }
}
