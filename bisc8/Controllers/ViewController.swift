//
//  ViewController.swift
//  bisc8
//
//  Created by mbcangst on 11/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    var tableViewController: Bisc8TableViewController?

    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    @IBAction func adicionar(_ sender: UIButton) {
                
//        if let nomeDaRefeicao = nomeTextField?.text,
//           let felicidadeDaRefeicao = felicidadeTextField?.text {
//            let nome = nomeDaRefeicao
//            if let felicidade = Int(felicidadeDaRefeicao) {
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//
//                print("Comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
//            } else {
//                print("Erro ao tentar criar a refeição!!!")
//            }
//        }
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text,
              let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("Comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        tableViewController?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }
}

