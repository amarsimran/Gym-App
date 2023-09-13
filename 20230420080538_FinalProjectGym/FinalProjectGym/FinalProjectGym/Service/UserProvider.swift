import Foundation

class UserProvider{

    static var all : [UserModel] = []
    
    static func insert( newUser : UserModel ){
        newUser.id = UserModel.getNextId()
        UserProvider.all.append(newUser)
    }
    
    static func update( user : UserModel ) -> Bool {
        
        for (index, currentUser) in UserProvider.all.enumerated() {
            if currentUser.id == user.id {
                UserProvider.all[index] = user
                return true
            }
        }
        return false
    }
    
    
    static func delete( user : UserModel ) -> Bool {
        
        for (index, currentUser) in UserProvider.all.enumerated() {
            if currentUser.id == user.id {
                UserProvider.all.remove(at: index)
                return true
            }
        }
        return false
    }
    
    // find
    static func find( id : Int? = nil, username : String? = nil) -> UserModel? {
        
        if id != nil {
            
            for user in UserProvider.all{
                if user.id == id {
                    return user
                }
            }
            
        } else {

            if username != nil {
                for user in UserProvider.all{
                    if user.username.lowercased() == username!.lowercased() {
                        return user
                    }
                }
            }
            
        }
        
        return nil
        
    }
    

    // fake/built-in data
    static func generateMockData() {
        
        let admin = UserModel(dob: "2003/04/21",  username: "admin", password: "admin")
        insert(newUser: admin)
       
        let user1 = UserModel(dob: "2004/09/06", username: "loveleen", password: "1234")
        insert(newUser: user1)
        
        let user2 = UserModel(dob : "2005/07/02", username: "Simran", password: "4321")
        insert(newUser: user2)
        
    }
    
    
    
    
}
