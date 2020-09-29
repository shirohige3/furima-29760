function priceCalc(){
  let itemPrice = document.getElementById("item-price");
  let addTaxPrice = document.getElementById("add-tax-price");
  let profit = document.getElementById("profit");
  itemPrice.addEventListener("keyup",()=>{
    let priceValue = itemPrice.value;
    let taxPrice = Math.round(priceValue * 0.1)
    addTaxPrice.innerHTML = taxPrice
    let gainPrice = Math.round(priceValue - taxPrice)
    profit.innerHTML = gainPrice
   });
};
window.addEventListener("load",priceCalc);