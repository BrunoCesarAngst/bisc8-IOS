//
//  AdicionarItensViewController.swift
//  bisc8
//
//  Created by mbcangst on 14/05/21.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriaTextField: UITextField!
    
    // MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func adicinarItem(_ sender: Any) {
        
        guard let nome = nomeTextField.text,
              let calorias = caloriaTextField.text else { return }
        
        // caloria é um Double como resolver
        if let numeroDecalorias = Double(calorias) {
            let item = Item(nome: nome, calorias: numeroDecalorias)
            
            delegate?.add(item)
            
            // navegar para a próxima tela com navigationController.push()
            // navegar para a tela anterior com navigationController.pop()
            navigationController?.popViewController(animated: true)
        }
    }
    

}
