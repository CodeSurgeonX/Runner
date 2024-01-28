// Linked list with append, getitemAtIndex, insetItemAtIndex, deleteItemAtIndex
// Stakc push, pop, peek (Using LL and Array)
// Queue enqueue, dequeue, peek (Using LL and Array you can keep a reference to head and tail for insertions and deletions)
//

import Foundation

// MARK: Node Class
class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}


// MARK: LinkedList Class
class LinkedList<T> where T:Equatable {
    var head: Node<T>?
    
    init(head: Node<T>? = nil) {
        self.head = head
    }
}


// MARK: LinkedList append function
extension LinkedList {
    func append(node: Node<T>) {
        guard head != nil else {
            self.head = node
            return
        }
        var current: Node? = head
        // Traverse till you raech the last element, at which point the current.next would return nil, because there is nothing ahead of it
        while let _ = current?.next {
            current = current?.next
        }
        
        // By the time loop has reached here current is holding the last element beyond this point there is nothing, this is perfect place to append the next value
        current?.next = node
    }
}

// MARK: LinkedList printing
extension LinkedList: CustomStringConvertible {
    var description: String {
        var result = String()
        var current = head
        while current != nil {
            result.append("\(current!.value) ---> ")
            current = current?.next
        }
        result.append("Null")
        return result
    }
}

// MARK: Get item at index linked list
extension LinkedList {
    func getItemAtIndex(_ index: Int) -> Node<T>? {
        // To make sure the index is not negative or 0 we are assuming our list starts with index 1
        // We also wanna make sure there exsists a linked list, head nil means there are no elements
        guard index > 0, let head = head else { return nil }
        
        var current: Node? = head
        var currentIndex = 1
        
        while current != nil {
            if currentIndex == index {
                return current
            }
            
            current = current?.next
            currentIndex += 1
        }
        
        // Here the current will be nil means we came out of the list
        
        return nil
    }
}


extension LinkedList {
    // This is from website
    func insertNode(_ node: Node<T>, at position: Int) {
        guard position > 0 else {
            return
        }
        
        var counter = 1
        var current = head
        
        if position > 1 {
            while current != nil && counter < position {
                if counter == position - 1 {
                    node.next = current?.next
                    current?.next = node
                    break
                }
                current = current?.next
                counter += 1
            }
        } else if position == 1 {
            node.next = head
            head = node
        }
    }
    
    // Fails when you try to append
    func insertItemAtIndex(index: Int, node: Node<T>) {
        // Can insert at first or last or in between.
        // Also remember in order to add something at index we need item at previous index
        
        // Index is legititmate and there exsists a linked list
        guard index > 0, head != nil else { return }
        
        var current = head
        var prev: Node<T>? = nil
        var currentIndex = 1
        
        
        if index == 1 {
            node.next = head?.next
            head = node
        }
        
        // We go till the very last element
        while current != nil {
            if currentIndex == index {
                node.next = current
                prev?.next = node
            }
            
            prev = current
            current = current?.next
            currentIndex += 1
        }
        
    }
}


extension LinkedList {
    func deleteItemWithValue(value: T) {
        guard head != nil else { return }
        
        var current = head
        var prev: Node<T>? = nil
        
        // When we check for current.next essentially loop wont run for the last node
        // When we check for current!= nil we are essentailly running for last element as well, it doesnt run for next of last which is anyways null
        
        while current != nil {
            if value == current?.value {
                prev?.next = current?.next
            }
            
            prev = current
            current = current?.next
        }
    }
}


// MARK: LinkedList Example
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
let node4 = Node(value: 4)

node1.next = node2
node2.next = node3
node3.next = node4

var ll = LinkedList(head: node1)
//print(ll)
//ll.append(node: .init(value: 5))
//print(ll)
//
//
//// MARK: Testing getItemAtIndex in LL
//
//print(ll.getItemAtIndex(4)?.value)
//ll.append(node: .init(value: 13))
//print(ll)
//print(ll.getItemAtIndex(6)?.value)
//print(ll.getItemAtIndex(21))
//print(ll.getItemAtIndex(1)?.value)
//print("Testing insertions")
//print(ll)
//ll.insertItemAtIndex(index: 1, node: .init(value: 21))
//ll.insertItemAtIndex(index: 0, node: .init(value: 72))
//print(ll)
//ll.insertItemAtIndex(index: 7, node: .init(value: 42))
//print(ll)
//ll.insertItemAtIndex(index: 9, node: .init(value: 133))
//print(ll)
//ll.insertItemAtIndex(index: 5, node: .init(value: 133))
//print(ll)
//ll.insertNode(.init(value: 133), at: 5)
//print(ll)
//ll.deleteItemWithValue(value: 3)
//print(ll)
//
//print("Done")


//func printAllSubarrays(_ arr: [Int]) {
//    var subArrays = [[Int]]()
//    for startPoint in 0...arr.count-1 {
//        for groupSize in  startPoint...arr.count-1 {
//            var temp = [Int]()
//            for index in startPoint...groupSize {
//                temp.append(arr[index])
//            }
//            subArrays.append(temp)
//        }
//    }
//    
//    _ = subArrays.map({ print($0)})
//}

