// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.

// Example 1:
// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

// Example 2:
// Input: nums = [3,2,4], target = 6
// Output: [1,2]

// Example 3:
// Input: nums = [3,3], target = 6
// Output: [0,1]

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    // A map to store the number (key) and its index (value)
    final Map<int, int> numMap = {};

    for (int i = 0; i < nums.length; i++) {
      int currentNum = nums[i];
      int complement = target - currentNum;

      // Check if the complement is already in the map
      if (numMap.containsKey(complement)) {
        // If found, return the index of the complement (from the map) and the current index (i)
        return [numMap[complement]!, i];
      }

      // If not found, add the current number and its index to the map
      numMap[currentNum] = i;
    }

    // As the problem guarantees exactly one solution, this line should technically not be reached.
    // We throw an exception or return an empty list if a solution must be returned even in an impossible case.
    throw Exception("No two sum solution");
  }
}
