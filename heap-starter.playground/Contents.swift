// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.


example(of: "stride to") {
  for i in stride(from: 0, to: 10, by: 2) {
      print(i)
  }
}

example(of: "stride to with decimal") {
  for i in stride(from: 0, to: 0.5, by: 0.1) {
      print(i)
  }
}

example(of: "stride through") {
  for i in stride(from: 0, through: 10, by: 2) {
      print(i)
  }
}

example(of: "Heap") {
  var heap = Heap(sort: >, elements: [1,12,3,4,1,6,8,7])
  while !heap.isEmpty {
    print(heap.remove()!)
  }
}
