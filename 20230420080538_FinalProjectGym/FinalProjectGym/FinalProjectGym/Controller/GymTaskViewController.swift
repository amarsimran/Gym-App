import UIKit

class GymTaskViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var taskList : [String] = ["Squats","Pull-Ups","Deadlifts","Dumbbell curls","Lunges","Plank","Leg press"]
   
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var notificationsSwitch: UISwitch!
    
    public var loggedUser : UserModel? // nil
    private var selectedUser : UserModel? // nil  (assign the user tableview selection)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" ,for: indexPath)
        
        cell.textLabel?.text = taskList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("The task \(taskList[indexPath.row]) was selected!")
    }
   
    
    @IBAction func notificationsValueChanged(_ sender: Any) {
        if notificationsSwitch.isOn {
            
            Toast.ok(view: self, title: "Gym Tasks", message: "You have some gym tasks pending", handler: nil);
        
        }
        else{
            Toast.ok(view: self, title: "Notifications", message: "Gym task notifications are turned off", handler: nil)
       
        }
            
        
    }
    
}

 
