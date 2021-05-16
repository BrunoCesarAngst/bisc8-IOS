//
//  Alerta.swift
//  bisc8
//
//  Created by mbcangst on 14/05/21.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe() {
        let alerta =  UIAlertController(title: "Desculpe", message: "Não foi possível atualizar a tabela", preferredStyle: .alert)
        let ok = UIAlertAction(title: "0K", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
