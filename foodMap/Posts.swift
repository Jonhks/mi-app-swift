//
//  Posts.swift
//  foodMap
//
//  Created by Jonh Parra on 13/12/19.
//  Copyright © 2019 Jonh Parra. All rights reserved.
//

import Foundation

class Posts {
    var user: String?
    var fotoLugar: String?
    var texto: String?
    var idUser: String?
    var idPost: String?
    var latitud: String? 
    var longitud: String?
    
    init(user: String?, fotoLugar: String?, texto: String?, idUser: String?, idPost: String?, longitud: String?, latitud: String? ) {
        self.user = user
        self.fotoLugar = fotoLugar
        self.texto = texto
        self.idUser = idUser
        self.idPost = idPost
        self.longitud = longitud
        self.latitud = latitud
    }
}
