//
//  Refeicao.swift
//  bisc8
//
//  Created by mbcangst on 11/05/21.
//

import UIKit

class Refeicao: NSObject {
    
    // MARK: - Atributos
    let nome: String
    let felicidade: Int
    let itens: Array<Item> = []
    
    // MARK: - Init
    init(nome: String, felicidade: Int) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    // MARK: - Métodos
    func totalDeCaloria() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
}
