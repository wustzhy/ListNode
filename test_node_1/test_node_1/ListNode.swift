//
//  ListNode.swift
//  test_node_1
//
//  Created by yestin on 2018/7/13.
//  Copyright © 2018年 yestin. All rights reserved.
//

import UIKit

class ListNode: NSObject  {
    var val: Int            // 数据域
    var next: ListNode?     // 指针域
    init(_ val:Int) {       // 构造函数
        self.val = val
        self.next = nil
    }
    
    func printForward() {
        
        var tmp_head:ListNode? = self
        while tmp_head != nil {
            print("->\(tmp_head!.val)")
            tmp_head = tmp_head?.next
        }
    }
    
    class func test1() {
        let nodes = List()
        nodes.appendNode(val: 1)
        nodes.appendNode(val: 2)
        nodes.appendNode(val: 3)
        nodes.appendNode(val: 4)
        nodes.appendNode(val: 5)
        nodes.insertToHeader(val: 0)
        
        // 测试 中间区间逆置
        print("reverseBetween:")
        Solution.reverseBetween(head: nodes.head!, m: 2, n: 4)?.printForward()
        
//        // 测试尾插 appendWithNode
//        let nodes2 = List()
//        nodes2.appendNode(val: 11)
//        nodes2.appendNode(val: 12)
//        nodes2.appendNode(val: 13)
//        print("nodes2")
//        nodes2.printList()
//        nodes2.appendWithNode(node: nodes.head!)
//        print("appendWithNode")
//        nodes2.printList()
        
        // 测试取子链区间
//        print("all:")
//        nodes.printList()
//        print("subto:")
//        Solution.subToIndex(head: nodes.head, index: 4)?.printList()
//        print("subfrom")
//        Solution.subFromIndex(head: nodes.head, index: 3)?.printList()
//        print("subWithRange:")
//        Solution.subWithRange(head: nodes.head, from: 2, to: 4)?.printList()
        
        
    }
    
    class func test2() {
        
        let nodes = List()
        nodes.printList()
        print("------------")
        
        nodes.appendNode(val: 1)
        nodes.appendNode(val: 2)
        nodes.appendNode(val: 3)
        nodes.printList()
        print("------------")
        
        nodes.insertToHeader(val: 0)
        nodes.printList()
        print("------------")
        
//        nodes.reverse().printList()
//        print("------------")
//
//        Solution.reverseList(head: nodes.head!).printList()
//        print("------------")
        print("new list after reverse")
        Solution.reverseList(head: nodes.head!).head?.printForward()
        print("original list:")
        nodes.head?.printForward()
        
        print("->>>>>>>>>>>>")
        print("new list after reverse2")
        Solution.reverseList2(head: nodes.head!)?.printForward()
        print("original list:")
        nodes.head?.printForward()
        print("original print:")
        nodes.printList()
    }
};

class List {
    var head: ListNode?
    var tail: ListNode?
    
    // -打印
    func printList() {
        print(self)
        
        if head == nil {
            print("null list")
        }
        
        var tmp_head = self.head
        while tmp_head != nil {
            print("->\(tmp_head!.val)")
            tmp_head = tmp_head?.next
        }
    }
    
    // - 尾插
    func appendNode(val: Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        }else {
            tail?.next = ListNode(val)
            tail = tail?.next
        }
    }
    
    // - 尾插
    func appendWithNode(node: ListNode) {
        if tail == nil {
            tail = node
            head = tail
        }else {
            tail?.next = node
            while tail?.next != nil {
                tail = tail?.next
            }
        }
    }
    
    // - 头插
    func insertToHeader(val:Int) {
        
        if tail == nil {
            head = ListNode(val)
            tail = head
        }else {
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
    
    // - 逆置1
    func reverse() -> List{
        
        let list = List()
        
        var head_tmp = self.head
        while head_tmp != nil {
            let head_new = ListNode(head_tmp!.val)
            head_new.next = list.head
            list.head = head_new
            head_tmp = head_tmp?.next
        }
        
        return list
    }
    
}

class Solution {
    // - 逆置2
    class func reverseList(head:ListNode) -> List{
        
        let list = List()
        var head_tmp:ListNode? = head
        
        while head_tmp != nil {
            let head_new = ListNode(head_tmp!.val)

            head_new.next = list.head
            list.head = head_new
            if(list.head?.next == nil) {
                list.tail = list.head
            }
            head_tmp = head_tmp?.next
        }
        return list
    }

    class func reverseList2(head:ListNode) -> ListNode?{
        
        var head_old:ListNode? = head
        var head_new:ListNode?
        
        while head_old != nil {
            
            let next = head_old!.next
            
            head_old?.next = head_new   //会导致head.next跟着变
            head_new = head_old
            head_old = next
        }
        
        return head_new
    }

    //MARK:- PART 2
    // 传入头节点，获取0-Index区间的链段，返回该连段的头节点
    class func subToIndex(head:ListNode?, index:Int) -> List?{
        
        let list:List = List()
        
        // m >= 1时
        var head_tmp:ListNode? = head
        var i:Int = 0
        while head_tmp != nil && i <= index {
            list.appendNode(val: head_tmp!.val)
            i = i + 1
            head_tmp = head_tmp!.next
        }
        
        return list
    }
    
    // 传入头节点，获取Index-count区间的链段，返回该连段的头节点
    class func subFromIndex(head:ListNode?, index:Int) -> List? {
        
        let list:List = List()
        
        var head_tmp:ListNode? = head
        var i:Int = 0
        while head_tmp != nil {
            
            if(i >= index) {
                list.appendNode(val: head_tmp!.val)
            }
            i = i + 1
            head_tmp = head_tmp!.next
        }
        
        return list
    }
    
    // 传入头节点，获取from-to区间的链段，返回该连段的头节点
    class func subWithRange(head:ListNode?, from:Int, to:Int) -> List? {
        
        let list:List = List()
        
        var head_tmp:ListNode? = head
        var i:Int = 0
        while head_tmp != nil && i <= to{
            
            if(i >= from) {
                list.appendNode(val: head_tmp!.val)
            }
            i = i + 1
            head_tmp = head_tmp!.next
        }
        
        return list
    }
    
    // 逆置 指定的区间 [m,n]
    class func reverseBetween(head:ListNode, m:Int, n:Int) -> ListNode?{
        
        let headList = Solution.subToIndex(head: head, index: m-1)
        let tailList = Solution.subFromIndex(head: head, index: n+1)
        
        let middleList = Solution.subWithRange(head: head, from: m, to: n)
        if headList != nil && tailList != nil && middleList == nil {
            return nil
        }
        let reversedMiddleList:List = Solution.reverseList(head: middleList!.head!)
        headList?.appendWithNode(node: reversedMiddleList.head!)
        headList?.appendWithNode(node: (tailList?.head)!)
        return headList?.head
        
//        // m >= 1时
//        var head_tmp:ListNode? = head
//        var i:Int = 0
//        while head_tmp != nil && i < m {
//            i = i + 1
//            head_tmp = head.next
//        }
//        let modify_head = head_tmp
//
//
//
//        while head_tmp != nil && i < n {
//            i = i + 1
//            head_tmp = head.next
//        }
//
//        //eg: 0 -> 1 -> 2 -> 3 -> 4
//
//        return nil
    }
}

