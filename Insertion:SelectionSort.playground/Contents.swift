import UIKit

var array = [10, 5, 20, 33, 2, 8, 0, 88, 100, 27]
var array1 = [10, 5, 20, 33, 2, 8, 0, 88, 100, 27]
var array2 = [10, 5, 20, 33, 2, 8, 0, 88, 100, 27]

//Selection Sort
func selectionSort(input: inout [Int]) {
    for index in 0..<input.count {
        let minimumItemIndex = indexOfMinimumItem(array: input, startIndex: index)
        if minimumItemIndex != index {
            input.swapAt(minimumItemIndex, index)
        }
    }
}

private func indexOfMinimumItem(array: [Int], startIndex: Int) -> Int {
    var minimumItemIndex = startIndex
    for index in startIndex..<array.count where array[minimumItemIndex] > array[index] {
        minimumItemIndex = index
    }
    return minimumItemIndex
}

//Insertion Sort
func insertionSort(input: inout [Int]) {

    if input.isEmpty { return }

    for index in 1..<input.count {
        insert(array: &input, index: index, value: input[index])
    }
}

private func insert(array: inout [Int], index: Int, value: Int) {
    var rightIndex = index

    while rightIndex > 0 && value < array[rightIndex - 1] {
        array[rightIndex] = array[rightIndex - 1]
        rightIndex -= 1
    }

    array[rightIndex] = value
}

selectionSort(input: &array)
print(array)

insertionSort(input: &array1)
print(array1)
