// You are given two non-empty linked lists representing two non-negative integers.
// The digits are stored in reverse order, and each of their nodes contains a single digit.
// Add the two numbers and return the sum as a linked list.

// You may assume the two numbers do not contain any leading zero, except the number 0 itself.

// Example 2:
// Input: l1 = [0], l2 = [0]
// Output: [0]

// Example 3:
// Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
// Output: [8,9,9,9,0,0,0,1]

// Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    // 1. Initialize a dummy head node. This simplifies handling the resulting list's head.
    ListNode dummyHead = ListNode(0);
    ListNode? current = dummyHead;

    // 2. Initialize the carry.
    int carry = 0;

    // 3. Loop while there are still digits in l1 or l2, or if there's a remaining carry.
    while (l1 != null || l2 != null || carry != 0) {
      // Get the values, treating null nodes as 0.
      int x = l1?.val ?? 0;
      int y = l2?.val ?? 0;

      // Calculate the sum and new carry.
      int sum = x + y + carry;
      carry = sum ~/ 10; // Integer division gives the carry (e.g., 17 / 10 = 1)
      int digit =
          sum %
          10; // Modulo gives the digit for the current node (e.g., 17 % 10 = 7)

      // Create a new node with the calculated digit and append it to the result list.
      current?.next = ListNode(digit);

      // Move pointers forward.
      current = current?.next;
      l1 = l1?.next;
      l2 = l2?.next;
    }

    // The result list starts from the node *after* the dummy head.
    return dummyHead.next;
  }
}
