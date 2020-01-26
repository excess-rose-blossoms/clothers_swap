//
//  ViewController.swift
//  ClothingSwap
//
//  Created by Koh on 1/25/20.
//  Copyright © 2020 Koh. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseAuth
//import FirebaseDatabase
import GoogleSignIn

class ViewController: UIViewController {
//    self.auth = FUIGoogleAuth().auth()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedButton(_ sender: Any) {
        print("hi");
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
//        if let _ = GIDSignIn.sharedInstance()?.currentUser?.authentication {
//            print("hhhhhh");
//                self.performSegue(withIdentifier: "changePage", sender: self)
//        }
//        else{
//            print("nooooooo")
//        }
    }
    
    @IBAction func tappedButton1(_ sender: Any) {
        if let _ = GIDSignIn.sharedInstance()?.currentUser?.authentication {
            print("hhhhhh");
            
            /*let db = Firestore.firestore()
            let usersRef = db.collection("users")

            usersRef.document("ABC").setData([
                "name": "San Francisco",
                "state": "CA",
                "country": "USA",
                "capital": false,
                "population": 860000,
                "regions": ["west_coast", "norcal"]
                ])*/
            var ref: DatabaseReference!
            ref = Database.database().reference()
            let userID = Auth.auth().currentUser!.uid
            //ref.child("users").setValue("aaaaa")
            ref.child("users").child(userID).child("posts").setValue(["location": "San Francisco"])
            ref.child("users").child(userID).child("posts").observeSingleEvent(of: .value, with: {(snap: DataSnapshot) in
                let value = snap.value as? NSDictionary
                print(value?["location"] as? String ?? "" )})
                //print(snap.value as? String?["location"])})
            
            self.performSegue(withIdentifier: "changePage", sender: self)
        }
        else{
            print("nooooooo")
        }
    }

//    func viewDidAppear(){
//        var authStateListenerHandle = auth?.addStateDidChangeListener { (auth, user) in
//            if user != nil {(self.performSegue(withIdentifier: "goHome", sender: nil))
//            } else {
//                self.loginAction(sender: self)
//                return
//            }
//        }
//    }
}

