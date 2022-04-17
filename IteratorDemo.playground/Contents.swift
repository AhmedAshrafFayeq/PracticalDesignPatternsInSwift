// Custom Queue Implementation

private final class Node<T> {
    var key: T?
    var next: Node?
    
    init(_ value: T? = nil) {
        key = value
    }
}

final class Queue<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    func enqueue(_ value: T) {
        let newNode = Node<T> (value)
        // First element's value has not been set?
        guard head != nil else {
            // empty queue
            head = newNode
            tail = head
            return
        }
        // append new element
        // not empty queue
        tail?.next = newNode
        tail = newNode
    }
    
    func dequeue() -> T? {
        guard let headItem = head?.key else {
            return nil
        }
        if let nextNode = head?.next {
            head = nextNode
        } else {
            head = nil
            tail = nil
        }
        return headItem
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func peek() -> T? {
        return head?.key
    }
}

var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(22)

/*
 
 for item in queue {
    print(item)
}
*/

//we will get a compiler error
// we have to adopt one of two protocols (Sequence, Iterator Ptotocol)


struct QueueIterator<T>: IteratorProtocol {
    private let queue: Queue<T>
    private var currentNode: Node<T>?
    
    init(_ queue: Queue<T>) {
        self.queue = queue
        currentNode = queue.head
    }
    
    // mutating means that it can modify the content of the structure
    mutating func next() -> T? {
        guard let node = currentNode else {
            return nil
            // end of the queue, queue is empty
        }
        let nextKey = currentNode?.key
        currentNode = node.next
        return nextKey
    }
}

extension Queue: Sequence {
    func makeIterator() -> QueueIterator<T> {
        return QueueIterator(self)
    }
}

for item in queue {
   print(item)
}
print("-------------------------")

// using make iterator method which implemented in Queue
var queryIterator = queue.makeIterator()
while let item = queryIterator.next() {
        print(item)
}
