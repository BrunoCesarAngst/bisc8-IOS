//: [Previous](@previous)

class Refeicao {
    var nome: String?
    var felicidade: String?
}

// instanciando a class=
let refeicao = Refeicao()

refeicao.nome = "Arroz"

if refeicao.nome != nil {
    print(refeicao.nome!, refeicao.felicidade) // output - Arroz nil não é comum isso!!! => forced unwrap
}

// Boas práticas para extrair o valor opcional
// if let
if let nome = refeicao.nome {
    print(nome) // output - Arroz
}

//guard let
func exibirNomeRefeicao() {
    if let nome = refeicao.nome {
        print("variável no if let: ", nome) // output - Arroz
    } // variável nome só dentro do if let não é acessível externamente
    
    
    guard let nome = refeicao.nome else {
        // posso colocar mais coisas!
        return
    } // variável nome acessível fora do escopo
    
    print("variável no guard let: ", nome)
}

exibirNomeRefeicao()

//: [Next](@next)
