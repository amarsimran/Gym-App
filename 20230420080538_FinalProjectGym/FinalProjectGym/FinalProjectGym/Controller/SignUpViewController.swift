import UIKit

class SignUpViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var btnPasswordVisibility: UIButton!
    @IBOutlet weak var pickerDob: UIPickerView!
    @IBOutlet weak var lblDob: UILabel!
    
    let dobDataSource: [[String]] = [
        Array(1...31).map { String($0)},
        Array(1...12).map { String($0)},
        Array(1950...2023).map { String($0)}
    ]
    
    @IBAction func btnPasswordVisibilityTouchUpInside(_ sender: Any) {
        
        if txtPassword.isSecureTextEntry {
            btnPasswordVisibility.setImage(UIImage(systemName: "eye.slash"), for: UIControl.State.normal)
        } else {
            btnPasswordVisibility.setImage(UIImage(systemName: "eye"), for: .normal)
        }
        txtPassword.isSecureTextEntry.toggle()
        
        
    }
    
    @IBAction func btnRegisterTouchUpInside(_ sender: Any) {
        
        let day = pickerDob.selectedRow(inComponent: 0)+1
        let month = pickerDob.selectedRow(inComponent: 1)+1
        let year = pickerDob.selectedRow(inComponent: 2)+1950
        let dob = "\(day)/\(month)/\(year)"
        
        guard let username = txtUsername.text,  let password = txtPassword.text else {
            Toast.ok(view: self, title: "Ooops!", message: "Something is wrong!", handler: nil)
            return
        }
        
        if username.isEmpty {
            Toast.ok(view: self, title: "Ooops!", message: "Please, enter a valid username.", handler: { action in
                self.txtUsername.becomeFirstResponder()
            })
            return
        }

        
        
        if password.isEmpty {
            Toast.ok(view: self, title: "Ooops!", message: "Please, enter a secure password.", handler: { action in
                self.txtPassword.becomeFirstResponder()
            })
            return
        }
        
        
       
        if UserProvider.find(id: nil, username: username) != nil{
            Toast.ok(view: self, title: "Ooops!", message: "The username \(username) is already register ", handler: nil)
            txtPassword.becomeFirstResponder()  // set the focus
            return
        }
        
        
        let newUser = UserModel(dob:dob, username: username, password: password)
        UserProvider.insert(newUser: newUser)
        
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dobDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dobDataSource[component].count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dobDataSource[component][row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerDob.delegate = self
        pickerDob.dataSource = self
        
    }
}

