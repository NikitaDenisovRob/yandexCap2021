func main() -> String {
    let inputData: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
    var massive: [String] = []
    var collect: [String] = []
    var finalStr: String = ""
    for i in 1...inputData[0] {
        if let input = readLine() {
            if i % inputData[2] == 0 {
                for (index, value) in input.split(separator: " ").enumerated() {
                    if index % inputData[2] == 0 {
                        collect.append(String(value))
                        if collect.count > 7 {
                            massive.append(collect.joined(separator: " "))
                            collect = []
                        }
                    }
                }
            }
        }
    }
    for i in massive {
        let binStrig: String = returnBin(string: i)
        if Int(binStrig, radix: 2) != 0{
            finalStr += String(Unicode.Scalar(Int(binStrig, radix: 2)!)!)
        }
    }
    return finalStr
}

func returnBin(string: String) -> String {
    var finalOutput: String = ""
    var total: Int = 0
    
    for i in string {
        if i == " "{
            if total >= 10 {
                finalOutput += "0"
            } else {
                finalOutput += "1"
            }
            total = 0
        } else {
            total += Int(String(i))!
        }
    }
    if total >= 10 {
        finalOutput += "0"
    } else {
        finalOutput += "1"
    }
    return finalOutput
}
print(main())
