import Foundation

let maxWeight = 8;
// Lista global para evitar criar listas adicionais durante a recursividade
var bottom = [Int]();

func canTransport(position: Int) -> Bool {

  let weight: Int = bottom[position];

  if weight <= maxWeight {
    return true;
  }

  // Remover peso atual da lista (nao queremos um loop eterno)
  bottom.remove(at: position);

  // Caso o peso seja maior que maxWeight precisamos encontrar um par para o transporte
  // -1 indica que nao existe um 'parceiro' valido
  var partner: Int = -1;
  for (index, value) in bottom.enumerated() { 
    if abs(weight - value) <= maxWeight {
      partner = index;
      break;
    }
  }

  if partner == -1 {
    return false;
  }

  return canTransport(position: partner);
}

func main() {
    var boxesCount: Int;

    boxesCount = Int(readLine()!)!;
    // Converter linha de pesos (string) para array de Int
    bottom = readLine()!.split{ $0 == " " }.map({ weight in
      return Int(weight)!;
    });
    // Checamos se é possivel transportar a caixa mais pesada 
    var maxIndex = 0
    var maxValue = bottom.first!;
    for (index, value) in bottom.enumerated() {
      if value > maxValue {
        maxValue = value;
        maxIndex = index;
      }
    }
    let isPossible = canTransport(position: maxIndex);
    if isPossible {
      print("S");
    } else {
      print("N");
    }
}

main();