//printAllSubarrays([1,2,3,4])


//func printMaxSumOfSubarray(_ arr: [Int]) -> (start: Int, end: Int, sum: Int) {
//    var currentSum = 0
//    var maxSum = 0
//    var start = 0
//    var end = 0
//    var s = 0
//    
//    for i in arr.indices {
//        currentSum += arr[i]
//        if currentSum > maxSum {
//            maxSum = currentSum
//            start = s
//            end = i
//        }
//        if currentSum <= 0 {
//            currentSum = 0
//            s = i + 1
//        }
//    }
//    
//    return (start, end, maxSum)
//}
//
//let r = printMaxSumOfSubarray([-2, -3, 4, -1, -2, 1, 5, -3])
//print(r.start)
//print(r.end)
//print(r.sum)


//
//struct Interval {
//    var start: Int
//    var end: Int
//    
//    init(input: [Int]) {
//        start = input[0]
//        end = input[1]
//    }
//}
//
//
//func mergeIntervals(_ arr: [Interval]) {
//    var temp = arr.sorted(by: { $0.start < $1.start })
//    var index = 0
//    for i in stride(from: 1, to: temp.count, by: 1) {
//        if temp[index].end > temp[i].start {
//            temp[index].end = max(temp[index].end, temp[i].end)
//        } else {
//            index += 1
//            temp[index] = temp[i]
//        }
//    }
//    
//    for i in 0...index {
//        print(temp[i])
//    }
//}
//
//mergeIntervals([[6, 8], [1, 9], [2, 4], [4, 7]].reduce(into: [Interval](), { $0.append(Interval(input: $1))}))
//mergeIntervals([[1,3],[2,4],[6,8],[9,10]].reduce(into: [Interval](), { $0.append(Interval(input: $1))}))



// MARK: 2D Matric in place rotation, reverseing the row + Transpose
func matrixRotation(_ arr: [[Int]]) {
    
}



//func missingNumber(_ nums: [Int]) -> Int {
//    
//}

//func validParanthesis(_ string: String) {
//    let parenthesis = Array(string) //Character Array, String.Element
//    var stack = [Character]()
//    for element in parenthesis {
//        switch element {
//        case  "(", "{", "[" :
//            stack.append(element)
//        case ")", "}", "]" :
//            let popedElement = stack.removeLast()
//            if element == ")" && popedElement == "(" {
//                continue
//            }
//            
//            if element == "]" && popedElement == "[" {
//                continue
//            }
//            
//            if element == "}" && popedElement == "{" {
//                continue
//            }
//            
//            fatalError("Not balanced")
//            
//            
//        default:
//            fatalError("Invalid Character")
//        }
////        if "(" || "{" || "[" {
////            stack.append(<#T##newElement: Int##Int#>)
////        } else if {
////            
////        } else {
////            fatalError("Unexpected character")
////        }
//    }
//    
//    if stack.isEmpty {
//        print("Valid")
//    } else {
//        print("Invalid")
//    }
//}



////21 2 4
//func printAllSubArrays(_ arr: [Int]) {
//    for startPoint in 0..<arr.count {
//        for size in startPoint..<arr.count {
//            var res = ""
//            for e in startPoint...size {
//                res.append("\(arr[e])")
//            }
//            print(res)
//        }
//    }
//}
//
//printAllSubArrays([1,2,3,4])
//validParanthesis("[({})]")
//validParanthesis("[({})}")

//
//func maxProductSubarray(_ arr: [Int]) {
//    var maxSoFar = arr[0]
//    var currentMin = arr[0]
//    var currentMax = arr[0]
//    
//    
//    for index in stride(from: 1, to: arr.count, by: 1) {
//        var temp = max(arr[index], max(arr[index] * currentMax, currentMin * arr[index]))
//        currentMin = min(arr[index], min(arr[index] * currentMax, arr[index] * currentMin))
//        currentMax = temp
//        
//        if maxSoFar < currentMax {
//            maxSoFar = currentMax
//        }
//    }
//    
//    print(maxSoFar)
//}
//
//
//maxProductSubarray([-1, -2, 3, 4, 2, -7])
//maxProductSubarray([1, -2, -3, 0, 7, -8, -2])

//
//func findMissingAndRepeating(_ arr: [Int]) {
//    let n = arr.count
//    let calculatedSum = (n * (n + 1)) / 2 //Using formulae
//    let calculatedProduct = Array(1...n).reduce(1, *) // Using formulae
//    var actualSum = 0 // Additive Identitiy
//    var actualProduct = 1 // Multiplicative Identitity
//        
//    for index in arr.indices {
//        actualSum = actualSum + arr[index]
//        actualProduct = actualProduct * arr[index]
//    }
//    
//    
//    let repeatinNumber = ((calculatedSum - actualSum) * actualProduct) / (calculatedProduct - actualProduct)
//    let missingNumber = (calculatedProduct * repeatinNumber ) / actualProduct
//    
//    print("Missing number is \(missingNumber)")
//    print("Repeating number is  \(repeatinNumber)")
//}
//
//
////findMissingAndRepeating([1,1,3])
//findMissingAndRepeating([3, 1, 3])
//findMissingAndRepeating([4, 3, 6, 2, 1, 1])




