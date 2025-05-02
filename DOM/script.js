// TARGETING NODES

const container = document.querySelector("#container");
const display = container.firstElementChild;

const controls = document.querySelector(".controls");
const display2 = controls.previousElementSibling;

// element.querySelector(selector) - returns a reference to the first match of 'selector'
// element.querySelectorAll(selectors) - returns a 'NodeList' containing references to all of the matches of the 'selectors'
// Can convert NodeList to an array with Array.from()





// ELEMENT CREATION - document.createElement(tagName, [options])

const div = document.createElement("div"); // Does not place into the DOM - only creates it in memory


// APPEND ELEMENTS TO THE DOM
// parentNode.appendChild(childNode) or parentNode.insertBefore(newNode, referenceNode)
container.appendChild(div);


// REMOVE ELEMENTS
// parentNode.removeChild(child) - returns reference to the child after removing it from the DOM


// ALTERING ELEMENTS

// Adding inline style
div.style.color = "blue";
div.style.cssText = "color: blue; background: white;"; // Add style rules in bulk
div.setAttribute("style", "color: blue; background: white"); // Another method

// dot notation with camelCase - bracket notation with kebab-case or camelCase. NO DOT NOTATION WITH KEBAB CASE
div.style.backgroundColor;
div.style["background-color"];
div.style["backgroundColor"];


// EDITING ATTRIBUTES

div.setAttribute("id", "theDiv");
div.getAttribute("id");
div.removeAttribute("id");


// ADDING TEXT CONTENT
div.textContent = "Hello World!"; // preferred over innerHTML to avoid security risks like JS injection

// ADDING HTML CONTENT
//div.innerHTML = "<span>Hello World!</span>";





// EXERCISE

const redPara = document.createElement("p");
redPara.setAttribute("style", "color: red;")
redPara.textContent = "Hey I'm red!";
container.appendChild(redPara);

const blueHeading = document.createElement("h3");
blueHeading.setAttribute("style", "color: blue;");
blueHeading.textContent = "I'm a blue h3!";
container.appendChild(blueHeading);

const borderDiv = document.createElement("div");
borderDiv.setAttribute("style", "border: 1px solid black; background-color: pink;")
container.appendChild(borderDiv);

const blackHeading = document.createElement("h1");
blackHeading.textContent = "I'm in a div";
borderDiv.appendChild(blackHeading);

const anotherP = document.createElement("p");
anotherP.textContent = "ME TOO!";
borderDiv.appendChild(anotherP);







// EVENTS

/**
 * Some events:
 * click
 * dblclick
 * keydown
 * keyup
 * https://www.w3schools.com/jsref/dom_obj_event.asp
 */

/**
 * Three ways to do events:
 * 
 * 1. Specify a function attribute on the HTML element
 * 2. Set properties of on<eventType> - for example, onclick or onmousedown - on the DOM nodes in JavaScript
 * 3. Attach event listeners to the DOM nodes in JavaScript (PREFERRED METHOD)
 */


// METHOD 1 - located in HTML file




// METHOD 2

const method2Button = document.querySelector("#method2");
method2Button.onclick = () => alert("Hello World from method 2!");

/**
 * Can also use with functions
 * ex.
 * 
 * function alertFunction() {
 *  alert("Message");
 * }
 * 
 * in JS: method2Button.onclick = alertFunction;
 */




// METHOD 3

const method3Button = document.querySelector("#method3");
method3Button.addEventListener("click", () => {
    alert("Hello World from method 3!");
});


/**
 * Can also use with functions
 * ex.
 * 
 * function alertFunction() {
 *  alert("Message");
 * }
 * 
 * in JS: method3Button.addEventListener("click", alertFunction);
 */






// Can view more info about an event
const more = document.querySelector("#more");
more.addEventListener("click", function (e) {
    console.log(e);
    console.log(e.target);
    e.target.style.background = "blue";
});



// Add event listeners to multiple nodes
const buttons = document.querySelectorAll("button");

buttons.forEach((button) => {
    button.addEventListener("click", () => {
        alert(button.id);
    })
})