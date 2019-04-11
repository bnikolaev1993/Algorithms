import UIKit

var array = [34, 23, 50, 10, 25]

func quickSort(array: [Int]) -> [Int] {
    let pivot = array.count/2
    if pivot == 0 {
        return array
    }
    let sortedArray = partition(array: array, pivot: pivot)
    return sortedArray
//    let rightArray: [Int] = Array(sortedArray[0 ..< pivot])
//    print("Right array: \(rightArray)")
//    let leftArray: [Int] = Array(sortedArray[pivot ..< sortedArray.count])
//    print("Left array: \(leftArray)")
//    return quickSort(array: rightArray) + quickSort(array: leftArray)
}

private func partition(array: [Int], pivot: Int) -> [Int] {
    print(array[pivot])
    var sortedArray: [Int] = array
    var firstElement = 0
    var lastElement = sortedArray.count - 1

    while firstElement <= pivot && lastElement >= pivot {
        if sortedArray[firstElement] >= sortedArray[pivot] && sortedArray[lastElement] <= sortedArray[pivot] {
            let temp = sortedArray[firstElement]
            sortedArray[firstElement] = sortedArray[lastElement]
            sortedArray[lastElement] = temp
            firstElement += 1
            lastElement -= 1
        } else if sortedArray[firstElement] <= sortedArray[pivot] && sortedArray[lastElement] >= sortedArray[pivot] {
            firstElement += 1
            lastElement -= 1
        } else {
            if (sortedArray[firstElement] >= sortedArray[pivot] && sortedArray[lastElement] >= sortedArray[pivot]) {
                lastElement -= 1
            }
            if sortedArray[lastElement] <= sortedArray[pivot] && sortedArray[firstElement] <= sortedArray[pivot] {
                firstElement += 1
            }
        }
    }

    return sortedArray
}

let sorted = quickSort(array: array)

