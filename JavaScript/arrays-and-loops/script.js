// Array methods: https://www.w3schools.com/js/js_array_methods.asp

// Create an array
const cars = ["Saab", "Volvo", "BMW"];

const cars1 = [];
cars1[0] = "Saab";
cars1[1] = "Volvo";
cars1[2] = "BMW";


// Accessing elements
let car = cars[0];


// Changing an array element
cars[0] = "Opel";


// Convert array to string
const fruits = ["Banana", "Orange", "Apple", "Mango"];
document.getElementById("demo").innerHTML = fruits.toString();


// Access full array
document.getElementById("demo").innerHTML = cars;


// Arrays are objects
const person = ["John", "Doe", 46];
// or
const person1 = {firstName: "John", lastName: "Doe", age:46};
document.getElementById("demo").innerHTML = person1.age;


// Array properties
let length = fruits.length; // LENGTH
let lastFruit = fruits[fruits.length -1]; // ACCESS LAST ELEMENT


// Looping arrays
for (let i = 0; i < length; i++)
{
    console.log(fruits[i]);
}

fruits.forEach(fruitLoop);

function fruitLoop(value) // value automatically takes the array values iterated by forEach
{
    console.log(value);
}


// Adding array elements
fruits.push("Lemon");
// or
fruits[fruits.length] = "Lemon 2";


// new Array()
const points = new Array(40, 100, 1, 5, 25, 10);
const doNotDoThis = new Array(40); // Creates an array with 40 undefined elements


// Testing for object vs. array
Array.isArray(fruits);



// Array methods

// at() - can use negative indexes
let thirdFruit = fruits.at(2);

// join() - toString(), but specify the separator instead of default comma
console.log(fruits.join(" * "));

// pop() - returns popped element
fruits.pop();

// push() - returns new array length
fruits.push("Lemon 3");

// shift() - removes the first array element and shifts all others to a lower index. Returns the "shifted out" value
fruits.shift();

// unshift() - adds a new element at the beginning and "unshifts" older elements
fruits.unshift("Lemon");

// delete() - DO NOT USE - leaves undefined holes
// delete fruits[0];

// concat() - does not change original arrays - returns new array. Can take any number of arguments, including strings
const girls = ["Cecilie", "Lone"];
const boys = ["Emil", "Tobias", "Linus"];
const children = girls.concat(boys);

// copyWithin() - overwrites existing values. does not add items to the array. does not change length of the array.
fruits.copyWithin(2, 0); // Copy element 0 to index 2
fruits.copyWithin(2, 0, 2); // Copy elements from 0-2 to index 2

// flat() - create new arraw with sub-array elements concatenated to a specified depth
const myArr = [[1,2],[3,4],[5,6]];
console.log(myArr);
const newArr = myArr.flat();
console.log(newArr);

// flatMap() - maps all elements of an array then creates a new array by flattening the array
const myArr2 = [1,2,3,4,5,6];
console.log(myArr2);
const newArr2 = myArr2.flatMap(x => [x, x*10]);
console.log(newArr2);

// splice() - add items to an array. Alters the orignal array
fruits.splice (2, 0, "Lemon", "Kiwi"); // 2: Position where new elements should be added (spliced in). 0: How many elements should be removed. Rest of the parameters are the elements to be added

// toSpliced() - doesn't alter the original array

// slice() - slice a piece of an array into a new array. Does not modify original array
const lessFruits = fruits.slice(1); // Slice starting at element 2





// Helper functions
function toUpper(string)
{
    return string.toUpperCase();
}

function lFruit(fruit)
{
    return fruit.startsWith("L"); // Bool
}


// LOOPS

// For
for (const fruit of fruits)
{
    console.log(fruit);
}

// Can put label before 'for' (ex. outer: for...) and use with break (ex. break outer) to break out of multiple levels of nested loops to the desired label

// Map() - Pass function, and map() calls the function once for each item in the array, and adds each return value from the function to a new array, then returns the new array
const upperFruits = fruits.map(toUpper);

// Filter() - Iterates through an array and applies the callback function, but only returns a value from the array IF the callback function returns true
const filteredFruits = fruits.filter(lFruit);

// Reduce() - Takes a callback function with two arguments - the 'accumulator': current value of the result at that point in the loop, and the 'current' value: the item currently being iterated on
// Also takes an initialValue - can be optionally set to change the first element in the array to be operated on
const arr = [1, 2, 3, 4, 5];
const productOfAllNums = arr.reduce((total, currentItem) => {
    return total * currentItem;
}, 1); // Initialize total to 1 at the beginning

i = 1;
// do-while
do {
    console.log("do-while!");
    i++;
} while (i < 2);
