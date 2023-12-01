//
//  Users.swift
//  JSONRESTful
//
//  Created by yrojas on 1/12/23.
//

import Foundation
struct Users:Decodable{
    let id:Int
    let nombre:String
    let clave: String
    let email:String
}
