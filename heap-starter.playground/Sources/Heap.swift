import Foundation

public struct Heap<Element: Equatable> {
  var elements: [Element] = []
  let sort: (Element, Element) -> Bool

  var isEmpty: Bool {
    elements.isEmpty
  }

  var count: Int {
    elements.count
  }


  init(sort: @escaping (Element, Element) -> Bool) {
    self.sort = sort
  }

  func peek() -> Element? {
    elements.first
  }

  func leftChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 1
  }

  func rightChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 2
  }

  func parentIndex(ofAchildAt index: Int) -> Int {
    (index - 1) / 2
  }

  mutating func remove() -> Element? {
    guard !isEmpty else {
      return nil
    }
    elements.swapAt(0, count - 1)
    defer {
      siftDown(from: 0)
    }
    return elements.removeLast()
  }

  mutating func siftDown(from index: Int) {
    var parent = index
    while true {
      let left = leftChildIndex(ofParentAt: parent)
      let right = rightChildIndex(ofParentAt: parent)
      var candidate = parent
      if left < count && sort(elements[left], elements[candidate]) {
        candidate = left
      }
      if right < count && sort(elements[right], elements[candidate]) {
        candidate = right
      }
      if candidate == parent {
        return
      }
      elements.swapAt(parent, candidate)
      parent = candidate
    }
  }

  mutating func insert(_ element: Element) {
    elements.append(element)
    siftUp(from: elements.count - 1)
  }

  mutating func  siftUp(from index: Int) {
    var child = index
    var parent = parentIndex(ofAchildAt: child)
    while child > 0 && sort(elements[child], elements[parent]) {
      elements.swapAt(child, parent)
      child = parent
      parent = parentIndex(ofAchildAt: child)
    }
  }

  mutating func remove(at index: Int) -> Element? {
    guard index < elements.count else {
      return nil
    }
    if index == elements.count - 1 {
      return elements.removeLast()
    } else {
      defer {
        siftDown(from: index)
        siftUp(from: index)
      }
      elements.swapAt(index, elements.count - 1)
    }
    return elements.removeLast()
  }

  

}
