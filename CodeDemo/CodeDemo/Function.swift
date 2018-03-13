//
//  Function.swift
//  CodeDemo
//
//  Created by heguican on 2018/3/13.
//  Copyright © 2018年 heguican. All rights reserved.
//

import Foundation

//MARK: - 自增自减实现
prefix func ++(x: inout Int) -> Int{
    x += 1
    return x
}

postfix func ++(x: inout Int) -> Int{
    defer {                             //defer 将代码块会被压入栈中，待函数结束时弹出栈运行。
        x += 1
    }
    return x
}

prefix func --(x: inout Int) -> Int{
    x -= 1
    return x
}

postfix func --(x: inout Int) -> Int{
    defer {
        x -= 1
    }
    return x
}

/*
 inout
 
 inout在写法上与C语言传递地址的写法十分类似，在调用函数传入参数是带有前缀&，就好像取地址传进去了一样，实则不然。
 
 Swift 中 struct 是值类型的。
 何为值，值是不能改变的，是immutable的，任何对值的修改其实就是新构造了一个来替换原来的。
 这里的inout也是如此，并不是传了地址进来，而是在这里构造了一个新的结构体，当函数结束时会复制回去替换原来的结构体。
 当然，这个复制并不一定会真的复制。Swift 的copy on write也会分情况，当值类型的引用只有一个时是不会复制的，这段在猫神的书里有提到。
 
 出处：http://ios.jobbole.com/92852/
 */

//MARK: - 数组元素移动位置
extension Array {
    public mutating func moveItem(from currentIndex: Int, to expectedIndex: Int) {
        self = currentIndex > expectedIndex ? moveUp(from: currentIndex, to: expectedIndex) : moveDown(from: currentIndex, to: expectedIndex)
    }
    
    private mutating func moveUp(from currentIndex: Int, to expectedIndex: Int) -> Array {
        guard 0...self.count ~= currentIndex else { return self }
        guard 0...self.count ~= expectedIndex else { return self }
        if currentIndex > expectedIndex {
            (self[currentIndex], self[currentIndex - 1]) = (self[currentIndex - 1], self[currentIndex])
            return self.moveUp(from: currentIndex - 1, to: expectedIndex)
        } else {
            return self
        }
    }
    
    private mutating func moveDown(from currentIndex: Int, to expectedIndex: Int) -> Array {
        guard 0...self.count ~= currentIndex else { return self }
        guard 0...self.count ~= expectedIndex else { return self }
        if currentIndex < expectedIndex {
            (self[currentIndex], self[currentIndex + 1]) = (self[currentIndex + 1], self[currentIndex])
            return self.moveDown(from: currentIndex + 1, to: expectedIndex)
        } else {
            return self
        }
    }
}
