//
//  basicGrammer.swift
//  基本语法
//
//  Created by 张俊凯 on 2017/1/13.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import Foundation

//struct Matrix {
//    let rows: Int, columns: Int
//    var print: [Double]
//
//    init(rows: Int, columns: Int) {
//        self.rows = rows
//        self.columns = columns
//        print = Array(repeating: 0.0, count: rows * columns)
//    }
//    subscript(row: Int, column: Int) -> Double {
//        get {
//            return print[(row * columns) + column]
//        }
//        set {
//            print[(row * columns) + column] = newValue
//        }
//    }
//}
//// 创建了一个新的 3 行 3 列的Matrix实例
//var mat = Matrix(rows: 3, columns: 3)
//
//// 通过下标脚本设置值
//mat[0,0] = 1.0
//mat[0,1] = 2.0
//mat[1,0] = 3.0
//mat[1,1] = 5.0
//
//// 通过下标脚本获取值
//print("\(mat[0,0])")
//print("\(mat[0,1])")
//print("\(mat[1,0])")
//print("\(mat[1,1])")

////每个代码块都默认可以用下标进行计算
//class daysofaweek {
//    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
//                        "Thursday", "Friday", "saturday"]
//    subscript(index: Int) -> String {
//        get {
//            return days[index]   // 声明下标脚本的值
//        }
//        set(newValue) {
//            self.days[index] = newValue   // 执行赋值操作
//        }
//    }
//}
//var p = daysofaweek()
//
//print(p[0])
//print(p[1])
//print(p[2])
//print(p[3])


////在堆代码块后面通过下标获取一个参数，通过subscript拿到并进行计算
//struct subexample {
//    let decrementer: Int
//    subscript(index: Int) -> Int {
//        return decrementer / index
//    }
//}
//let division = subexample(decrementer: 100)
//
//print("100 除以 9 等于 \(division[9])")
//print("100 除以 2 等于 \(division[2])")
//print("100 除以 3 等于 \(division[3])")
//print("100 除以 5 等于 \(division[5])")
//print("100 除以 7 等于 \(division[7])")

//class Math
//{
//    class func abs(number: Int) -> Int
//    {
//        if number < 0
//        {
//            return (-number)
//        }
//        else
//        {
//            return number
//        }
//    }
//}
//
//struct absno
//{
//    static func abs(number: Int) -> Int
//    {
//        if number < 0
//        {
//            return (-number)
//        }
//        else
//        {
//            return number
//        }
//    }
//}
//
//let no = Math.abs(number: -35)
//let num = absno.abs(number: -5)
//
//print(no)
//print(num)

//struct area {
//    var length = 1
//    var breadth = 1
//
//    func area() -> Int {
//        return length * breadth
//    }
//
//    mutating func scaleBy(res: Int) {
//        self.length *= res
//        self.breadth *= res
//        print(length)
//        print(breadth)
//    }
//}
//var val = area(length: 3, breadth: 5)
//val.scaleBy(res: 13)

////改变代码块的属性，结果数据会叠加
//struct area {
//    var length = 1
//    var breadth = 1
//
//    func area() -> Int {
//        return length * breadth
//    }
//
//    mutating func scaleBy(res: Int) {
//        length *= res
//        breadth *= res
//
//        print(length)
//        print(breadth)
//    }
//}
//
//var val = area(length: 3, breadth: 5)
//val.scaleBy(res: 3)
//val.scaleBy(res: 30)
//val.scaleBy(res: 300)



//class calculations {
//    let a: Int
//    let b: Int
//    let res: Int
//
//    init(a: Int, b: Int) {
//        self.a = a
//        self.b = b
//        res = a + b
//        print("Self 内: \(res)")
//    }
//
//    func tot(c: Int) -> Int {
//        return res - c
//    }
//
//    func result() {
//        print("结果为: \(tot(c: 20))")
//        print("结果为: \(tot(c: 50))")
//    }
//}
//
//let pri = calculations(a: 600, b: 300)
//let sum = calculations(a: 1200, b: 300)
//
//pri.result()
//sum.result()

//class multiplication {
//    var count: Int = 0
//    func incrementBy(first no1: Int, no2: Int) {
//        count = no1 * no2
//        print(count)
//    }
//}
//
//let counter = multiplication()
//counter.incrementBy(first: 800, no2: 3)
//counter.incrementBy(first: 100, no2: 5)
//counter.incrementBy(first: 15000, no2: 3)

//class division {
//    var count: Int = 0
//    func incrementBy(no1: Int, no2: Int) {
//        count = no1 / no2
//        print(count)
//    }
//}
//
//let counter = division()
//counter.incrementBy(no1: 1800, no2: 3)
//counter.incrementBy(no1: 1600, no2: 5)
//counter.incrementBy(no1: 11000, no2: 3)



