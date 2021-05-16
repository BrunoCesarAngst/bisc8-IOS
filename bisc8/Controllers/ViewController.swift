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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var itensTableView: UITableView?
    
    
    // MARK: - Atributos
    
//    var tableViewController: Bisc8TableViewController?
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [ Item(nome: "Molho de tomate", calorias: 40.0),
                          Item(nome: "Queijo", calorias: 40.0),
                          Item(nome: "Molho avinagrete", calorias: 40.0),
                          Item(nome: "Salsinha", calorias: 40.0),
                          Item(nome: "Cebilinha", calorias: 40.0)
    ]
    
    var itensSelecionados: [Item] = []

    // MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        let botaoAdicinarItem = UIBarButtonItem(title: "Adicinar", style: .plain, target: self, action: #selector(self.adicionarItem))
        
        navigationItem.rightBarButtonItem = botaoAdicinarItem
    }
    
    @objc func adicionarItem() {
        print("Item adicionado")
        
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            // chamando a classe Alerta
            Alerta(controller: self).exibe(title: "Desculpe", message: "Não foi possível atualizar a tabela")
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabelaDeItens = indexPath.row
        let item = itens[linhaDaTabelaDeItens]
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        } else {
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
            }
        }
    }
    
    func recuperaRefeicaoDoFormulario() -> Refeicao? {
        guard let nomeDaRefeicao = nomeTextField?.text else {
            Alerta(controller: self).exibe(message: "Erro ao ler o campo nome")
            return nil
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text,
              let felicidade = Int(felicidadeDaRefeicao) else {
            Alerta(controller: self).exibe(message: "Erro ao ler o campo felicidade")
            return nil
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }
    
    // MARK: -IBActions
    
    @IBAction func adicionar(_ sender: UIButton) {
        guard let refeicao = recuperaRefeicaoDoFormulario() else {
            Alerta(controller: self).exibe(message: "Erro ao ler os dados do formulário!")
            return
        }
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }
}

