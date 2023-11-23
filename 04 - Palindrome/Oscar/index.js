const checkForPalindrome = (str) => {
  if (str.length === 0) {
    console.error("Please enter a string");

    return { statement: false, originalString: str };
  }

  const formattedString = str.toUpperCase().replace(/\s/g, "");
  const reversed = formattedString.split("").reverse().join("");

  return { statement: formattedString === reversed, originalString: str };
};

// Should be true
console.log(checkForPalindrome("Ola Salo"));

// Should be false
console.log(checkForPalindrome("Magnus Uggla"));

// Should be true
console.log(checkForPalindrome("Ni talar bra latin"));

// Should be false
console.log(checkForPalindrome(""));
