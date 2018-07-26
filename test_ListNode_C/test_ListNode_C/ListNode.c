//
//  ListNode.c
//  test_ListNode_C
//
//  Created by yestin on 2018/7/26.
//  Copyright © 2018年 MingTian. All rights reserved.
//

#include "ListNode.h"


/************************************************
 *功能：初始化链表，分配头结点，结点个数为0
 *参数：链表指针
 ************************************************/
void initLinkList(List *list)
{
    list->head = malloc(sizeof(Node));
    list->head->next = NULL;
    list->count = 1;
}

/************************************************
 *功能：逆序建立链表，从头结点后插入
 *参数：链表指针
 ************************************************/
void createLinklist(List *list)
{
    int a[10] = {1,2,3,4,5,6,7,8,9,10};
    unsigned int count = sizeof(a)/sizeof(a[0]);
    Node *p;
    for (int i = 0; i < count; i++) {
        p = malloc(sizeof(Node));
        p->data = a[i];
        p->next = list->head->next;
        list->head->next = p;
        list->count ++;
    }

}

/************************************************
 *功能：打印链表中的值
 *参数：链表指针
 ************************************************/
void printList(List *list)
{
    Node *p = list->head;
    
    while (p != NULL) {
        printf("%d->",p->data);
        p = p->next;
    }
    printf("NULL  count:%d",list->count);
    putchar('\n');
}

/************************************************
 *功能：查找链表中指定值的位置，有的返还其位置，无，返还-1
 *参数：链表指针，要查找的值
 ************************************************/
int search(List *list, int obj)
{
    Node *p;
    p = list->head;
    
    int index = 0;
    while (p != NULL) {
        
        if (p->data == obj) {
            return index;
        }
        p = p->next;
        index ++;
    }
    
    return -1;//不存在
}

/************************************************
 *功能：删除链表中的值
 *参数：链表指针，要删除的值
 ************************************************/
void delete(List *list, int obj)
{
    int flag = search(list, obj);
    if (flag == -1) {
        printf("not exist \n");
        return;
    }
    
    if (flag == 0) { // 删的是 头结点
        list->head = list->head->next;
        list->count--;
        return;
    }
    
    Node *p = list->head;
    Node *q = list->head->next;
    
    while (q != NULL) {
        if (q->data == obj) {
            p->next = q->next;
            q->next = NULL;
            free(q);
            list->count--;
            break;
        }
        p = q;
        q = q->next;
    }
    
}

/************************************************
 *功能：往指定的位置后插入相应的值
 *参数：链表指针，插入的位置，插入的值

 index: 0, 1, 2, 3, 4
 insert: local:1 number:10
         ↓
 data:  0->1->2->3->4
 result:0->10->1->2->3->4
 ************************************************/
void insert(List *list, unsigned int local, int number)
{

    if (local >= list->count) {
        printf("local is invalid\n");
        return;
    }
    
    Node *n = (Node *)malloc(sizeof(Node));
    n->data = number;
    n->next = NULL;
    
    if (local == 0) {
        n->next = list->head;
        list->head = n;
        list->count ++;
        return;
    }
    
    int count = 1;
    Node *p = list->head;
    while (count < local) {
        p = p->next;
        count++;
    }
    
    n->next = p->next;
    p->next = n;
    list->count ++;
}
























