// Function to add a zero to a number if it is a flat number.
// Used for star ratings, to make it 4.0 instead of 4
export const addZero = (num) => {
  if (num % 1 === 0) {
    return `${num}` + `.0`;
  };
  return num;
};

// Adjust time for 24hrs
function checkPM(hour) {
  // If the time includes PM, add 12 hours
  if (hour.includes("PM")) {
    hour = hour.split(":").map(ele => parseInt(ele));

    // If the first digit is not 12 (noon), add 12
    if (hour[0] !== 12) {
      hour[0] += 12;
    };
  } else {
    hour = hour.split(":").map(ele => parseInt(ele));

    // If the first digit is 12 (midnight), set to 0
    if (hour[0] === 12) hour[0] = 0;
  };
  return hour;
};


// Get the hours array from store open/close, adjust for 24hrs
const parseHours = (time) => {
  // Split store hours into opening, closing
  let timeSplit = time.split(" - ");
  let openingHour = timeSplit[0];
  let closingHour = timeSplit[1];

  // Check for AM/PM and adjust time accordingly for 24h
  openingHour = checkPM(openingHour);
  closingHour = checkPM(closingHour);

  return [openingHour, closingHour];
};

// Set the current time into an array comparable to the time from store hours
function currentTimeArray() {
  const time = new Date();
  const [hours, minutes] = [time.getHours(), time.getMinutes()];
  return [hours, minutes];
};

// Convert 24hrs to 12hrs time
function getProperTime(time) {
  let [hours, mins] = [time[0], time[1]];
  let deno = "AM";

  if (hours === 12) deno = "PM";
  if (hours === 0) hours = 12;
  if (hours > 12) {
    deno = "PM"
    hours = hours - 12
  };

  if (mins === 0) mins = "00";
  return `${hours}:${mins}${deno}`
};

export const timeDifferencePrompt = (storeHours) => {
  // Get current time
  const currTime = currentTimeArray();
  
  // Deconstruct store hours into workable two pieces
  const [opening, closing] = parseHours(storeHours);

  // TIME TO OPENING CONDITIONS
  // If the current hour is earlier than opening hour
  if (currTime[0] < opening[0]) {
    return `Opens at: ${getProperTime(opening)}`;
  // OR if the current hour is greater than closing
  } else if (currTime[0] > closing[0]) {
    return `Opens at: ${getProperTime(opening)}`;
  // OR if the current hour is equal to opening, but the minutes are smaller
  } else if ((currTime[0] === opening[0]) && (currTime[1] < opening[1])) {
    return `Opens at: ${getProperTime(opening)}`;
  // OR if the current hour is equal to closing, but the minutes are greater
  } else if ((currTime[0] === closing[0] && (currTime[1] > closing[1]))) {
    return `Opens at ${getProperTime(opening)}`;
  };

  // TIME TO CLOSING CONDITIONS
  // If the current hour is greater than the opening hour, less than closing
  if ((currTime[0] > opening[0]) && (currTime[0] < closing[0])) {
    return `Open until: ${getProperTime(closing)}`;
  // OR if the current hour is the same as opening, but minutes are greater
  } else if ((currTime[0] === opening[0]) && (currTime[1] > opening[1])) {
    return `Open until: ${getProperTime(closing)}`;
  // OR if the current hour is the same as closing, but minutes are less
  } else if ((currTime[0] === closing[0]) && (currTime[1] < closing[1])) {
    return `Closing soon: ${getProperTime(closing)}`;
  };
};

// Helper to get price from a string "15.95", and a multiplier (quantity)
export const priceMultiple = (quantity, price) => {
  return parseFloat((quantity * parseFloat(price)).toFixed(2));
};

// Helper to load state from localStorage
export const loadState = () => {
  try {
    const serializedState = localStorage.getItem('state');
    if (serializedState === null) {
      return undefined;
    };
    return JSON.parse(serializedState);
  } catch (err) {
    return undefined;
  };
}; 

// Helper to save current state to localStorage
export const saveState = (state) => {
  try {
    const serializedState = JSON.stringify(state);
    localStorage.setItem('state', serializedState);
  } catch {
    // put errors here
  };
};