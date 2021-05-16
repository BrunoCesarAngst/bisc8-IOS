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
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            func removeRefeicao(alerta: UIAlertAction) {
                print("A refeição \(refeicao.nome) foi removida!")
            }
                        
            let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
            let ok = UIAlertAction(title: "0K", style: .cancel)
            alerta.addAction(ok)
            let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: removeRefeicao)
            alerta.addAction(botaoRemover)
            present(alerta, animated: true, completion: nil)
            
            print("refeição: \(refeicao.nome)")
        }
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
