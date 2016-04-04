
import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var ref : Firebase!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Firebase(url: "https://vivid-inferno-6866.firebaseio.com")
    }

    @IBAction func loginDidTouch(sender: AnyObject) {
        ref.authAnonymouslyWithCompletionBlock { (error, authData) in
            if error != nil{
                print(error.description)
                return;
            }
            self.performSegueWithIdentifier("LoginToChat", sender: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        let navVC = segue.destinationViewController as! UINavigationController
        let chatVC = navVC.viewControllers.first as! ChatViewController
        
        chatVC.senderId = ref.authData.uid
        chatVC.senderDisplayName = ""
    }
  
}

