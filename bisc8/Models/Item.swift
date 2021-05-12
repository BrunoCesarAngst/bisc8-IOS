//
//  Item.swift
//  bisc8
//
//  Created by mbcangst on 11/05/21.
//

import UIKit

class Item: NSObject {
    
    // MARK: - Atributos
    let nome: String
    let calorias: Double
    
    // MARK: - Init
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
