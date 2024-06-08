const myModal = new bootstrap.Modal('#searchCustomer', {});

const customer_search = async (search_value) => {
    const response = await fetch(`/orders/search_customers.json?search_value=${search_value}`);
    return await response.json();
};

const customer_info = async (customer_id) => {
    const response = await fetch(`/orders/customer_info/${customer_id}.json`);
    return await response.json();
}

const fill_customer = (value_search) => {
    customer_info(value_search).then(response => {
        document.getElementById("customerFullName").value = response.customer_info.name + " " + response.customer_info.last_name;
        document.getElementById("customerMail").value = response.customer_info.mail;
        document.getElementById("customerPhone").value = response.customer_info.phone;
        document.getElementById("customerAddress").value = response.customer_info.address;
        document.getElementById("order_customer_id").value = response.customer_info.id;
        myModal.hide();
    });
};

const item_info = async (item_id, item_name) => {
    let url = `/orders/size_info/${item_id}.json`
    if (item_name === "product") {
        let url = `/orders/product_info/${item_id}.json`
    }
    const response = await fetch(url);
    return await response.json();
};

const fill_item = (data, father_element) => {
    if (data.item_info === null) {
        clean_item_fields(father_element)
        return;
    }
    father_element.getElementsByClassName("item_quantity")[0].value = 1;
    father_element.getElementsByClassName("item_id")[0].value = data.item_info.id;
    father_element.getElementsByClassName("item_quantity")[0].disabled = false;
    father_element.getElementsByClassName("item_price")[0].value = data.item_info.price || '';
    update_item_total(father_element);
};

const clean_item_fields = (father_element) => {
    father_element.getElementsByClassName("item_quantity")[0].value = "";
    father_element.getElementsByClassName("item_price")[0].value = "";
    father_element.getElementsByClassName("item_subtotal")[0].value = "";
    father_element.getElementsByClassName("item_quantity")[0].disabled = true;
};

const update_item_total = (father_element) => {
    const quantity = parseFloat(father_element.getElementsByClassName("item_quantity")[0].value);
    const price = parseFloat(father_element.getElementsByClassName("item_price")[0].value);
    father_element.getElementsByClassName("item_subtotal")[0].value = (quantity * price).toFixed(2);
};

const add_new_item = (item_name) => {
    const list_items = document.getElementsByClassName(item_name + "_item");
    const last_item = list_items[list_items.length - 1]
    let new_item = last_item.cloneNode(true);

    let id_number = last_item.id.replace(item_name, "");
    let new_id;
    if (id_number.includes("_")) {
        new_id = parseInt(id_number.split("_")[id_number.split("_").length - 1]) + 1;
        new_item.setAttribute("id", item_name + "_" + new_id);
        new_item.getElementsByClassName("delete_" + item_name + "1")[0].setAttribute("onClick", `delete_item('${item_name}_${new_id}', '${item_name}')`);
    } else {
        new_id = parseInt(id_number) + 1;
        new_item.setAttribute("id", item_name + new_id);
        new_item.getElementsByClassName("delete_" + item_name)[0].setAttribute("onClick", `delete_item('${item_name + new_id}', '${item_name}')`);
    }

    clean_item_fields(new_item);
    document.getElementById(item_name + "_container").appendChild(new_item);

    add_events_items(new_item, item_name);
    if (item_name === "pizza") {
        const pizza_id = "pizza" + new_id + "_1";
        const border_id = "pizza_border" + new_id + "_1";
        const flavor_id = "pizza_flavor" + new_id + "_1";

        new_item.getElementsByClassName("delete_" + item_name)[0].setAttribute("onClick", `delete_pizza_size(['${pizza_id}', '${border_id}', '${flavor_id}'])`);
        add_new_pizza_border(item_name, new_id);
        add_new_pizza_flavor(item_name, new_id);
    }
}

const add_new_pizza_border = (pizza_container, id_contianer) => {
    const last_item = document.getElementsByClassName("pizza_border_item")[0];
    let new_item = last_item.cloneNode(true);
    new_item.setAttribute("id", "pizza_border" + id_contianer + "_1");

    clean_item_fields(new_item);
    document.getElementById(pizza_container + "_container").appendChild(new_item);
    add_events_items(new_item, "pizza_border_item");
};

const add_new_pizza_flavor = (pizza_container, id_contianer) => {
    const last_item = document.getElementsByClassName("pizza_flavor_item")[0];
    let new_item = last_item.cloneNode(true);
    new_item.setAttribute("id", "pizza_flavor1" + id_contianer + "_1");

    clean_item_fields(new_item);
    document.getElementById(pizza_container + "_container").appendChild(new_item);
    add_events_items(new_item, "pizza_flavor_item");
};

const delete_item = (item_id, item_type) => {
    if (document.getElementsByClassName(item_type + "_item").length > 1) {
        document.getElementById(item_id).remove();
    }
};

const delete_pizza_size = (array_item_id) => {
    if (document.getElementsByClassName("pizza_item").length > 1) {
        for(let item_id of array_item_id) {
            document.getElementById(item_id).remove();
        }
    }
};

const add_events_items = (element, item_name) => {
    element.getElementsByClassName("item_select")[0].addEventListener("change", (event) => {
        item_info(event.target.value, item_name).then(response => {
            fill_item(response, element);
        });
    });

    element.getElementsByClassName("item_quantity")[0].addEventListener("change", () => {
        update_item_total(element);
    });
};

const defautl_customer_table = () => {
    change_tbody("customer_table", default_tbody_customer);
};

const change_tbody = (table_name, new_tbody) => {
    const table = document.getElementById(table_name);
    const old_tbody = table.getElementsByTagName('tbody')[0];
    old_tbody.parentNode.replaceChild(new_tbody, old_tbody);
}

add_events_items(document.getElementById("pizza1"), "pizza");
add_events_items(document.getElementById("product1"), "product");
add_events_items(document.getElementById("pizza_flavor1_1"), "pizza_flavor");
add_events_items(document.getElementById("pizza_border1_1"), "pizza_border");

const default_tbody_customer = document.getElementById("customer_table").getElementsByTagName('tbody')[0];

document.getElementById("customerSearch").addEventListener("input", (event) => {
    if (event.target.value.length === 0) {
        defautl_customer_table();
        return;
    }
    if (event.target.value.length >= 3) {
        customer_search(event.target.value).then(response => {
            if(response.customers.length === 0) {
                document.getElementById("message-customer").classList.remove("d-none");
                return;
            }
            
            document.getElementById("message-customer").classList.add("d-none");
            const new_tbody = document.createElement('tbody');
            let tbody_content = '';

            for (let i = 0; i < response.customers.length ; i++) {
                tbody_content += `<td>${response.customers[i].name}</td>`
                tbody_content += `<td>${response.customers[i].last_name}</td>`
                tbody_content += `<td>${response.customers[i].phone}</td>`
                tbody_content += `<td>${response.customers[i].mail}</td>`

                new_tbody.innerHTML += `<tr role="button" onclick="fill_customer('${response.customers[i].id}')"> ${tbody_content} </tr>`;
            }

            change_tbody("customer_table", new_tbody);
        });
    }
});