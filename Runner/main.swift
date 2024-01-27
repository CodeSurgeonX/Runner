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
class LinkedList<T> {
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



// MARK: LinkedList Example
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
let node4 = Node(value: 4)

node1.next = node2
node2.next = node3
node3.next = node4

var ll = LinkedList(head: node1)
print(ll)
ll.append(node: .init(value: 5))
print(ll)


// MARK: Testing getItemAtIndex in LL

print(ll.getItemAtIndex(4)?.value)
ll.append(node: .init(value: 13))
print(ll)
print(ll.getItemAtIndex(6)?.value)
print(ll.getItemAtIndex(21))
print(ll.getItemAtIndex(1)?.value)
