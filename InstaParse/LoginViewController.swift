//
//  LoginViewController.swift
//  InstaParse
//
//  Created by Cong Tam Quang Hoang on 07/03/17.
//  Copyright © 2017 Cong Tam Quang Hoang. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: username.text!, password: password.text!) { (user: PFUser?, error: Error?) in
            
            if (user != nil){
                print("Logged in")
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
            }
            
        }
    }

    @IBAction func signUp(_ sender: Any) {
        
        let newUser = PFUser()
        
        newUser.username = username.text
        newUser.password = password.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            
            if success {
                print("Created User")
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
            }else{
                print(error?.localizedDescription)
            
            }
            
        }
    }

  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
