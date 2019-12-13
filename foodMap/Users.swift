//
//  Users.swift
//  foodMap
//
//  Created by Jonh Parra on 13/12/19.
//  Copyright © 2019 Jonh Parra. All rights reserved.
//

import Foundation

class Users {
    var user: String?
    var fotoPerfil: String?
    var telefono: String?
    
    init(user: String?, fotoPerfil: String?, telefono: String?) {
        self.user = user
        self.fotoPerfil = fotoPerfil
        self.telefono = telefono
    }
}
