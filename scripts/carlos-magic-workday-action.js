let WORK_TIMES = ["09:00", "18:00"],
  CALENDAR_DATA_CELL = '[data-automation-id^="calendarDateCell"]',
  TIME_INPUTS = '[data-automation-id="standaloneTimeWidget"]',
  REGEX = /saturday|sunday|holiday|Daily Total Hours|submitted|approved/i,
  CURRENT_MONTH = document
    .querySelector('[data-automation-id="dateRangeTitle"]')
    .textContent.split(" ")[0]
    .toLowerCase(),
  nodes = [...document.querySelectorAll(CALENDAR_DATA_CELL)].filter(
    (e) =>
      !e.ariaLabel.toLowerCase().match(REGEX) &&
      e.ariaLabel.toLowerCase().includes(CURRENT_MONTH),
  );
const total_days = nodes.length;
let starting_node = (nodes.shift().style.backgroundColor = "#ffc665");

for (const e of nodes) e.style.backgroundColor = "#51e2f5";
console.log(`I'll fill timesheets for ${total_days} days.`),
  console.log(
    "Click on the highlighted day and wait for the magic to happen 🌈 ",
  );
const gifElement = document.createElement("img");
gifElement.setAttribute(
  "src",
  "https://c.tenor.com/M_96yZKqHnIAAAAC/tenor.gif",
),
  gifElement.setAttribute("alt", "Doge Wink"),
  (gifElement.style.position = "fixed"),
  (gifElement.style.bottom = "0"),
  (gifElement.style.left = "0"),
  (gifElement.style.zIndex = "9999"),
  document.body.appendChild(gifElement);
let bodyObserver = new MutationObserver(async (e) => {
  for (let t of e) {
    let e = [...t.addedNodes],
      o = [...t.removedNodes];
    for (let t of e) {
      if (0 === t.childNodes.length) return;
      if (t.querySelector('[data-automation-id="toastContainer"]')) {
        console.log("Date correctly saved!");
        const e = nodes.shift();
        return void (await simulateCompleteMouseClick(
          `[aria-label*="${e.ariaLabel}"]`,
        ));
      }
      if (
        t.querySelector('[data-automation-widget="wd-popup"]') &&
        t.querySelector(TIME_INPUTS)
      )
        return console.log("Filling time sheet"), fillTimeSheet(t);
    }
    for (let e of o) if (0 === nodes.length) return bodyObserver.disconnect();
  }
});
bodyObserver.observe(document.body, { childList: !0 });
let hoursObserver = new MutationObserver((e) => {
  for (let t of e) {
    let e = [...t.addedNodes];
    for (let t of e)
      if ("9" === t.textContent)
        return (
          hoursObserver.disconnect(),
          document
            .querySelector(
              '[role="dialog"] [data-automation-button-type="PRIMARY"]',
            )
            .click()
        );
  }
});
async function fillTimeSheet(e) {
  let t = e.querySelectorAll('[role="dialog"] input[type="text"]');
  if (
    (hoursObserver.observe(
      e.querySelector('[role="dialog"] [data-automation-id="numericText"]'),
      { childList: !0 },
    ),
    t)
  ) {
    for (let e = 0; e < t.length; e++) {
      let o = t[e];
      o.focus(), (o.value = WORK_TIMES[e]);
    }
    document.querySelector("textarea").focus();
  }
}
function simulateMouseEvent(e, t, o, n) {
  const i = new MouseEvent(t, {
    view: window,
    bubbles: !0,
    cancelable: !0,
    clientX: o,
    clientY: n,
    button: 0,
  });
  e.dispatchEvent(i);
}
function simulatePointerEvent(e, t, o, n) {
  const i = new PointerEvent(t, {
    view: window,
    bubbles: !0,
    cancelable: !0,
    clientX: o,
    clientY: n,
    pointerId: 1,
    pointerType: "mouse",
    isPrimary: !0,
    button: 0,
  });
  e.dispatchEvent(i);
}
function waitFor(e) {
  return new Promise((t) => setTimeout(t, e));
}
async function simulateCompleteMouseClick(e) {
  await waitFor(150);
  const t = document.querySelector(e);
  console.log(`Clicking time sheet for ${t.ariaLabel}`);
  let o = t.getBoundingClientRect(),
    n = o.left + (o.right - o.left) / 2,
    i = o.top + (o.bottom - o.top) / 2;
  await waitFor(150),
    simulateMouseEvent(t, "mousedown", n, i),
    await waitFor(150),
    simulateMouseEvent(t, "mouseup", n, i),
    await waitFor(150),
    simulateMouseEvent(t, "click", n, i),
    "function" == typeof t.blur && t.blur();
}
