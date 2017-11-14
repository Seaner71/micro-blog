var calcChars = function (element) {
   var maxlength = element.getAttribute("maxlength");
   var chars = element.value.length;
   var remaining = maxlength - chars;
 document.querySelector(".postcount").innerHTML = remaining;
};
