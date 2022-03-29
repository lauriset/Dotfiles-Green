'use strict';

/**
 * Calls the dog api to randomly get an image
 */
function getDogImage(inputValue) {
  let requiredUrl = `https://dog.ceo/api/breeds/image/random/${1}`;

  fetch(requiredUrl)
    .then(response => response.json())
    .then(responseJson => displayResults(responseJson))
    .catch(error => alert('Something went wrong. Try again later.'));
    
}

/**
 * Displays the image within a div
 */
function displayResults(responseJson) {
  console.log(responseJson);
  let arrayOfImg = responseJson.message;
  let display = getImages(arrayOfImg); 

  //replace the existing image with the new one
  
  $('.results-img').html(display);
  
}

/**
 * Prepares a string of <img> elements
 * and returns the same
 */
function getImages(arrayOfImg){
    let valueToReturn = ''; 
    for (let i = 0; i < arrayOfImg.length; i++){
      valueToReturn += `<img src="${arrayOfImg[i]}" class="results-img">`;
    } 
    return valueToReturn;
}

function watchForm() {
    event.preventDefault();
    let inputValue = $('.quantity').val();
    getDogImage(inputValue); 
}

$(function() {
  console.log('App loaded! Waiting for submit!');
  watchForm();
});

/**   
* Runs the watchForm function and hides/shows the firefox logo
* and dog image when the dog button is pressed
*/ 
/*#TODO change button to hover*/
$(document).ready(function() {
    $("button").click(function() {
      $("#imagediv").toggleClass("active");
      var x = document.getElementById("dogcontainer");
  if (x.style.display === "none") {
    x.style.display = "block";
  } 
  else {
    x.style.display = "none";
    event.preventDefault();
    let inputValue = $('.quantity').val();
    getDogImage(inputValue);
  }

  var x = document.getElementById("imagediv");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
    });
  });