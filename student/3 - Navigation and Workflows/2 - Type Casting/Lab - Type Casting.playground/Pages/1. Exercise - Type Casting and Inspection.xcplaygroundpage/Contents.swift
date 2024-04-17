/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var arr : [Any] = [1,2,3.0, "Ashu", true]

//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for i in arr {
    if let i = i as? Int{
        print("The integer has a value of \(i)")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var dic : [String : Any] = ["1" : 1, "2" : 2.0, "3" : "3", "4" : true]
for (key, value) in dic{
    print(value)
}
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total : Double = 0
for (_, value) in dic{
    if let v = value as? Int {
        total += Double(v)
    }
    else if let v = value as? Double{
        total += Double(v)
    }
}
print("Total : \(total)")
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2 : Double = 0
for (_, value) in dic{
    if let v = value as? Int {
        total2 += Double(v)
    }
    else if let v = value as? Double{
        total2 += Double(v)
    }
    else if let v = value as? String{
        if let v = Double(v){
            total2 += v
        }
    }
}

print("Total2 : \(total2)")
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
