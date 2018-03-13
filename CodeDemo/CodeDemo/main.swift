//
//  main.swift
//  CodeDemo
//
//  Created by heguican on 2018/3/13.
//  Copyright © 2018年 heguican. All rights reserved.
//

import Foundation

var q = 5
print("\(q++) \(++q) \(q++)")

let array = [0,1,2,3,4,5,6,7,8,9]
var a = array
var b = array
var d = array
var c = array
a.moveItem(from: 1, to: 5)
b.moveItem(from: 3, to: 1)
c.moveItem(from: 1, to: 1)
d.moveItem(from: -1, to: 5)
print("\(a)")
print("\(b)")
print("\(c)")
print("\(d)")
