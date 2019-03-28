import UIKit

let initialInput = [0, 1]
let steps = 10

func fibonacciSequence(initialInput: [Int], steps: Int) -> [Int] {
    if steps == 0 {
        return initialInput
    }
    var array = initialInput
    let lastElement = array.last!
    let preLastElement = array[array.count - 2]
    array.append(lastElement + preLastElement)
    return fibonacciSequence(initialInput: array, steps: steps - 1)
}

let fibonacciSeq = fibonacciSequence(initialInput: initialInput, steps: steps)
print(fibonacciSeq)
