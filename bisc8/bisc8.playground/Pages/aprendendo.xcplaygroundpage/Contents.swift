import UIKit

let nome = "churros"
let felicidade = 5
let caloria = 79.5
let vegetal = false

func alimentoConsumido() {
    print("O alimento consumido foi: \(nome)!")
}

func alimentoConsumidocomparams(nome: String, caloria: Double) {
    print("O alimento consumido foi: \(nome) contendo \(caloria) calorias!")
}

func alimentoConsumidocomparamsocultos(_ nome: String, _ caloria: Double) {
    print("O alimento consumido foi: \(nome) contendo \(caloria) calorias!")
}

alimentoConsumido()
alimentoConsumidocomparams(nome: nome, caloria: caloria)
alimentoConsumidocomparamsocultos(nome, caloria)

let totalDeCalorias = [50.5, 100]

func somaCalorias(totalDeCalorias: [Double]) -> Double {
    var total: Double = 0
    
    for caloria in totalDeCalorias {
        total += caloria
    }
    return total
}

let total = somaCalorias(totalDeCalorias: [10, 20.2, 100])

print(total)
