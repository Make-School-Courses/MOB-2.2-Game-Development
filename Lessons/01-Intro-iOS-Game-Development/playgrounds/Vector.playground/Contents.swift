import UIKit

/* Calculating vector length: using CGPoint */
let vector = CGPoint(x: 5, y: 7)
let length = sqrt(vector.x * vector.x + vector.y * vector.y)

print(length) // 8.602325267042627


/* Calculating vector length: using CGVector & extending it to add a length property  */

CGVector

