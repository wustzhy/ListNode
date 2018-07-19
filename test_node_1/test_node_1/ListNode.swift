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
        nodes.printList()
        print("------------")
        
        nodes.appendNode(val: 1)
        nodes.appendNode(val: 2)
        nodes.appendNode(val: 3)
        nodes.printList()
        print("------------")
        
        nodes.insertToHeader(val: 4)
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
}