//class Counter {
//    var count = 0
//    func increment() {
//        count += 1
//    }
//    func incrementBy(amount: Int) {
//        count += amount
//    }
//    func reset() {
//        count = 0
//    }
//}
//// 初始计数值是0
//let counter = Counter()
//
//// 计数值现在是1
//counter.increment()
//
//// 计数值现在是6
//counter.incrementBy(amount: 5)
//print(counter.count)
//
//// 计数值现在是0
//counter.reset()
//print(counter.count)

//struct StudMarks {
//    static let markCount = 97
//    static var totalCount = 0
//    var InternalMarks: Int = 0 {
//        didSet {
//            if InternalMarks > StudMarks.markCount {
//                InternalMarks = StudMarks.markCount
//            }
//            if InternalMarks > StudMarks.totalCount {
//                StudMarks.totalCount = InternalMarks
//            }
//        }
//    }
//}
//
//var stud1Mark1 = StudMarks()
//var stud1Mark2 = StudMarks()
//
//stud1Mark1.InternalMarks = 98
//print(stud1Mark1.InternalMarks)
//
//stud1Mark2.InternalMarks = 87
//print(stud1Mark2.InternalMarks)

//struct Structname {
//    static var storedTypeProperty = " "
//    static var computedTypeProperty: Int {
//        // 这里返回一个 Int 值
//    }
//}
//
//enum Enumname {
//    static var storedTypeProperty = " "
//    static var computedTypeProperty: Int {
//        // 这里返回一个 Int 值
//    }
//}
//
//class Classname {
//    class var computedTypeProperty: Int {
//        // 这里返回一个 Int 值
//    }
//}

//class Samplepgm {
//    var counter: Int = 0{
//        willSet(newTotal){
//            print("计数器: \(newTotal)")
//        }
//        didSet{
//            if counter > oldValue {
//                print("新增数 \(counter - oldValue)")
//            }
//        }
//    }
//}
//let NewCounter = Samplepgm()
//NewCounter.counter = 100
//NewCounter.counter = 800

//class film {
//    var head = ""
//    var duration = 0.0
//    var metaInfo: [String:String] {
//        return [
//            "head": self.head,
//            "duration":"\(self.duration)"
//        ]
//    }
//}
//
//var movie = film()
//movie.head = "Swift 属性"
//movie.duration = 3.09
//
//print(movie.metaInfo["head"]!)
//print(movie.metaInfo["duration"]!)

//class sample {
//    var no1 = 0.0, no2 = 0.0
//    var length = 300.0, breadth = 150.0
//
//    var middle: (Double, Double) {
//        get{
//            return (length / 2, breadth / 2)
//        }
//        set(axis){
//            no1 = axis.0 - (length / 2)
//            no2 = axis.1 - (breadth / 2)
//        }
//    }
//}
//
//var result = sample()
//print(result.middle)
//result.middle = (0.0, 10.0)
//
//print(result.no1)
//print(result.no2)

//class sample {
//    lazy var no = number() // `var` 关键字是必须的
//}
//
//class number {
//    var name = "Runoob Swift 教程"
//}
//
//var firstsample = sample()
//print(firstsample.no.name)

//struct Number
//{
//    var digits: Int
//    let numbers = 3.1415
//}
//
//var n = Number(digits: 12345)
//n.digits = 67
//
//print("\(n.digits)")
//print("\(n.numbers)")
//n.numbers = 8.7


//struct Number
//{
//    var digits: Int
//    let pi = 3.1415
//}
//
//var n = Number(digits: 12345)
//n.digits = 67
//
//print("\(n.digits)")
//print("\(n.pi)")

//class SampleClass: Equatable {
//    let myProperty: String
//    init(s: String) {
//        myProperty = s
//    }
//}
//func ==(lhs: SampleClass, rhs: SampleClass) -> Bool {
//    return lhs.myProperty == rhs.myProperty
//}
//
//let spClass1 = SampleClass(s: "Hello")
//let spClass2 = SampleClass(s: "Hello")
//
//if spClass1 === spClass2 {// false
//    print("引用相同的类实例 \(spClass1)")
//}
//
//if spClass1 !== spClass2 {// true
//    print("引用不相同的类实例 \(spClass2)")
//}


//class MarksStruct {
//    var mark: Int
//    init(mark: Int) {
//        self.mark = mark
//    }
//}

//class studentMarks {
//    var mark1 = 300
//    var mark2 = 400
//    var mark3 = 900
//}
//let marks = studentMarks()
//print("Mark1 is \(marks.mark1)")
//print("Mark2 is \(marks.mark2)")
//print("Mark3 is \(marks.mark3)")





