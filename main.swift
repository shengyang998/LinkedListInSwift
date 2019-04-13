public class Node {
    var value: String
    var next: Node?
    weak var previous: Node?

    init(_ str: String) {
      value = str
    }
}

public class LinkedList {
  fileprivate var head: Node?
  private var tail: Node?

  private var isEmpty: Bool {
    return head == nil
  }

  private var first: Node? {
    return self.head
  }

  private var last: Node? {
    return self.tail
  }

  public func append(_ value: String) {
    let newNode = Node(value)
      if let tailNode = tail {
        newNode.previous = tailNode
        tailNode.next = newNode
      } else {
        head = newNode
      }
      tail = newNode
  }

  public func node(at index: Int) -> Node? {
    if index < 1 { return nil }
    var node = head
    var i = index
    while node != nil {
      if i == 0 { return nil }
      i -= 1
      node = node!.next
    }
    return node
  }

  public func removeAll() {
    head = nil
    tail = nil
  }
}

extension LinkedList: CustomStringConvertible {
  public var description: String {
    var text = "["
    var node = head
    while node != nil {
      text += "\(node!.value)"
      node = node!.next
      if node != nil {
        text += ", "
      }
    }
    text += "]"
    return text
  }
}

let aList = LinkedList()
// this length of the List (47638) will cause the program terminated unexpectedly when removing all elements in it on my Computer
for i in 1..<47638 {
  aList.append("\(i)")
}

print(aList)

aList.removeAll()

print(aList)
