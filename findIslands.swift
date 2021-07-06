import Foundation

var grid = [
    ["1", "0", "1", "0"],
    ["1", "1", "0", "0"],
    ["0", "0", "1", "1"],
    ]
class Answer {
    
    var mutableGrid: [[String]] = [[]]
    
    func findIslands(_ grid: [[String]]) -> Int {
            
        guard !grid.isEmpty else { return 0 }
        var islandCount: Int = 0
        mutableGrid = grid
        for x in 0..<mutableGrid.count {
            for y in 0..<mutableGrid[x].count {
                print(x, y)
                let point = mutableGrid[x][y]
                if point == "1" {
                    islandCount += 1
                    removeCounted(x: x, y: y, grid: mutableGrid)
                }
            }
        }
        return islandCount
    }
    
    private func removeCounted(x: Int, y: Int, grid: [[String]]) {
        guard grid.indices.contains(x), grid[x].indices.contains(y), grid[x][y] == "1" else { return }
        mutableGrid[x][y] = "0"
        removeCounted(x: x, y: y + 1, grid: mutableGrid)
        removeCounted(x: x, y: y - 1, grid: mutableGrid)
        removeCounted(x: x - 1, y: y, grid: mutableGrid)
        removeCounted(x: x + 1, y: y, grid: mutableGrid)
    }
}
Answer().findIslands(grid)

let a = "10"
extension String {
    var intRep: Int? {
        return Int(self)
    }
    var isPal: Bool {
        return String(self.reversed()) == self
    }
}

let numA = a.intRep
