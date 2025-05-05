// Create an empty object
let user = new Object(); // "object constructor" syntax
let user = {}; // "object literal" syntax

// Create object with values
let user = {
    name: "John",
    age: 30,
    isAdmin: true,
    "likes birds": true, // Multiword properties must be quoted
                        // Ending comma is optional
};


// Accessing object values
alert(user.name); // John
alert(user.age) // 30
alert(user["likes birds"]); // Must use brackets with multiwork properties
                            // Brackets can also be used for regular properties if desired - but without quotes (ex. user[age])


// Remove property
delete user.age;


// Computed properties
let fruit = prompt("Which fruit to buy?", "apple");

let bag = {
    [fruit]: 5, // This says - assign the key to be whatever the value of the prompt is (in this case, it has been forced to be "apple")
};

// Can also use more complex expressions
let fruit = 'apple';
let bag = {
    [fruit + 'computers']: 5,
};


// Property value shorthand
function makeUser(name, age) {
    return {
        name: name,
        age: age,
    };
}

let user = makeUser("John", 30);

// The above concept is very common, so there is a shorthand for it
function makeUser(name, age) {
    return {
        name,
        age,
    };
}


// Property names are automatically converted to strings
let obj = {
    0: "test",
};

alert(obj["0"]);
alert(obj[0]); // Both are equivalent and will work the same


// Property existence tests, "in" operator
let user = {};
alert (user.noSuchProperty === undefined); // True. Additionally, there are no errors for attempting to access a non-existant property
// alternatively...
//"key" in Object - always put key in quotes unless you're using a variable that contains the key as a string
let user = {name: "John", age: 30};
alert("age" in user); // true
alert("blabla" in user); // false


// For...in loop
for (key in object) {
    // stuff
}

let user = {
    name: "John",
    age: 30,
    isAdmin: true,
};

for (let key in user) {
    alert(key);
    alert(user[key]);
}


// Functions as values
const person = {
    name: ["Bob", "Smith"],
    age: 32,
    bio: = function() {
        console.log(`${this.name[0]} ${this.name[1]} is ${this.age} years old.`);
    },
    introduceSelf: function() {
        console.log(`Hi! I'm ${this.name[0]}.`);
    }
};

// Call functions as values
person.bio();
person.introduceSelf();



// Objects as values
const person = {
    name: {
        first: "Bob",
        last: "Smith",
    },
};

// Accessing objects as values
person.name.first;
person.name.last;
//or
person["name"]["first"];


// Constructors
// Manual method
function createPerson(name) {
    const obj = {};
    obj.name = name;
    obj.introduceSelf = function() {
        console.log(`Hi! I'm ${this.name}.`);
    };

    return obj;
}
// OR
// Proper constructor - removes need to create and return an object, and binds 'this' to the object immediately
function Person(name) {
    this.name = name;
    this.introduceSelf = function() {
        console.log(`Hi! I'm ${this.name}.`);
    };
}

// Usage
const frankie = new Person("Frankie");