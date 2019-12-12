//
//  RegistrarViewController.swift
//  foodMap
//
//  Created by Jonh Parra on 12/12/19.
//  Copyright © 2019 Jonh Parra. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegistrarViewController: UIViewController {
    
    @IBOutlet weak var nombreRegistro: UITextField!
    @IBOutlet weak var correoRegistro: UITextField!
    @IBOutlet weak var telefonoRegistro: UITextField!
    @IBOutlet weak var contraseñaRegistro: UITextField!
    
    let db = Firestore.firestore()

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func btnRegistrar(_ sender: UIButton) {
    guard let email = correoRegistro.text else { return }
    guard let password = contraseñaRegistro.text else { return  }
    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
        if user != nil {
            print("Ususario creado")
            self.guardarUsuario()
        } else {
            if let error = error?.localizedDescription{
             let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
             let action = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
             alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            } else {
                 let alert = UIAlertController(title: "error", message: "Error en el código", preferredStyle: .alert)
                 let action = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                 alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    func guardarUsuario() {
        let campos: [String: Any] = [
            "nombre": nombreRegistro.text ?? "Sin nombre",
            "correo": correoRegistro.text ?? "Sin correo",
            "telefono": telefonoRegistro.text ?? "Sin telefono",
            "contraseña": contraseñaRegistro.text ?? "Sin contraseña",
            "idUser": Auth.auth().currentUser?.uid as Any
        ]

        db.collection("users").addDocument(data: campos) { (error) in
            if let error = error{
                print("Fallo al guardar", error.localizedDescription)
            } else {
                print("Guardado correctamente")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
}
