let WORK_TIMES = ["09:00", "18:00"];
let CALENDAR_DATA_CELL = '[data-automation-id^="calendarDateCell"]';
let TIME_INPUTS = '[data-automation-id="standaloneTimeWidget"]';

// Exclude days that have multiple events to be safe
let EXCLUDED_CAL_DAY_REGEX =
  /saturday|sunday|holiday|Daily Total Hours|submitted|Approved|events/i;

let validDomNodes = [...document.querySelectorAll(CALENDAR_DATA_CELL)].filter(
  (node) => {
    return !node.ariaLabel.toLowerCase().match(EXCLUDED_CAL_DAY_REGEX);
  },
);

let bodyObserver = new MutationObserver(async (mutations) => {
  for (let mutation of mutations) {
    for (let node of mutation.addedNodes) {
      const isEnterTimeSheetDialog =
        node.dataset.automationWidget === "wd-popup" &&
        document.querySelector(TIME_INPUTS);

      if (isEnterTimeSheetDialog) {
        return fillTimeSheet(node);
      }
    }

    return;
  }
});

let hoursObserver = new MutationObserver((mutations) => {
  for (let mutation of mutations) {
    for (let node of mutation.addedNodes) {
      if (node.textContent === "9") {
        hoursObserver.disconnect();
        return document
          .querySelector(
            '[role="dialog"] [data-automation-button-type="PRIMARY"]',
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
    { childList: true },
  );

  await delay(1000);

  if (inputs) {
    for (let i = 0; i < inputs.length; i++) {
      let input = inputs[i];
      input.focus();
      input.value = WORK_TIMES[i];
      imitateKeyInput(input, WORK_TIMES[i]);
    }

    document.querySelector("textarea").focus();

    simulateMouseClick(
      node.querySelector(
        '[role="dialog"] [data-automation-button-type="PRIMARY"]',
      ),
    );
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
    }),
  );
}
function simulateMouseClick(node) {
  let box = node.getBoundingClientRect();
  let coordX = box.left + (box.right - box.left) / 2;
  let coordY = box.top + (box.bottom - box.top) / 2;
  simulateMouseEvent(node, "mousedown", coordX, coordY);
  simulateMouseEvent(node, "mouseup", coordX, coordY);
  simulateMouseEvent(node, "click", coordX, coordY);
}
function imitateKeyInput(el, keyChar) {
  if (el) {
    const keyboardEventInit = {
      bubbles: false,
      cancelable: false,
      composed: false,
      key: "",
      code: "",
      location: 0,
    };
    el.dispatchEvent(new KeyboardEvent("keydown", keyboardEventInit));
    el.value = keyChar;
    el.dispatchEvent(new KeyboardEvent("keyup", keyboardEventInit));
    el.dispatchEvent(new Event("change", { bubbles: true })); // usually not needed
  } else {
    console.log("el is null");
  }
}
function delay(time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

const highlightNode = (node) => (node.style.backgroundColor = "#FFC665");

for (let node of validDomNodes) {
  highlightNode(node);
}

bodyObserver.observe(document.body, { childList: true });
