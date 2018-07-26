//
//  main.c
//  test_ListNode_C
//
//  Created by yestin on 2018/7/26.
//  Copyright © 2018年 MingTian. All rights reserved.
//

#include <stdio.h>
#include "ListNode.h"

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    List *list = malloc(sizeof(List));
    initLinkList(list);
    printList(list);
//    0->NULL  count:1
    
    createLinklist(list);
    printList(list);
//    0->10->9->8->7->6->5->4->3->2->1->NULL  count:11
    
    
    insert(list, 0, 12);
    printList(list);
//    12->0->10->9->8->7->6->5->4->3->2->1->NULL  count:12
    
    insert(list, 3, 109);
    printList(list);
//    12->0->10->109->9->8->7->6->5->4->3->2->1->NULL  count:13
    
    insert(list, 13, 1111);
//    local is invalid
    
    
    delete(list, 109);
    printList(list);
//    12->0->10->9->8->7->6->5->4->3->2->1->NULL  count:12
    
    delete(list, 12);
    printList(list);
//    0->10->9->8->7->6->5->4->3->2->1->NULL  count:11
    
    delete(list, 11);
//    not exist
    
    return 0;
}




