//Purpose:
//1.Show SplashScreen while user start Application.

import UIKit

//MARK: Gloable Variable
var userFirstName:String = ""
var userLastName:String = ""

class LaunchScreenViewController: UIViewController
{
//MARK: IBOutlet
    @IBOutlet weak var mCurrentUserName: UILabel!
    
//MARK: ViewDidLoad Method
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if isUserLoggedIn == true
        {
            currentuser = UserDefaults.standard.string(forKey: "userEmail")!
            
            userFirstName = UserDefaults.standard.value(forKey: "user_first_name") as! String
            userLastName = UserDefaults.standard.value(forKey: "user_last_name") as! String
            self.mCurrentUserName.text = userFirstName+" "+userLastName
            DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + 4), execute:
            {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
                self.present(vc, animated: true, completion: nil)
            })
        }
        else
        {
            DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + 4), execute:
            {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                self.present(vc, animated: true, completion: nil)
            })
        }
    }
}
