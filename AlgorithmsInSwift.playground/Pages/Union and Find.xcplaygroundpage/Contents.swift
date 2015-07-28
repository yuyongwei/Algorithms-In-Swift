//: Playground - noun: a place where people can play


//:Quick-find
public struct QuickFindUF {
    private var id: [Int]
    
    init(capacity: Int) {
        id = [Int](count: capacity, repeatedValue: 0)
        for i in 0..<id.count {
           id[i] = i
        }
    }
    
    public func connected(first: Int, second: Int) -> Bool {
        return id[first] == id[second]
    }
    
    public mutating func union(first: Int, second: Int) {
        let pid: Int = id[first]
        let qid: Int = id[second]
        for i in 0..<id.count {
            if id[i] == pid {
                id[i] = qid;
            }
        }
    }
}

//:Quick-union
public struct QuickUnionUF {
    private var id: [Int]
    
    init(capacity: Int) {
        id = [Int](count: capacity, repeatedValue: 0)
        for i in 0..<id.count {
            id[i] = i
        }
    }
    
    private func root(var num: Int) -> Int {
        while (num != id[num]) {
            num = id[num]
        }
        return num
    }
    
    public func connected(first: Int, second: Int) -> Bool {
        return root(first) == root(second)
    }
    
    public mutating func union(first: Int, second: Int) {
        let i:Int = root(first)
        let j:Int = root(second)
        id[i] = j
    }
}

//:weighted quick-union
public struct WeightedQuickUnionUF {
    private var id: [Int]
    private var size: [Int] //size of component for roots
    private(set) public var count: Int//number of components
    
    init(capacity: Int) {
        id = [Int](count: capacity, repeatedValue: 0)
        for i in 0..<id.count {
            id[i] = i
        }
        
        size = [Int](count: capacity, repeatedValue: 1)
        
        count = capacity
    }
    
    private mutating func root(var num: Int) -> Int {
        while (num != id[num]) {
            let p:Int = id[num] //path compression
            id[num] = id[p]
            num = id[num]
        }
        return num
    }
    
    public mutating func connected(first: Int, second: Int) -> Bool {
        return root(first) == root(second)
    }
    
    public mutating func union(first: Int, second: Int) {
        let i:Int = root(first)
        let j:Int = root(second)
        if i == j {
            return
        }
        
        if size[i] < size[j] {
            id[i] = j;
            size[j] += size[i]
        } else {
            id[j] = i
            size[i] += size[j]
        }
        count--;
    }
}















