document.getElementById("customer_id").addEventListener("input", async (event) => {
    const suggestion_div = document.getElementById("suggestions");
    if (event.target.value.length <= 2) {
        suggestion_div.classList.add("visually-hidden");
        return;
    }
    const search_customers_fetch = await fetch(`/orders/search_customers.json?search_value=${event.target.value}`);
    const response = await search_customers_fetch.json()

    const customer_length = response.customers.length;
    if (customer_length === 0) { return; }

    suggestion_div.innerHTML = ""
    suggestion_div.classList.remove("visually-hidden")
    for (let i = 0; i < response.customers.length; i++) {
        const new_item = document.createElement('a');
        new_item.setAttribute("class", "text-decoration-none text-light");
        new_item.href = `/orders/search_by_customer?customer_id=${response.customers[i].id}`;
        new_item.innerHTML = `${response.customers[i].name} ${response.customers[i].last_name}`
        suggestion_div.appendChild(new_item)
    }
});

document.getElementById("customer_id").addEventListener("focus", () => {
    const suggestion_div = document.getElementById("suggestions");
    suggestion_div.classList.remove("visually-hidden");
});