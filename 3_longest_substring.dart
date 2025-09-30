// Given a string s, find the length of the longest substring without duplicate characters.

// Example 1:
// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.

import 'dart:math';

class Solution {
  int lengthOfLongestSubstring(String s) {
    if (s.isEmpty) {
      return 0;
    }

    // 1. Initialize variables
    // 'seen' map stores the character (key) and its index (value)
    final Map<String, int> seen = {};

    // 'maxLength' tracks the longest substring found so far
    int maxLength = 0;

    // 'start' is the left boundary of the sliding window
    int start = 0;

    // 2. Iterate through the string using 'end' as the right boundary
    for (int end = 0; end < s.length; end++) {
      String char = s[end];

      // 3. Check for a duplicate
      // If the current character 'char' is already in the 'seen' map,
      // AND its last seen index is *within* the current window (start <= seen[char]!),
      // we must move the start of the window past the duplicate's last position.
      if (seen.containsKey(char) && start <= seen[char]!) {
        // Move 'start' to the position right after the last occurrence of 'char'
        start = seen[char]! + 1;
      }

      // 4. Update the character's index
      // Always update the map with the current character's index.
      seen[char] = end;

      // 5. Update max length
      // The current substring length is (end - start + 1).
      // Compare it with the overall 'maxLength'.
      maxLength = max(maxLength, end - start + 1);
    }

    return maxLength;
  }
}
