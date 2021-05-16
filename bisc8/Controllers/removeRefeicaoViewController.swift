//
//  removeRefeicaoViewController.swift
//  bisc8
//
//  Created by mbcangst on 16/05/21.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let ok = UIAlertAction(title: "0K", style: .cancel)
        alerta.addAction(ok)
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive,
            /* closure */
            handler: handler)
        alerta.addAction(botaoRemover)
        controller.present(alerta, animated: true, completion: nil)
        
        print("refeição: \(refeicao.nome)")
    }
}
