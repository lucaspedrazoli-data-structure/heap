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
