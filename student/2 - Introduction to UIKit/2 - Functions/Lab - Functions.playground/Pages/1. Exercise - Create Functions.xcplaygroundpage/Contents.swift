/*:
## Exercise - Create Functions

 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func introduceMyself(name : String) -> Void {
    print("Hi, I am \(name)")
}
introduceMyself(name: "Ashu")
//:  Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
import Foundation
func magicEigthBall() -> Void {
    let randomNum = Int.random(in: 0...4)
    if randomNum == 0 {
        print("The number is 0")
    }else if randomNum == 0 {
        print("The number is 1")
    }else if randomNum == 0 {
        print("The number is 2")
    }else if randomNum == 0 {
        print("The number is 3")
    }else {
        print("The number is 4")
    }
}
magicEigthBall()
magicEigthBall()
magicEigthBall()
/*:
page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
 */