//struct markStruct{
//    var mark1: Int
//    var mark2: Int
//    var mark3: Int
//
//    init(mark1: Int, mark2: Int, mark3: Int){
//        self.mark1 = mark1
//        self.mark2 = mark2
//        self.mark3 = mark3
//    }
//}
//
//print("优异成绩:")
//var marks = markStruct(mark1: 98, mark2: 96, mark3:100)
//print(marks.mark1)
//print(marks.mark2)
//print(marks.mark3)
//
//print("糟糕成绩:")
//var fail = markStruct(mark1: 34, mark2: 42, mark3: 13)
//print(fail.mark1)
//print(fail.mark2)
//print(fail.mark3)

//struct MarksStruct {
//    var mark: Int
//
//    init(mark: Int) {
//        self.mark = mark
//    }
//}
//var aStruct = MarksStruct(mark: 98)
//var bStruct = aStruct // aStruct 和 bStruct 是使用相同值的结构体！
//bStruct.mark = 97
//print(aStruct.mark) // 98
//print(bStruct.mark) // 97

////struct是数据的集合
//struct studentMarks {
//    var mark1 = 100
//    var mark2 = 78
//    var mark3 = 98
//}
//let marks = studentMarks()
//print("Mark1 是 \(marks.mark1)")
//print("Mark2 是 \(marks.mark2)")
//print("Mark3 是 \(marks.mark3)")

//enum Month: Int {
//    case January = 1, February, March, April, May, June, July, August, September, October, November, December
//}
//
//let yearMonth = Month.May.rawValue
//print("数字月份为: \(yearMonth)。")


////数组也能枚举
//enum Student{
//    case Name(String)
//    case Mark(Int,Int,Int)
//}
//var studDetails = Student.Name("Runoob")
//var studMarks = Student.Mark(98,97,95)
//
//switch studMarks {
//case .Name(let studName):
//    print("学生的名字是: \(studName)。")
//case .Mark(let Mark1, let Mark2, let Mark3):
//    print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
//}


////枚举
//// 定义枚举
//enum DaysofaWeek {
//    case Sunday
//    case Monday
//    case TUESDAY
//    case WEDNESDAY
//    case THURSDAY
//    case FRIDAY
//    case Saturday
//}
//
//var weekDay = DaysofaWeek.THURSDAY
//weekDay = .FRIDAY
//switch weekDay
//{
//case .Sunday:
//    print("星期天")
//case .Monday:
//    print("星期一")
//case .TUESDAY:
//    print("星期二")
//case .WEDNESDAY:
//    print("星期三")
//case .THURSDAY:
//    print("星期四")
//case .FRIDAY:
//    print("星期五")
//case .Saturday:
//    print("星期六")
//}

//func makeIncrementor(forIncrement amount: Int) -> () -> Int {
//    var runningTotal = 0
//    func incrementor() -> Int {
//        runningTotal += amount
//        return runningTotal
//    }
//    return incrementor
//}
//
//let incrementByTen = makeIncrementor(forIncrement: 10)

//// 返回的值为10
//incrementByTen()
//
//// 返回的值为20
//incrementByTen()
//
//// 返回的值为30
//incrementByTen()
//
//// 返回的值为40
//incrementByTen()
//
//let alsoIncrementByTen = incrementByTen
//
//// 返回的值也为50
//print(alsoIncrementByTen())


//func makeIncrementor(forIncrement amount: Int) -> () -> Int {
//    var runningTotal = 0
//    func incrementor() -> Int {
//        runningTotal += amount
//        return runningTotal
//    }
//    return incrementor
//}
//
//let incrementByTen = makeIncrementor(forIncrement: 10)
//
//// 返回的值为10
//print(incrementByTen())
//
//// 返回的值为20
//print(incrementByTen())
//
//// 返回的值为30
//print(incrementByTen())

//let names = ["AT", "AE", "D", "S", "BE"]
//
//var reversed = names.sorted{ $0 > $1 }
//print(reversed)

//let names = ["AT", "AE", "D", "S", "BE"]
//
//var reversed = names.sorted( by: { $0 > $1 } )
//print(reversed)

//let names = ["AT", "AE", "D", "S", "BE"]
//
//// 使用普通函数(或内嵌函数)提供排序功能,闭包函数类型需为(String, String) -> Bool。
//func backwards(s1: String, s2: String) -> Bool {
//    return s1 > s2
//}
//var reversed = names.sorted(by: backwards)
//
//print(reversed)

//let divide = {(val1: Int, val2: Int) -> Int in
//    return val1 / val2
//}
//let result = divide(200, 20)
//print (result)
//
//let studname = { print("Swift 闭包实例。") }
//studname()

