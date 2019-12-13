//
//  MuroViewController.swift
//  foodMap
//
//  Created by Jonh Parra on 12/12/19.
//  Copyright © 2019 Jonh Parra. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class MuroViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    
    var userList = [Users]()
    var postsLists = [Posts]()
    @IBOutlet weak var usuario: UILabel!
    
    var db : Firestore!


    @IBOutlet weak var tabla: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        
//        selectUser()

    }
    
    
//    func selectUser () {
//        db.collection("users").addSnapshotListener { (querySnapshot, error) in
//            if let error = error {
//                print("Error al traer a los usuarios", error.localizedDescription)
//            } else {
//                for document in querySnapshot!.documents{
//                    print(document)
//                }
//            }
//        }
//    }
         


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return postsLists.count
        return 1
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         return cell
     }

}
