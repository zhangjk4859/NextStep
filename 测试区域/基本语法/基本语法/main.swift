//
//  main.swift
//  基本语法
//
//  Created by 张俊凯 on 2017/1/12.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import Cocoa

// 定义一个交换两个变量的函数
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var numb1 = 100
var numb2 = 200

print("交换前数据:  \(numb1) 和 \(numb2)")
swapTwoValues(&numb1, &numb2)
print("交换后数据: \(numb1) 和 \(numb2)")

var str1 = "A"
var str2 = "B"

print("交换前数据:  \(str1) 和 \(str2)")
swapTwoValues(&str1, &str2)
print("交换后数据: \(str1) 和 \(str2)")

//func swapTwoStrings(_ a: inout String, _ b: inout String) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}

// 定义一个交换两个变量的函数
//func swapTwoInts(_ a: inout Int, _ b: inout Int) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//var numb1 = 100
//var numb2 = 200
//
//print("交换前数据: \(numb1) 和 \(numb2)")
//swapTwoInts(&numb1, &numb2)
//print("交换后数据: \(numb1) 和 \(numb2)")


//protocol classa {
//    
//    var marks: Int { get set }
//    var result: Bool { get }
//    
//    func attendance() -> String
//    func markssecured() -> String
//    
//}
//
//protocol classb: classa {
//    
//    var present: Bool { get set }
//    var subject: String { get set }
//    var stname: String { get set }
//    
//}
//
//class classc: classb {
//    var marks = 96
//    let result = true
//    var present = false
//    var subject = "Swift 协议"
//    var stname = "Protocols"
//    
//    func attendance() -> String {
//        return "The \(stname) has secured 99% attendance"
//    }
//    
//    func markssecured() -> String {
//        return "\(stname) has scored \(marks)"
//    }
//}
//
//let studdet = classc()
//studdet.stname = "Swift"
//studdet.marks = 98
//studdet.markssecured()
//
//print(studdet.marks)
//print(studdet.result)
//print(studdet.present)
//print(studdet.subject)
//print(studdet.stname)


//extension Int {
//    func topics(summation: () -> ()) {
//        for _ in 0..<self {
//            summation()
//        }
//    }
//}
//
//4.topics(summation: {
//    print("扩展模块内")
//})
//
//3.topics(summation: {
//    print("内型转换模块内")
////})

//struct sum {
//    var num1 = 100, num2 = 200
//}
//
//struct diff {
//    var no1 = 200, no2 = 100
//}
//
//struct mult {
//    var a = sum()
//    var b = diff()
//}
//
//
//extension mult {
//    init(x: sum, y: diff) {
//        _ = x.num1 + x.num2
//        _ = y.no1 + y.no2
//    }
//}
//
//
//let a = sum(num1: 100, num2: 200)
//let b = diff(no1: 200, no2: 100)
//
//let getMult = mult(x: a, y: b)
//print("getMult sum\(getMult.a.num1, getMult.a.num2)")
//print("getMult diff\(getMult.b.no1, getMult.b.no2)")


//extension Int {
//    var add: Int {return self + 100 }
//    var sub: Int { return self - 10 }
//    var mul: Int { return self * 10 }
//    var div: Int { return self / 5 }
//}
//
//let addition = 3.add
//print("加法运算后的值：\(addition)")
//
//let subtraction = 120.sub
//print("减法运算后的值：\(subtraction)")
//
//let multiplication = 39.mul
//print("乘法运算后的值：\(multiplication)")
//
//let division = 55.div
//print("除法运算后的值: \(division)")
//
//let mix = 30.add + 34.sub
//print("混合运算结果：\(mix)")


