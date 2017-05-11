//
//  struct.swift
//  基本语法
//
//  Created by 张俊凯 on 2017/1/13.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import Foundation

//class Person {
//    var residence: Residence?
//}
//
//// 定义了一个变量 rooms，它被初始化为一个Room[]类型的空数组
//class Residence {
//    var rooms = [Room]()
//    var numberOfRooms: Int {
//        return rooms.count
//    }
//    subscript(i: Int) -> Room {
//        return rooms[i]
//    }
//    func printNumberOfRooms() {
//        print("房间号为 \(numberOfRooms)")
//    }
//    var address: Address?
//}
//
//// Room 定义一个name属性和一个设定room名的初始化器
//class Room {
//    let name: String
//    init(name: String) { self.name = name }
//}
//
//// 模型中的最终类叫做Address
//class Address {
//    var buildingName: String?
//    var buildingNumber: String?
//    var street: String?
//    func buildingIdentifier() -> String? {
//        if (buildingName != nil) {
//            return buildingName
//        } else if (buildingNumber != nil) {
//            return buildingNumber
//        } else {
//            return nil
//        }
//    }
//}
//
//let john = Person()
//
//
//if ((john.residence?.printNumberOfRooms()) != nil) {
//    print("输出房间号")
//} else {
//    print("无法输出房间号")
//}



//class Person {
//    var residence: Residence?
//}
//
//// 定义了一个变量 rooms，它被初始化为一个Room[]类型的空数组
//class Residence {
//    var rooms = [Room]()
//    var numberOfRooms: Int {
//        return rooms.count
//    }
//    subscript(i: Int) -> Room {
//        return rooms[i]
//    }
//    func printNumberOfRooms() {
//        print("房间号为 \(numberOfRooms)")
//    }
//    var address: Address?
//}
//
//// Room 定义一个name属性和一个设定room名的初始化器
//class Room {
//    let name: String
//    init(name: String) { self.name = name }
//}
//
//// 模型中的最终类叫做Address
//class Address {
//    var buildingName: String?
//    var buildingNumber: String?
//    var street: String?
//    func buildingIdentifier() -> String? {
//        if (buildingName != nil) {
//            return buildingName
//        } else if (buildingNumber != nil) {
//            return buildingNumber
//        } else {
//            return nil
//        }
//    }
//}


//class Person {
//    var residence: Residence?
//}
//
//class Residence {
//    var numberOfRooms = 1
//}
//
//let john = Person()
//
//// 链接可选residence?属性，如果residence存在则取回numberOfRooms的值
//if let roomCount = john.residence?.numberOfRooms {
//    print("John 的房间号为 \(roomCount)。")
//} else {
//    print("不能查看房间号")
//}

//
//class Person {
//    var residence: Residence?
//}
//
//class Residence {
//    var numberOfRooms = 1
//}
//
//let john = Person()
//
////将导致运行时错误
//let roomCount = john.residence?.numberOfRooms
//
//print(roomCount)







//var counter = 0;  // 引用计数器

//class BaseClass {
//    init() {
//        counter += 1;
//    }
//
//    deinit {
//        counter -= 1;
//    }
//}
//
//var show: BaseClass? = BaseClass()
//
//print(counter)
//print(counter)


//var counter = 0;  // 引用计数器
//class BaseClass {
//    init() {
//        counter += 1;
//    }
//    deinit {
//        counter -= 1;
//    }
//}
//
//var show: BaseClass? = BaseClass()
//print(counter)
//show = nil
//print(counter)


//struct StudRecord {
//    let stname: String
//
//    init!(stname: String) {
//        if stname.isEmpty {return nil }
//        self.stname = stname
//    }
//}
//
//let stmark = StudRecord(stname: "Runoob")
//if let name = stmark {
//    print("指定了学生名")
//}
//
//let blankname = StudRecord(stname: "")
//if blankname == nil {
//    print("学生名为空")
//}

//class Planet {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//     convenience init() {
//        self.init(name: "[No Planets]")
//    }
//}
//let plName = Planet(name: "Mercury")
//print("行星的名字是: \(plName.name)")
//
//let noplName = Planet()
//print("没有这个名字的行星: \(noplName.name)")
//
//class planets: Planet {
//    var count: Int
//
//    init(name: String, count: Int) {
//        self.count = count
//        super.init(name: name)
//    }
//
//    override convenience init(name: String) {
//        self.init(name: name, count: 1)
//    }
//}

