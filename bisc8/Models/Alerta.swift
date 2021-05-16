//
//  Alerta.swift
//  bisc8
//
//  Created by mbcangst on 14/05/21.
//

// Para usar as classes de UI interface do usuário
import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(title: String = "Desculpe", message: String) {
        let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // botão
        let ok = UIAlertAction(title: "0k", style: .cancel, handler: nil)
        // adiciono o botão np alert
        alerta.addAction(ok)
        
        // apresento o alert ao usuário
        controller.present(alerta, animated: true, completion: nil)
    }
}
