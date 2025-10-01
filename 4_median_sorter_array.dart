// Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

// The overall run time complexity should be O(log (m+n)).

// Example 1:
// Input: nums1 = [1,3], nums2 = [2]
// Output: 2.00000
// Explanation: merged array = [1,2,3] and median is 2.

// Example 2:
// Input: nums1 = [1,2], nums2 = [3,4]
// Output: 2.50000
// Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

import 'dart:math';

double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  // Ensure nums1 is the smaller array for O(log(min(m, n))) complexity
  if (nums1.length > nums2.length) {
    return findMedianSortedArrays(nums2, nums1);
  }

  int m = nums1.length;
  int n = nums2.length;
  int halfLen = (m + n + 1) ~/ 2; // Required length of the left partition

  // Binary search for the optimal cut position (i) in nums1
  int low = 0;
  int high = m;

  while (low <= high) {
    // Cut 1: The number of elements taken from nums1 (i)
    int i = (low + high) ~/ 2;

    // Cut 2: The number of elements taken from nums2 (j)
    // j is fixed by i and the required halfLen
    int j = halfLen - i;

    // Define the 4 boundary elements for the partition: L1, R1, L2, R2
    // Use a minimum or maximum sentinel value for boundary conditions
    // If i=0, L1 is effectively -Infinity; if i=m, R1 is effectively +Infinity
    int l1 = (i == 0) ? -2000000000 : nums1[i - 1]; // L1 = nums1[i-1]
    int r1 = (i == m) ? 2000000000 : nums1[i]; // R1 = nums1[i]
    int l2 = (j == 0) ? -2000000000 : nums2[j - 1]; // L2 = nums2[j-1]
    int r2 = (j == n) ? 2000000000 : nums2[j]; // R2 = nums2[j]

    // Check if the partition is valid: max(L1, L2) <= min(R1, R2)
    if (l1 <= r2 && l2 <= r1) {
      // 2. Found the correct partition

      // Calculate the median
      if ((m + n) % 2 == 1) {
        // Odd total length: Median is the largest element of the left partition
        return max(l1, l2).toDouble();
      } else {
        // Even total length: Median is the average of the largest element of the left
        // partition and the smallest element of the right partition.
        return (max(l1, l2) + min(r1, r2)) / 2.0;
      }
    } else if (l1 > r2) {
      // 3. Partition is too far right in nums1 (L1 is too big)
      // Need to move cut 1 to the left (i--)
      high = i - 1;
    } else {
      // l2 > r1
      // 4. Partition is too far left in nums1 (R1 is too small)
      // Need to move cut 1 to the right (i++)
      low = i + 1;
    }
  }

  // This should theoretically not be reached if inputs are valid sorted arrays.
  return 0.0;
}