//class Subjects {
//    var physics: String
//    init(physics: String) {
//        self.physics = physics
//    }
//}
//
//class Chemistry: Subjects {
//    var equations: String
//    init(physics: String, equations: String) {
//        self.equations = equations
//        super.init(physics: physics)
//    }
//}
//
//class Maths: Subjects {
//    var formulae: String
//    init(physics: String, formulae: String) {
//        self.formulae = formulae
//        super.init(physics: physics)
//    }
//}
//
//// [AnyObject] 类型的数组
//let saprint: [AnyObject] = [
//    Chemistry(physics: "固体物理", equations: "赫兹"),
//    Maths(physics: "流体动力学", formulae: "千兆赫"),
//    Chemistry(physics: "热物理学", equations: "分贝"),
//    Maths(physics: "天体物理学", formulae: "兆赫"),
//    Maths(physics: "微分方程", formulae: "余弦级数")]
//
//
//let samplechem = Chemistry(physics: "固体物理", equations: "赫兹")
//print("实例物理学是: \(samplechem.physics)")
//print("实例方程式: \(samplechem.equations)")
//
//
//let samplemaths = Maths(physics: "流体动力学", formulae: "千兆赫")
//print("实例物理学是: \(samplemaths.physics)")
//print("实例公式是: \(samplemaths.formulae)")
//
//var chemCount = 0
//var mathsCount = 0
//
//for item in saprint {
//    // 类型转换的条件形式
//    if let show = item as? Chemistry {
//        print("化学主题是: '\(show.physics)', \(show.equations)")
//        // 强制形式
//    } else if let example = item as? Maths {
//        print("数学主题是: '\(example.physics)',  \(example.formulae)")
//    }
//}
//
//var exampleany = [Any]()
//exampleany.append(12)
//exampleany.append(3.14159)
//exampleany.append("Any 实例")
//exampleany.append(Chemistry(physics: "固体物理", equations: "兆赫"))
//
//for item2 in exampleany {
//    switch item2 {
//    case let someInt as Int:
//        print("整型值为 \(someInt)")
//    case let someDouble as Double where someDouble > 0:
//        print("Pi 值为 \(someDouble)")
//    case let someString as String:
//        print("\(someString)")
//    case let phy as Chemistry:
//        print("主题 '\(phy.physics)', \(phy.equations)")
//    default:
//        print("None")
//    }
//}


//class Subjects {
//    var physics: String
//    init(physics: String) {
//        self.physics = physics
//    }
//}
//
//class Chemistry: Subjects {
//    var equations: String
//    init(physics: String, equations: String) {
//        self.equations = equations
//        super.init(physics: physics)
//    }
//}
//
//class Maths: Subjects {
//    var formulae: String
//    init(physics: String, formulae: String) {
//        self.formulae = formulae
//        super.init(physics: physics)
//    }
//}
//
//let sa = [
//    Chemistry(physics: "固体物理", equations: "赫兹"),
//    Maths(physics: "流体动力学", formulae: "千兆赫"),
//    Chemistry(physics: "热物理学", equations: "分贝"),
//    Maths(physics: "天体物理学", formulae: "兆赫"),
//    Maths(physics: "微分方程", formulae: "余弦级数")]
//
//
//let samplechem = Chemistry(physics: "固体物理", equations: "赫兹")
//print("实例物理学是: \(samplechem.physics)")
//print("实例方程式: \(samplechem.equations)")
//
//
//let samplemaths = Maths(physics: "流体动力学", formulae: "千兆赫")
//print("实例物理学是: \(samplemaths.physics)")
//print("实例公式是: \(samplemaths.formulae)")
//
//var chemCount = 0
//var mathsCount = 0
//
//for item in sa {
//    // 类型转换的条件形式
//    if let show = item as? Chemistry {
//        print("化学主题是: '\(show.physics)', \(show.equations)")
//        // 强制形式
//    } else if let example = item as? Maths {
//        print("数学主题是: '\(example.physics)',  \(example.formulae)")
//    }
//}
//
//// 可以存储Any类型的数组 exampleany
//var exampleany = [Any]()
//
//exampleany.append(12)
//exampleany.append(3.14159)
//exampleany.append("Any 实例")
//exampleany.append(Chemistry(physics: "固体物理", equations: "兆赫"))
//
//for item2 in exampleany {
//    switch item2 {
//    case let someInt as Int:
//        print("整型值为 \(someInt)")
//    case let someDouble as Double where someDouble > 0:
//        print("Pi 值为 \(someDouble)")
//    case let someString as String:
//        print("\(someString)")
//    case let phy as Chemistry:
//        print("主题 '\(phy.physics)', \(phy.equations)")
//    default:
//        print("None")
//    }
//}


