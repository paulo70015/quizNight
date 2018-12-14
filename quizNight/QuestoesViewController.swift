//
//  QuestoesViewController.swift
//  quizNight
//
//  Created by Paulo de Tarso on 11/12/18.
//  Copyright © 2018 Paulo de Tarso. All rights reserved.
//

import UIKit

class QuestoesViewController: UIViewController {

    @IBOutlet weak var dicaImagem: UIImageView!
    @IBOutlet weak var stackBotoes: UIStackView!

    var cidades : [String] = ["Curitiba","Toronto","New York","Washington"]
    var opcoes : [String] = ["São Paulo", "Vancouver", "Paris"]
    
    var opcaoCorreta : Int!
    var pontuacao : Int = 0
    
    
    func carregarQuestao() {
        if (cidades.count == 0){
            performSegue(withIdentifier: "fimDeJogo", sender: self)
            return
        }
        
        let cidade = cidades.randomElement()
        cidades.removeAll(where: {$0 == cidade})
        
        let imagemNome = cidade!.replacingOccurrences(of: " ", with: "").lowercased()
        + ".jpg"
        dicaImagem.image = UIImage(named: imagemNome)
        
        var minhasOpcoes = embaralhar(vetor: opcoes)
    
        //Verifica se a cidade escolhida ficou entra as opcoes embaralhadas
        //for com acesso ao indice e ao valor, muito util
        opcaoCorreta = 0
        for (index, option) in minhasOpcoes.enumerated() {
            if option == cidade {
                opcaoCorreta = index
                break
            }
        }
        if opcaoCorreta >= 4 {
            //Trocar a opção correta para uma das 4 primeiras
            let novaOpcaoCerta = Int.random(in: 0...3)
            minhasOpcoes.swapAt(opcaoCorreta, novaOpcaoCerta)
            opcaoCorreta = novaOpcaoCerta
        }
        
        var opcao = 0
        for view in stackBotoes.subviews {
            if let botao = view as? UIButton {
                botao.setTitle(minhasOpcoes[opcao], for: .normal)
                opcao += 1
            }
        }
    }
    
    
    func embaralhar (vetor : [String]) -> [String] {
        var vetorModificado = vetor
        
        if (vetor.count < 2) {
            return vetor
        }
        
        for item in 0 ..< vetor.count - 1 {
            let escolhido = Int.random(in: 0 ..< (vetor.count - item)) + item
            if ( item != escolhido ) {
                vetorModificado.swapAt(item, escolhido)
            }
        }
        return vetorModificado
    }
    
    func botaoPressionado(_ num : Int){
        if (num == opcaoCorreta){
            print("Acertou")
            pontuacao += 1
        }
        else{
            print("Erroooou!!")
            performSegue(withIdentifier: "fimDeJogo", sender: self)
        }
        
        carregarQuestao()
    }
    
    @IBAction func botao1Click(_ sender: Any) {
        botaoPressionado(0)
    }
    @IBAction func botao2Click(_ sender: Any) {
        botaoPressionado(1)
    }
    @IBAction func botao3Click(_ sender: Any) {
        botaoPressionado(2)
    }
    @IBAction func botao4CLick(_ sender: Any) {
        botaoPressionado(3)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        opcoes.append(contentsOf: cidades)
        carregarQuestao()
        // Do any additional setup after loading the view.
    }
    
    //Navega entre as telas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Se a Tela que esta indo é a GameOver
        if let destino = segue.destination as? GameOverViewController {
            destino.pontuacao = self.pontuacao
        }
    }
    
    
    
}