//class StudRecord {
//    let studname: String!
//    init?(studname: String) {
//        self.studname = studname
//        if studname.isEmpty { return nil }
//    }
//}
//if let stname = StudRecord(studname: "失败构造器") {
//    print("模块为 \(stname.studname)")
//}


//enum TemperatureUnit {
//    // 开尔文，摄氏，华氏
//    case Kelvin, Celsius, Fahrenheit
//    init?(symbol: Character) {
//        switch symbol {
//        case "K":
//            self = .Kelvin
//        case "C":
//            self = .Celsius
//        case "F":
//            self = .Fahrenheit
//        default:
//            return nil
//        }
//    }
//}
//
//
//let fahrenheitUnit = TemperatureUnit(symbol: "F")
//if fahrenheitUnit != nil {
//    print("这是一个已定义的温度单位，所以初始化成功。")
//}
//
//let unknownUnit = TemperatureUnit(symbol: "X")
//if unknownUnit == nil {
//    print("这不是一个已定义的温度单位，所以初始化失败。")
//}

//struct Animal {
//    let species: String
//    init?(species: String) {
//        if species.isEmpty { return nil }
//        self.species = species
//    }
//}
//
////通过该可失败构造器来构建一个Animal的对象，并检查其构建过程是否成功
//// someCreature 的类型是 Animal? 而不是 Animal
//let someCreature = Animal(species: "长颈鹿")
//
//// 打印 "动物初始化为长颈鹿"
//if let giraffe = someCreature {
//    print("动物初始化为\(giraffe.species)")
//}


//class SuperClass {
//    var corners = 4
//    var description: String {
//        return "\(corners) 边"
//    }
//}
//let rectangle = SuperClass()
//print("矩形: \(rectangle.description)")
//
//class SubClass: SuperClass {
//    override init() {  //重载构造器
//        super.init()
//        corners = 5
//    }
//}
//
//let subClass = SubClass()
//print("五角型: \(subClass.description)")

//class mainClass {
//    var no1 : Int // 局部存储变量
//    init(no1 : Int) {
//        self.no1 = no1 // 初始化
//    }
//}
//
//class subClass : mainClass {
//    var no2 : Int
//    init(no1 : Int, no2 : Int) {
//        self.no2 = no2
//        super.init(no1:no1)
//    }
//    // 便利方法只需要一个参数
//    override convenience init(no1: Int)  {
//        self.init(no1:no1, no2:0)
//    }
//}
//let res = mainClass(no1: 20)
//let res2 = subClass(no1: 30, no2: 50)
//
//print("res 为: \(res.no1)")
//print("res2 为: \(res2.no1)")
//print("res2 为: \(res2.no2)")

//class mainClass {
//    var no1 : Int // 局部存储变量
//    init(no1 : Int) {
//        self.no1 = no1 // 初始化
//    }
//}
//class subClass : mainClass {
//    var no2 : Int // 新的子类存储变量
//    init(no1 : Int, no2 : Int) {
//        self.no2 = no2 // 初始化
//        super.init(no1:no1) // 初始化超类
//    }
//}
//
//let res = mainClass(no1: 10)
//let res2 = subClass(no1: 10, no2: 20)
//
//print("res 为: \(res.no1)")
//print("res2 为: \(res2.no1)")
//print("res2 为: \(res2.no2)")


////在init方法里做事情，节省代码
//struct Size {
//    var width = 0.0, height = 0.0
//}
//struct Point {
//    var x = 0.0, y = 0.0
//}
//
//struct Rect {
//    var origin = Point()
//    var size = Size()
//    init() {}
//    init(origin: Point, size: Size) {
//        self.origin = origin
//        self.size = size
//    }
//    init(center: Point, size: Size) {
//        let originX = center.x - (size.width / 2)
//        let originY = center.y - (size.height / 2)
//        self.init(origin: Point(x: originX, y: originY), size: size)
//    }
//}
//
//
//// origin和size属性都使用定义时的默认值Point(x: 0.0, y: 0.0)和Size(width: 0.0, height: 0.0)：
//let basicRect = Rect()
//print("Size 结构体初始值: \(basicRect.size.width, basicRect.size.height) ")
//print("Rect 结构体初始值: \(basicRect.origin.x, basicRect.origin.y) ")
//
//// 将origin和size的参数值赋给对应的存储型属性
//let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
//                      size: Size(width: 5.0, height: 5.0))
//
//print("Size 结构体初始值: \(originRect.size.width, originRect.size.height) ")
//print("Rect 结构体初始值: \(originRect.origin.x, originRect.origin.y) ")
//
//
////先通过center和size的值计算出origin的坐标。
////然后再调用（或代理给）init(origin:size:)构造器来将新的origin和size值赋值到对应的属性中
//let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
//                      size: Size(width: 3.0, height: 3.0))
//
//print("Size 结构体初始值: \(centerRect.size.width, centerRect.size.height) ")
//print("Rect 结构体初始值: \(centerRect.origin.x, centerRect.origin.y) ")

