//
//  SalirViewController.swift
//  foodMap
//
//  Created by Jonh Parra on 12/12/19.
//  Copyright © 2019 Jonh Parra. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class SalirViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        salir()
    }
    
    
    func salir () {
        let alert = UIAlertController(title: "Salir", message: "¿Deseas cerrar sesión?", preferredStyle: .alert)
               let aceptar = UIAlertAction(title: "Aceptar", style: .default) { (_) in
                   try! Auth.auth().signOut()
                   self.dismiss(animated: true, completion: nil)
               }
               let cancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
               alert.addAction(cancelar)
               alert.addAction(aceptar)
               present(alert, animated: true, completion: nil)
    }


}
