//
//  bisc8TableViewController.swift
//  bisc8
//
//  Created by mbcangst on 12/05/21.
//

import UIKit

class Bisc8TableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes = [
        Refeicao(nome: "Macarrão", felicidade: 3),
        Refeicao(nome: "Lasanha", felicidade: 5),
        Refeicao(nome: "Churrasco", felicidade: 5)
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        
        celula.textLabel?.text = refeicao.nome
        return celula
    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "adicionarItem" {
            print("usando o segue adicionarItem")
        }
        
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
        }
    }
    
}