//struct Rectangle {
//    var length = 100.0, breadth = 200.0
//}
//let area = Rectangle(length: 24.0, breadth: 32.0)
//
//print("矩形的面积: \(area.length)")
//print("矩形的面积: \(area.breadth)")

//class ShoppingListItem {
//    var name: String?
//    var quantity = 1
//    var purchased = false
//}
//var item = ShoppingListItem()
//
//
//print("名字为: \(item.name)")
//print("数理为: \(item.quantity)")
//print("是否付款: \(item.purchased)")

//struct Rectangle {
//    let length: Double?
//
//    init(frombreadth breadth: Double) {
//        length = breadth * 10
//    }
//
//    init(frombre bre: Double) {
//        length = bre * 30
//    }
//
//    init(_ area: Double) {
//        length = area
//    }
//}
//
//let rectarea = Rectangle(180.0)
//print("面积为：\(rectarea.length)")
//
//let rearea = Rectangle(370.0)
//print("面积为：\(rearea.length)")
//
//let recarea = Rectangle(110.0)
//print("面积为：\(recarea.length)")

//struct Rectangle {
//    var length: Double?
//
//    init(frombreadth breadth: Double) {
//        length = breadth * 10
//    }
//
//    init(frombre bre: Double) {
//        length = bre * 30
//    }
//
//    init(_ area: Double) {
//        length = area
//    }
//}
//
//let rectarea = Rectangle(180.0)
//print("面积为：\(rectarea.length)")
//
//let rearea = Rectangle(370.0)
//print("面积为：\(rearea.length)")
//
//let recarea = Rectangle(110.0)
//print("面积为：\(recarea.length)")

//struct Rectangle {
//    var length: Double
//
//    init(frombreadth breadth: Double) {
//        length = breadth * 10
//    }
//
//    init(frombre bre: Double) {
//        length = bre * 30
//    }
//    //不提供外部名字
//    init(_ area: Double) {
//        length = area
//    }
//}
//
//// 调用不提供外部名字
//let rectarea = Rectangle(180.0)
//print("面积为: \(rectarea.length)")
//
//// 调用不提供外部名字
//let rearea = Rectangle(370.0)
//print("面积为: \(rearea.length)")
//
//// 调用不提供外部名字
//let recarea = Rectangle(110.0)
//print("面积为: \(recarea.length)")


//struct Color {
//    let red, green, blue: Double
//    init(red: Double, green: Double, blue: Double) {
//        self.red   = red
//        self.green = green
//        self.blue  = blue
//    }
//    init(white: Double) {
//        red   = white
//        green = white
//        blue  = white
//    }
//}
//
//// 创建一个新的Color实例，通过三种颜色的外部参数名来传值，并调用构造器
//let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
//
//print("red 值为: \(magenta.red)")
//print("green 值为: \(magenta.green)")
//print("blue 值为: \(magenta.blue)")
//
//// 创建一个新的Color实例，通过三种颜色的外部参数名来传值，并调用构造器
//let halfGray = Color(white: 0.5)
//print("red 值为: \(halfGray.red)")
//print("green 值为: \(halfGray.green)")
//print("blue 值为: \(halfGray.blue)")

//struct Rectangle {
//    var length: Double
//    var breadth: Double
//    var area: Double
//
//    init(fromLength length: Double, fromBreadth breadth: Double) {
//        self.length = length
//        self.breadth = breadth
//        self.area = length * breadth
//    }
//
//    init(fromLeng leng: Double, fromBread bread: Double) {
//        self.length = leng
//        self.breadth = bread
//        self.area = leng * bread
//    }
//}
//
//let ar = Rectangle(fromLength: 6, fromBreadth: 12)
//print("面积为: \(ar.area)")
//
//let are = Rectangle(fromLeng: 36, fromBread: 12)
//print("面积为: \(are.area)")


//struct rectangle {
//    // 设置默认值
//    var length = 6
//    var breadth = 12
//}
//var area = rectangle()
//print("矩形的面积为 \(area.length*area.breadth)")

//struct rectangle {
//    var length: Double
//    var breadth: Double
//    init() {
//        length = 6
//        breadth = 12
//    }
//}
//var area = rectangle()
//print("矩形面积为 \(area.length*area.breadth)")
