window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    tax_result = inputValue * 0.1
    addTaxDom.innerHTML = Math.floor(tax_result)

    const profit = document.getElementById("profit");
    profit_result = inputValue - tax_result
    profit.innerHTML = Math.floor(profit_result)
  })
});