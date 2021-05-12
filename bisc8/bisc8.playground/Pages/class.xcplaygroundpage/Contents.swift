//: [Previous](@previous)

// criando uma class
class Refeicao {
    var nome: String?
    var felicidade: String?
}

// instanciando a class
//let refeicao: Refeicao = Refeicao()
let refeicao = Refeicao()

refeicao.nome = "Arroz"

print(refeicao.nome, refeicao.felicidade) // Optional("Arroz") nil
print(refeicao.nome!, refeicao.felicidade) // output - Arroz nil cuidado => forced unwrap

//: [Next](@next)
