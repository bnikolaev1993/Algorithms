import UIKit

class Node<T: Comparable> {
    var value: T
    var next: Node<T>?
    var prev: Node<T>?

    init(_ value: T, _ next: Node<T>?, _ prev: Node<T>?) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}

class LinkedList<T: Comparable> {
    typealias Neighbours = (next: T?, prev: T?)
    var count: Int = 0
    private var head: Node<T>?
    private var tail: Node<T>?

    func sortedPush(value: T) -> Self {
        self.count += 1
        if head == nil {
            head = Node(value, nil, nil)
            tail = head
            return self
        }
        var pointer = head
        while let top = pointer {
            if top.value >= value && top.next == nil {
                let newElement = Node(value, nil, top)
                top.next = newElement
                head = newElement
                return self
            } else if let prevToTop = top.prev, prevToTop.value >= value {
                let newElement = Node(value, top, top.prev)
                top.prev?.next = newElement
                top.prev = newElement
                return self
            } else if top.value <= value && top.prev == nil {
                let newElement = Node(value, top, nil)
                top.prev = newElement
                tail = newElement
                return self
            }
            pointer = top.prev
        }
        return self
    }

    func pop(value: T) -> Node<T>? {
        if let temp = head, temp.value == value {
            head?.prev?.next = nil
            head = head?.prev
            return temp
        }
        if let temp = tail, temp.value == value {
            tail?.next?.prev = nil
            tail = tail?.next
            return temp
        }
        var top = head
        while top != nil {
            if let poppedElement = top, poppedElement.value == value {
                poppedElement.next?.prev = poppedElement.prev
                poppedElement.prev?.next = poppedElement.next
                self.count -= 1
                return poppedElement
            }
            top = top?.prev
        }
        return nil
    }

    func displayAll() -> [T] {
        var top = head
        var array = [T]()
        while top != nil {
            array.append(top!.value)
            top = top?.prev
        }
        return array
    }

    func getTail() -> T? {
        return tail?.value
    }

    func getHead() -> T? {
        return head?.value
    }

    func getNeighbours(of value: T) -> (next: Node<T>?, prev: Node<T>?) {
        var top = head
        while top != nil {
            if top?.value == value {
                return (top?.next, top?.prev)
            }
            top = top?.prev
        }
        return (next: nil, prev: nil)
    }

    func getNeighbours(of value: T) -> Neighbours {
        let neighbours: (next: Node<T>?, prev: Node<T>?) = getNeighbours(of: value)
        return (neighbours.next?.value, neighbours.prev?.value) as Neighbours
    }
}

let linkedList = LinkedList<Int>()
//for i in 0...100 {
//    linkedList.sortedPush(value: i)
//}
linkedList.displayAll()
linkedList.pop(value: 0)
linkedList.sortedPush(value: 0)
linkedList.sortedPush(value: 1)
linkedList.sortedPush(value: 2)
print("Tail is:", linkedList.getTail()!)
print("Head is:", linkedList.getHead()!)
linkedList.sortedPush(value: -1).displayAll()
linkedList.sortedPush(value: -2).displayAll()
print("Tail is:", linkedList.getTail()!)
print("Head is:", linkedList.getHead()!)
linkedList.getNeighbours(of: -1) as LinkedList<Int>.Neighbours
linkedList.sortedPush(value: -4).displayAll()
linkedList.sortedPush(value: 4).displayAll()
linkedList.getHead()
linkedList.getTail()
linkedList.count
linkedList.sortedPush(value: -3)
linkedList.sortedPush(value: 3)
linkedList.sortedPush(value: 0)
linkedList.sortedPush(value: -5)
linkedList.sortedPush(value: 5).displayAll()
linkedList.getHead()
linkedList.getTail()
linkedList.count
print(linkedList.displayAll())
print("The item is popped:", linkedList.pop(value: 5)!.value)
print("The item is popped:", linkedList.pop(value: 0)!.value)
print("The item is popped:", linkedList.pop(value: -5)!.value)
//print("The item is popped:", linkedList.getNeighbours(of: linkedList.pop(value: 5)?.value ?? 999) as LinkedList<Int>.Neighbours)
print(linkedList.displayAll())
var items1: LinkedList<Int>.Neighbours = linkedList.getNeighbours(of: 0)
linkedList.getHead()
linkedList.getTail()
linkedList.count

let linkedList2 = LinkedList<String>()
linkedList2.sortedPush(value: "Bogdan")
linkedList2.sortedPush(value: "Adam")
linkedList2.sortedPush(value: "Aaron")
linkedList2.sortedPush(value: "Zelda")
linkedList2.sortedPush(value: "Phantom")
linkedList2.sortedPush(value: "Bongdan")
linkedList2.sortedPush(value: "Bozgdan").displayAll()
linkedList2.getHead()
linkedList2.getTail()
linkedList2.count
print(linkedList2.displayAll())
var items: LinkedList<String>.Neighbours = linkedList2.getNeighbours(of: "Zelda")

