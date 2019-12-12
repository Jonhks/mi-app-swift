//
//  ViewController.swift
//  foodMap
//
//  Created by Jonh Parra on 12/12/19.
//  Copyright © 2019 Jonh Parra. All rights reserved.
//

import UIKit
import FirebaseAuth



class ViewController: UIViewController {
    
    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var passLogin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sesionActiva()
    }


    @IBAction func btnLogin(_ sender: UIButton) {
        guard let email = emailLogin.text else { return }
        guard let password = passLogin.text else { return }
        iniciarSesion(email: email, password: password)
    }
    
    @IBAction func btnGoogle(_ sender: UIButton) {
        
    }
    
    func iniciarSesion (email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "entrar", sender: self)
                print("entro")
            } else {
                if let error = error?.localizedDescription{
                    print("Error en firebase", error)
                    let alert = UIAlertController(title: "error", message: error, preferredStyle: .alert)
                         let action = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                         alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
            } else  {
                    print("Error en el código")
                    let alert = UIAlertController(title: "error", message: "Error en el código", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(action)
                   self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func sesionActiva () {
         Auth.auth().addStateDidChangeListener { (auth, error) in
             if error == nil {
                 print("No hay usuario")
             } else {
                 print("Si hay usuario")
                 self.performSegue(withIdentifier: "entrar", sender: self)
             }
         }
     }
    
    
}