//class Subjects {
//    var physics: String
//    init(physics: String) {
//        self.physics = physics
//    }
//}
//
//class Chemistry: Subjects {
//    var equations: String
//    init(physics: String, equations: String) {
//        self.equations = equations
//        super.init(physics: physics)
//    }
//}
//
//class Maths: Subjects {
//    var formulae: String
//    init(physics: String, formulae: String) {
//        self.formulae = formulae
//        super.init(physics: physics)
//    }
//}
//
//let sa = [
//    Chemistry(physics: "固体物理", equations: "赫兹"),
//    Maths(physics: "流体动力学", formulae: "千兆赫"),
//    Chemistry(physics: "热物理学", equations: "分贝"),
//    Maths(physics: "天体物理学", formulae: "兆赫"),
//    Maths(physics: "微分方程", formulae: "余弦级数")]
//
//
//let samplechem = Chemistry(physics: "固体物理", equations: "赫兹")
//print("实例物理学是: \(samplechem.physics)")
//print("实例方程式: \(samplechem.equations)")
//
//
//let samplemaths = Maths(physics: "流体动力学", formulae: "千兆赫")
//print("实例物理学是: \(samplemaths.physics)")
//print("实例公式是: \(samplemaths.formulae)")
//
//var chemCount = 0
//var mathsCount = 0
//
//for item in sa {//是化学模式的时候 成立！
//    // 类型转换的条件形式
//    if let show = item as? Chemistry {
//        print("化学主题是: '\(show.physics)', \(show.equations)")
//        // 强制形式
//    } else if let example = item as? Maths {
//        print("数学主题是: '\(example.physics)',  \(example.formulae)")
//    }
//}

//class Subjects {
//    var physics: String
//    init(physics: String) {
//        self.physics = physics
//    }
//}
//
//class Chemistry: Subjects {
//    var equations: String
//    init(physics: String, equations: String) {
//        self.equations = equations
//        super.init(physics: physics)
//    }
//}
//
//class Maths: Subjects {
//    var formulae: String
//    init(physics: String, formulae: String) {
//        self.formulae = formulae
//        super.init(physics: physics)
//    }
//}
//
//let sa = [
//    Chemistry(physics: "固体物理", equations: "赫兹"),
//    Maths(physics: "流体动力学", formulae: "千兆赫"),
//    Chemistry(physics: "热物理学", equations: "分贝"),
//    Maths(physics: "天体物理学", formulae: "兆赫"),
//    Maths(physics: "微分方程", formulae: "余弦级数")]
//
//
//let samplechem = Chemistry(physics: "固体物理", equations: "赫兹")
//print("实例物理学是: \(samplechem.physics)")
//print("实例方程式: \(samplechem.equations)")
//
//
//let samplemaths = Maths(physics: "流体动力学", formulae: "千兆赫")
//print("实例物理学是: \(samplemaths.physics)")
//print("实例公式是: \(samplemaths.formulae)")
//
//var chemCount = 0
//var mathsCount = 0
//for item in sa {
//    // 如果是一个 Chemistry 类型的实例，返回 true，相反返回 false。
//    if item is Chemistry {
//        chemCount += 1
//    } else if item is Maths {
//        mathsCount += 1
//    }
//}
//
//print("化学科目包含 \(chemCount) 个主题，数学包含 \(mathsCount) 个主题")

//class Subjects {
//    var physics: String
//    init(physics: String) {
//        self.physics = physics
//    }
//}
//
//class Chemistry: Subjects {
//    var equations: String
//    init(physics: String, equations: String) {
//        self.equations = equations
//        super.init(physics: physics)
//    }
//}
//
//class Maths: Subjects {
//    var formulae: String
//    init(physics: String, formulae: String) {
//        self.formulae = formulae
//        super.init(physics: physics)
//    }
//}
//
//let sa = [
//    Chemistry(physics: "固体物理", equations: "赫兹"),
//    Maths(physics: "流体动力学", formulae: "千兆赫")]
//
//
//let samplechem = Chemistry(physics: "固体物理", equations: "赫兹")
//print("实例物理学是: \(samplechem.physics)")
//print("实例方程式: \(samplechem.equations)")
//
//
//let samplemaths = Maths(physics: "流体动力学", formulae: "千兆赫")
//print("实例物理学是: \(samplemaths.physics)")
//print("实例公式是: \(samplemaths.formulae)")


