let WORK_TIMES = ["09:00", "18:00"];
let CALENDAR_DATA_CELL = '[data-automation-id^="calendarDateCell"]';
let TIME_INPUTS = '[data-automation-id="standaloneTimeWidget"]';
let REGEX = /saturday|sunday|holiday|Daily Total Hours|submitted|approved/i;
let nodes = [...document.querySelectorAll(CALENDAR_DATA_CELL)].filter(
  (node) => {
    return !node.ariaLabel.toLowerCase().match(REGEX);
  }
);
let starting_node = (nodes.shift().style.backgroundColor = "#FFC665");
let bodyObserver = new MutationObserver(async (mutations) => {
  for (let mutation of mutations) {
    let addedNodes = [...mutation.addedNodes];
    let removedNodes = [...mutation.removedNodes];
    for (let node of addedNodes) {
      if (node.querySelector('[data-automation-id="toastContainer"]')) {
        console.log("toast");
      }
      if (
        node.dataset.automationWidget === "wd-popup" &&
        node.querySelector(TIME_INPUTS)
      ) {
        return fillTimeSheet(node);
      }
    }
    for (let node of removedNodes) {
      if (nodes.length === 0) {
        bodyObserver.disconnect();
        //return alert('Finish!!!');
      }
      return simulateMouseClick(nodes.shift());
    }
  }
});
bodyObserver.observe(document.body, { childList: true });
let hoursObserver = new MutationObserver((mutations) => {
  for (let mutation of mutations) {
    let addedNodes = [...mutation.addedNodes];
    for (let node of addedNodes) {
      if (node.textContent === "9") {
        // we can click ok
        hoursObserver.disconnect();
        return document
          .querySelector(
            '[role="dialog"] [data-automation-button-type="PRIMARY"]'
          )
          .click();
      }
    }
  }
});
async function fillTimeSheet(node) {
  let inputs = node.querySelectorAll('[role="dialog"] input[type="text"]');
  hoursObserver.observe(
    node.querySelector('[role="dialog"] [data-automation-id="numericText"]'),
    { childList: true }
  );
  //await delay(1000);
  if (inputs) {
    for (let i = 0; i < inputs.length; i++) {
      let input = inputs[i];
      input.focus();
      input.value = WORK_TIMES[i];
      //imitateKeyInput(input, WORK_TIMES[i]);
    }
    document.querySelector("textarea").focus();
    //simulateMouseClick(node.querySelector('[role="dialog"] [data-automation-button-type="PRIMARY"]'))
  }
}
function simulateMouseEvent(element, eventName, coordX, coordY) {
  element.dispatchEvent(
    new MouseEvent(eventName, {
      view: window,
      bubbles: true,
      cancelable: true,
      clientX: coordX,
      clientY: coordY,
      button: 0,
    })
  );
}
function simulateMouseClick(node) {
  let box = node.getBoundingClientRect();
  let coordX = box.left + (box.right - box.left) / 2;
  let coordY = box.top + (box.bottom - box.top) / 2;
  simulateMouseEvent(node, "mousedown", coordX, coordY);
  simulateMouseEvent(node, "mouseup", coordX, coordY);
  // simulateMouseEvent(node, "click", coordX, coordY);
}
// function imitateKeyInput(el, keyChar) {
//   if (el) {
//     const keyboardEventInit = {bubbles:false, cancelable:false, composed:false, key:'', code:'', location:0};
//     el.dispatchEvent(new KeyboardEvent("keydown", keyboardEventInit));
//     el.value = keyChar;
//     el.dispatchEvent(new KeyboardEvent("keyup", keyboardEventInit));
//     el.dispatchEvent(new Event('change', {bubbles: true})); // usually not needed
//   } else {
//     console.log("el is null");
//   }
// }
// function delay(time) {
//   return new Promise(resolve => setTimeout(resolve, time));
// }
