//
//  ViewController.swift
//  bisc8
//
//  Created by mbcangst on 11/05/21.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource {
    
    // MARK: - Atributos
    
//    var tableViewController: Bisc8TableViewController?
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [String] = [
        "Molho de tomate", "Queijo", "Molho avinagrete", "Salsinha", "Cebilinha"
    ]

    // MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabelaDeItens = indexPath.row
        let item = itens[linhaDaTabelaDeItens]
        
        celula.textLabel?.text = item
        
        return celula
    }
    
    // MARK: -IBActions
    
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
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }
}

