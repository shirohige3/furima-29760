function priceCalc(){
  let itemPrice = document.getElementById("item-price");
  let addTaxPrice = document.getElementById("add-tax-price");
  let profit = document.getElementById("profit");
  itemPrice.addEventListener("change",()=>{
    let priceValue = itemPrice.value;
    let taxPrice = priceValue * 0.1
    addTaxPrice.innerHTML = taxPrice
    let gainPrice = priceValue * 1.1
    profit.innerHTML = gainPrice
   });
};
window.addEventListener("load",priceCalc);