//2D Matrix
func rotateImage(_ arr: inout [[Int]]) {
    
    
    let numberOfRows = arr.count
    let numberOfColumns = arr[0].count
    
    
    // Diagonal adjustment (Transposing)
    for i in 0..<arr.count {
        for j in i..<arr.count {
            let temp = arr[i][j]
            arr[i][j] = arr[j][i]
            arr[j][i] = temp
        }
    }
    
    // Row reversal
    for i in 0..<arr.count {
        var l = 0
        var r = arr.count - 1
        
        while l < r {
            let temp = arr[i][l]
            arr[i][l] = arr[i][r]
            arr[i][r] = temp
            l += 1
            r -= 1
        }
    }
}


//var rotation = [[1,2,3],[4,5,6],[7,8,9]]
//rotateImage(&rotation)
//print(rotation)


func binarySearch(_ arr: [Int], value: Int) {
    
    
    var l = 0
    var r = arr.count - 1
    
    while l <= r {
        let mid = l + (r-l) / 2
        
        if arr[mid] == value {
            print("Found elemet at \(mid)")
            return
        } else if value < arr[mid] {
            // It would be in first half
            r = mid - 1
            continue
        } else {
            // It would be in second half
            l = mid + 1
            continue
        }
    }
    
    print("Element not found")
}

//var arr = [1,7,11,13, 17, 19]
//arr.shuffled().forEach({ binarySearch(arr, value: $0)})



//func fib(n: Int) -> Int {
//    if n == 0 {
//        return 0
//    }
//    
//    if n == 1 {
//        return 1
//    }
//    
//    return fib(n: n-1) + fib(n: n-2)
//}
//
//
//print(fib(n: 27))



//func bubbleSort(_ arr: inout [Int]) {
//    
//    // 0 -> n-1
//    for i in arr.indices {
//        print("Checking till \(arr.count - 1 - i)")
//        for j in 0..<arr.count - 1 - i {
//            if arr[j] > arr[j+1] {
//                let temp = arr[j]
//                arr[j] = arr[j+1]
//                arr[j+1] = temp
//            }
//        }
//        print("After iteration \(i) array looks like \(arr)")
//    }
//}
//
//
//var arr = [1,13,144,2,3]
//bubbleSort(&arr)


//func mergeSort(_ arr: [Int]) -> [Int] {
//    //Base case
//    guard arr.count > 1 else { return arr }
//    
//    //Recursive case
//    
//    let left = Array(arr[0..<arr.count/2])
//    let right = Array(arr[arr.count/2..<arr.count])
//    return merge(left: mergeSort(left), right: mergeSort(right))
//    
//    
//    func merge(left: [Int], right: [Int]) -> [Int] {
//        var l = left
//        var r = right
//        var mergedList = [Int]()
//        
//        while l.count > 0 && r.count > 0  {
//            if l.first! < r.first! {
//                mergedList.append(l.removeFirst())
//            } else {
//                mergedList.append(r.removeFirst())
//            }
//        }
//        
//        //This adds remaining elements if any
//        return mergedList + l + r
//    }
//    
//}
//       



//print(mergeSort([1,13,144,2,3]))




// Merge sort which is inplace thats why better than both bubble and merge
// we select a pivot we move the element larger than pivot behind pivot, once it reaches at its place we divide the array on pivot and we do quick sort on those elements
// low is essentially starting place, while high is max index
//func quickSort(arr: inout [Int], low: Int, high: Int) -> [Int] {
//    let pivot = arr[high]
//    
//    for i in arr.indices {
//        if arr[i] > pivot {
//            
//        }
//    }
//}




// Low and high are controlling visibility of the array to partition
func partition(arr: inout [Int], low: Int, high: Int, pivot: Int) -> Int {
    // i -> e unknown
    // j -> i-1 big boys
    // 0 j-1  small boys
    
    var i = low
    var j = low
    
    while i <= high {
        if arr[i] > pivot {
            i += 1
        } else {
            //Less than or equal
            let temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
            i += 1
            j += 1
        }
    }
    
    return j-1
}





func quickSort(arr: inout [Int], low: Int, high: Int) {
    guard low <= high else { return } //Base case
    
    let pivotIndex = partition(arr: &arr, low: low, high: high, pivot:  arr[high])
    
    
    // pivotIndex marks the index of smaller elements boundary or before pivot
    quickSort(arr: &arr, low: 0, high: pivotIndex-1) //Faith
    quickSort(arr: &arr, low: pivotIndex+1, high: high) // Faith
}



var arr = [8,5,1,3,7,2,9,6]
quickSort(arr: &arr, low: 0, high: arr.count - 1)
print(arr)
