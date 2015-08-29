//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class Node <T> {
    var item: T? = nil
    var next: Node? = nil
}

public class LinkedStack<T: Equatable> {
    
    private var first: Node<T>?
    
    public func isEmpty() -> Bool {
        return first?.item == nil
    }
     
    public func push(item: T) {
        
        let current: Node? = first
        first = Node<T>()
        first!.item = item
        first?.next = current
        
    }
    
    public func pop() -> T? {
        let item: T? = first?.item
        first = first?.next
        return item
    }
    
}

var list : LinkedStack<String> = LinkedStack<String>()

list.push("test")
list.push("push one")

list.pop()
