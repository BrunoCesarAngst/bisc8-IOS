//
//  ItensDao.swift
//  bisc8
//
//  Created by mbcangst on 17/05/21.
//

import Foundation

class ItemDao {
    func save(_ itens: [Item]) {
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            
            guard let caminho = recuperaDiretorio() else { return }
            
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Item] {
        do {
            guard let diretorio = recuperaDiretorio() else { return [] }
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! Array<Item>
            
            return itensSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperaDiretorio() -> URL? {
        // adicionando path e diretória para persistir os dados
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("bisc8-itens")
        
        return caminho
    }
}
