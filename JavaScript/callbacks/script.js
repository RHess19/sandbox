// Normal functions

function funkyFunction(music, isWhiteBoy)
{
    if (isWhiteBoy)
    {
        console.log('Play: ' + msuic);
    }
}


// Anonymous function - not named, but are assigned to a variable
const funkyFunction = function(music, isWhiteBoy)
{
    if (isWhiteBoy)
    {
        console.log('Play: ' + music);
    }
}


// Arrow function
const funkyFunction = (music, isWhiteBoy) => {
    if (isWhiteBoy)
    {
        console.log('Play: ' + music);
    }
}

// If there is only one argument, the () can be omitted
const playThe = funky => {
    return funky + " music";
}

// If arrow functions are one line, the brackets can be omitted
//  When omitting the brackets, the arrow function returns the evaluated expressions without requiring the return keyword
const playThe = funky => funky + " music";



// Callbacks - functions passed into other functions as arguments

const notes = ['do', 're', 'me'];

notes.forEach((note) => console.log(note));


// Example of what forEach may look like under the hood
function myForEach(array, callback)
{
    for (let i = 0; i < array.length; i++)
    {
        callback(array[i]); // Pass the array to whatever callback funtion the user provided
    }
}

// You would call it like this
const myArray = [2, 3, 4, 2];
myForEach(myArray, (item) => {
    console.log(item + 2);
});

// More ways to call the callback function

// 1
myForEach(myArray, item => console.log(item + 2));

// 2
myForEach(myArray, function(item) {
    console.log(item + 2);
});

// 3
// Declaring the function that will be used as a callback in advance
function printItemPlusTwo(item) {
    console.log(item + 2);
}

myForEach(myArray, printItemPlusTwo);







// Another example - the .map method

function myMap(array, callback)
{
    const myNewArray = [];

    for (let i = 0; i < array.length; i++)
    {
        const callbackResult = callback(array[i]);
        myNewArray.push(callbackResult);
    }

    return myNewArray;
}


// 2 ways to call myMap

const addedArray = myMap([1, 2, 3], (arrayNum) => {
    return arrayNum + 2;
});

const addedArray = myMap([1, 2, 3], (arrayNum) => arrayNum + 2);



// Event listeners are examples of callbacks in use

const element = document.querySelector("#myId");
element.addEventListener('click', (event) => {
    console.log(event.target.value);
})

// or

function myEventHandler(event) {
    // do something
}

element.addEventListener('click', myEventHandler);