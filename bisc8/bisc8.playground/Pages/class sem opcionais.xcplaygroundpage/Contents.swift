//: [Previous](@previous)

class Refeicao {
    
    // MARK: - Atributos
    var nome: String
    var felicidade: String
    var itens: Array<Item> = []
    
    // MARK: - Construtor
    init(nome: String, felicidade: String) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    // MARK: - Métodos
    func totalDeCaloria() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
}

class Item {
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}

let arroz = Item(nome: "Arroz", calorias: 63.0)
let feijao = Item(nome: "Feijão", calorias: 90.3)
let chuleta = Item(nome: "chuleta", calorias: 308.7)

let refeicao = Refeicao(nome: "arroz", felicidade: "5")
refeicao.itens.append(arroz)
refeicao.itens.append(feijao)
refeicao.itens.append(chuleta)

print(refeicao.totalDeCaloria())

//: [Next](@next)