//func calcDecrement(forDecrement total: Int)  -> ()-> Int {//第一个返回值是大函数的，第二个返回值是内嵌函数的
//    var overallDecrement = 0
//    func decrementer() -> Int {
//        overallDecrement -= total
//        return overallDecrement
//    }
//    return decrementer
//}
//let decrem = calcDecrement(forDecrement: 30)
//print(decrem())

//func swapTwoInts( a:inout Int, b:inout Int){
//
//    let t = a
//    a = b
//    b = t
//}
//
//var x = 0,y = 100
//print("x = \(x) ;y = \(y)")
//
//swapTwoInts(a: &x, b:&y)
//print("x = \(x) ;y = \(y)")

//func swapTwoInts(a:Int, b:Int){
//
//    var a = a
//    var b = b
//    let t = a
//    a = b
//    b = t
//}
//
//var x = 0,y = 100
//print("x = \(x) ;y = \(y)")
//
//swapTwoInts(a: x, b:y)
//print("x = \(x) ;y = \(y)")

//func vari<N>(members: N...){
//    for i in members {
//        print(i)
//    }
//}
//vari(members: 4,3,5)
//vari(members: 4.5, 3.1, 5.6)
//vari(members: "Google", "Baidu", "Runoob")

//func mult(no1: Int, no2: Int) -> Int {
//    return no1*no2
//}
//print(mult(no1: 2, no2:20))
//print(mult(no1: 3, no2:15))
//print(mult(no1: 4, no2:30))
//
//func sitename() -> String {
//    return "菜鸟教程"
//}
//print(sitename())
//
//func minMax(array: [Int]) -> (min: Int, max: Int) {
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count] {
//        print("进来的value是\(value)")
//        if value < currentMin {
//            currentMin = value
//            print(value)
//        } else if value > currentMax {
//            currentMax = value
//            print(value)
//        }
//    }
//    return (currentMin, currentMax)
//}
//
//let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
//
//
//print("最小值为 \(bounds.min) ，最大值为 \(bounds.max)")


//func name(site:String)->String{
//    return site;
//}


//print(name(site: "asdasd"))

//var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
//
//var someVar = someDict[1]
//
//print( "key = 1 的值为 \(someVar)" )
//print( "key = 2 的值为 \(someDict[2])" )
//print( "key = 3 的值为 \(someDict[3])" )


//var someInts = [Int]()

//someInts.append(20)
//someInts.append(30)
//someInts += [40]
//
//var someVar = someInts[0]
//
//print( "第一个元素的值 \(someVar)" )
//print( "第二个元素的值 \(someInts[1])" )
//print( "第三个元素的值 \(someInts[2])" )



//var someInts = [Int](repeating: 0, count: 3)
//
//var asomeInts:[Int] = [10, 20, 30]
//
////区间运算符
//
//print("闭区间运算符:")
//for index in 1...5 {
//    print("\(index) * 5 = \(index * 5)")
//}
//
//print("半开区间运算符:")
//for index in 1..<5 {
//    print("\(index) * 5 = \(index * 5)")
//}


//let constA = 42
//print(constA)
//
//let constB:Float = 3.14159
//
//print(constB)


//var myString:String? = nil
//
//if myString != nil {
//    print(myString)
//}else{
//    print("字符串为 nil")
//}

//var myString:String!

//    myString = "Hello, Swift!"
//
//    if myString != nil {
//        print(myString)
//    }else{
//        print("myString 值为 nil")
//    }

//    var myString:String!
//
//    myString = "Hello, Swift!"
//
//    if let yourString = myString {
//        print("你的字符串值为 - \(yourString)")
//    }else{
//        print("你的字符串没有值")
//    }



//func test(){
//    var myString  = "Hello,World!"
//    
//    print(myString)
//    
//    let a = 1+2
//    
//    /* 这是第一个多行注释的开头
//     
//     /* 这是嵌套的第二个多行注释 */
//     
//     这是第一个多行注释的结尾 */
//    
//    
//    //数据类型的别名
//    typealias feet = Int
//    
//    var distance:feet = 100
//    
//    print(distance)
//    
//    //类型固定，无法更换
//    //var varA = 42
//    //varA = "This is hello"
//    //print(varA)
//    
//    let meaningOfLife = 42
//    // meaningOfLife 会被推测为 Int 类型
//    
//    let pi = 3.14159
//    // pi 会被推测为 Double 类型
//    
//    let anotherPi = 3 + 0.14159
//    // anotherPi 会被推测为 Double 类型
//    
//    var _var = "Hello, Swift!"
//    print(_var)
//    
//    var 你好 = "你好世界"
//    var 百度 = "www.baidu.com"
//    print(你好)
//    print(百度)
//    print("\(你好)的网址为：\(百度)")
//    
//    //要么是一个整数 要么是空值
//    var optionalInteger: Int?
//    var optionalInteger1: Optional<Int>
//}
