//
//  main.swift
//  基本语法
//
//  Created by 张俊凯 on 2017/1/12.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import Foundation

let names = ["AT", "AE", "D", "S", "BE"]

var reversed = names.sorted{ $0 > $1 }
print(reversed)

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



func test(){
    var myString  = "Hello,World!"
    
    print(myString)
    
    let a = 1+2
    
    /* 这是第一个多行注释的开头
     
     /* 这是嵌套的第二个多行注释 */
     
     这是第一个多行注释的结尾 */
    
    
    //数据类型的别名
    typealias feet = Int
    
    var distance:feet = 100
    
    print(distance)
    
    //类型固定，无法更换
    //var varA = 42
    //varA = "This is hello"
    //print(varA)
    
    let meaningOfLife = 42
    // meaningOfLife 会被推测为 Int 类型
    
    let pi = 3.14159
    // pi 会被推测为 Double 类型
    
    let anotherPi = 3 + 0.14159
    // anotherPi 会被推测为 Double 类型
    
    var _var = "Hello, Swift!"
    print(_var)
    
    var 你好 = "你好世界"
    var 百度 = "www.baidu.com"
    print(你好)
    print(百度)
    print("\(你好)的网址为：\(百度)")
    
    //要么是一个整数 要么是空值
    var optionalInteger: Int?
    var optionalInteger1: Optional<Int>
}





