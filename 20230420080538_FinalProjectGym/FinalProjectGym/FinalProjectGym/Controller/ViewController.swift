import UIKit


class ViewController: UIViewController {


    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
   
    
    private var loggedUser: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserProvider.generateMockData()
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == Segue.toSignUpViewController {
            return true
        }
        
        guard let username = txtUsername.text, let password = txtPassword.text else {
            print("Something is wrong!!!")
            return false
        }
        
        if let user = UserProvider.find(id: nil, username: username){
            if user.password == password {
                self.loggedUser = user
                return true
            } else {
                print("Wrong password!")
                return false
            }
        } else {
            print("User not found!!")
            return false
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toTaskViewController {
            let secondViewController = segue.destination as! GymTaskViewController
            secondViewController.loggedUser = self.loggedUser
        }
    }
     
}
