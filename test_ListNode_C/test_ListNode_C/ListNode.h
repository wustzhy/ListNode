//
//  ListNode.h
//  test_ListNode_C
//
//  Created by yestin on 2018/7/26.
//  Copyright © 2018年 MingTian. All rights reserved.
//  
//https://yq.aliyun.com/articles/27040?spm=5176.10695662.1996646101.searchclickresult.157cb7d60MW6Uk

#ifndef ListNode_h
#define ListNode_h

#include <stdio.h>
#include <stdlib.h>

//定义链表中的节点
typedef struct node{
    int data;
    struct node *next;
}Node;

//定义链表结构
typedef struct {
    Node *head;
    unsigned int count;
}List;

/************************************************
 *功能：打印链表中的值
 *参数：链表指针
 *作者：Mr.li
 *日期：14-07-23
 ************************************************/
void printList(List *list);

/************************************************
 *功能：初始化链表，分配头结点，结点个数为0
 *参数：链表指针
 ************************************************/
void initLinkList(List *list);

/************************************************
 *功能：逆序建立链表，从头结点后插入
 *参数：链表指针
 ************************************************/
void createLinklist(List *list);

/************************************************
 *功能：查找链表中指定值的位置，有的返还其位置，无，返还-1
 *参数：链表指针，要查找的值
 ************************************************/
int search(List *list, int obj);

/************************************************
 *功能：删除链表中的值
 *参数：链表指针，要删除的值
 ************************************************/
void delete(List *list, int obj);

/************************************************
 *功能：往指定的位置后插入相应的值
 *参数：链表指针，插入的位置，插入的值
 
 index: 0, 1, 2, 3, 4
 insert: local:1 number:10
 ↓
 data:  0->1->2->3->4
 result:0->10->1->2->3->4
 ************************************************/
void insert(List *list, unsigned int local, int number);



#endif /* ListNode_h */
