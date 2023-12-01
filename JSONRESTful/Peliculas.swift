//
//  Peliculas.swift
//  JSONRESTful
//
//  Created by yrojas on 1/12/23.
//

import Foundation
struct Peliculas:Decodable{
    let usuarioId:Int
    let id:Int
    let nombre:String
    let genero:String
    let duracion:String
}