//class HTMLElement {
//    
//    let name: String
//    let text: String?
//    
//    lazy var asHTML: () -> String = {
//        [unowned self] in
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }
//    
//    init(name: String, text: String? = nil) {
//        self.name = name
//        self.text = text
//    }
//    
//    deinit {
//        print("\(name) 被析构")
//    }
//    
//}
//
////创建并打印HTMLElement实例
//var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
//print(paragraph!.asHTML())
//
//// HTMLElement实例将会被销毁，并能看到它的析构函数打印出的消息
//paragraph = nil

//
//class HTMLElement {
//    
//    let name: String
//    let text: String?
//    
//    lazy var asHTML: () -> String = {
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }
//    
//    init(name: String, text: String? = nil) {
//        self.name = name
//        self.text = text
//    }
//    
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//    
//}
//
//// 创建实例并打印信息
//var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
//print(paragraph!.asHTML())


//class Student {
//    let name: String
//    var section: Marks?
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    deinit { print("\(name)") }
//}
//class Marks {
//    let marks: Int
//    unowned let stname: Student
//    
//    init(marks: Int, stname: Student) {
//        self.marks = marks
//        self.stname = stname
//    }
//    
//    deinit { print("学生的分数为 \(marks)") }
//}
//
//var module: Student?
//module = Student(name: "ARC")
//module!.section = Marks(marks: 98, stname: module!)
//module = nil


//class Module {
//    let name: String
//    init(name: String) { self.name = name }
//    var sub: SubModule?
//    deinit { print("\(name) 主模块") }
//}
//
//class SubModule {
//    let number: Int
//    
//    init(number: Int) { self.number = number }
//    
//    weak var topic: Module?
//    
//    deinit { print("子模块 topic 数为 \(number)") }
//}
//
//var toc: Module?
//var list: SubModule?
//toc = Module(name: "ARC")
//list = SubModule(number: 4)
//toc!.sub = list
//list!.topic = toc
//
//toc = nil
//list = nil


//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    var apartment: Apartment?
//    deinit { print("\(name) 被析构") }
//}
//
//class Apartment {
//    let number: Int
//    init(number: Int) { self.number = number }
//    var tenant: Person?
//    deinit { print("Apartment #\(number) 被析构") }
//}
//
//// 两个变量都被初始化为nil
//var runoob: Person?
//var number73: Apartment?
//
//// 赋值
//runoob = Person(name: "Runoob")
//number73 = Apartment(number: 73)
//
//// 意感叹号是用来展开和访问可选变量 runoob 和 number73 中的实例
//// 循环强引用被创建
//runoob!.apartment = number73
//number73!.tenant = runoob
//
//// 断开 runoob 和 number73 变量所持有的强引用时，引用计数并不会降为 0，实例也不会被 ARC 销毁
//// 注意，当你把这两个变量设为nil时，没有任何一个析构函数被调用。
//// 强引用循环阻止了Person和Apartment类实例的销毁，并在你的应用程序中造成了内存泄漏
//runoob = nil
//number73 = nil


//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) 开始初始化")
//    }
//    deinit {
//        print("\(name) 被析构")
//    }
//}
//
//// 值会被自动初始化为nil，目前还不会引用到Person类的实例
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//// 创建Person类的新实例
//reference1 = Person(name: "Runoob")
//
//
////赋值给其他两个变量，该实例又会多出两个强引用
//reference2 = reference1
//reference3 = reference1
//
////断开第一个强引用
//reference1 = nil
////断开第二个强引用
//reference2 = nil
////断开第三个强引用，并调用析构函数
//reference3 = nil









