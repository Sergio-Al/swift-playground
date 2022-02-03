import UIKit

var greeting = "Hello, playground"

// Insertion sort
let  numbers: [Int] = [2, 1, 6, 4]

func insertionSort (numbers: [Int]) -> [Int]{
    // newNumbersll parameters passed into a Swift function are constants
    // We use a new variable newNumbers
    var newNumbers = numbers
    for index in 1...(newNumbers.count - 1) {
        let key = newNumbers[index]
        var prevIndex = index - 1
        while prevIndex > -1 && newNumbers[prevIndex] > key {
            newNumbers[prevIndex + 1] =  newNumbers[prevIndex]
            prevIndex = prevIndex - 1
        }
        newNumbers[prevIndex + 1] = key
    }
    return newNumbers
}

insertionSort(numbers: numbers)
insertionSort(numbers: [31, 41, 59, 26, 41, 58])


// Merge Sort
func merge(numbers: inout[Int], left: Int, mid: Int, right: Int) {
    let subArr1 = mid - left + 1
    let subArr2 = right - mid
    var leftArr: [Int] = []
    var rightArr: [Int] = []
    
    for i in 0...subArr1 - 1 {
        leftArr.append(numbers[left + i])
    }
    
    for j in 0...subArr2 - 1 {
        rightArr.append(numbers[mid + 1 + j])
    }
    
    var indexOfSubArr1 = 0
    var indexOfSubArr2 = 0
    var indexOfMergedArr = left
    
    while indexOfSubArr1 < subArr1 && indexOfSubArr2 < subArr2 {
        if(leftArr[indexOfSubArr1] <= rightArr[indexOfSubArr2]) {
            numbers[indexOfMergedArr] = leftArr[indexOfSubArr1]
            indexOfSubArr1 += 1
        } else {
            numbers[indexOfMergedArr] = rightArr[indexOfSubArr2]
            indexOfSubArr2 += 1
        }
        indexOfMergedArr += 1
    }
    
    // Copying remaining elements of
    // left[], if there are any
    while indexOfSubArr1 < subArr1 {
        numbers[indexOfMergedArr] = leftArr[indexOfSubArr1]
        indexOfSubArr1 += 1
        indexOfMergedArr += 1
    }
    
    // Copying the remaining elements of
    // right[], if there are any
    while indexOfSubArr2 < subArr2 {
        numbers[indexOfMergedArr] = rightArr[indexOfSubArr2]
        indexOfSubArr2 += 1
        indexOfMergedArr += 1
    }
}

func sort(numbers: inout[Int], begin: Int, end: Int)
{
    
    if (begin >= end) {
        return
    }
    
    let mid: Int = (begin + end) / 2
    sort(numbers: &numbers, begin: begin, end: mid)
    sort(numbers: &numbers, begin: mid + 1, end: end)
    merge(numbers: &numbers, left: begin, mid: mid, right: end)
}


var numbersToSort = [12, 11]
sort(numbers: &numbersToSort, begin: 0, end: numbersToSort.count - 1)

