document.addEventListener('DOMContentLoaded', function() {
    //var instances =
    M.Modal.init(document.querySelectorAll('.modal'), {
        opacity: 0.6,
        inDuration: 200,
        outDuration: 200
    });


    // db.jsp
    const createButton = document.getElementById("db-create-button");
    if(createButton) createButton.addEventListener('click', createButtonClick);
    const insertButton = document.getElementById("db-insert-button");
    if(insertButton) insertButton.addEventListener('click', insertButtonClick);
    const readButton = document.getElementById("db-read-button");
    if(readButton) readButton.addEventListener('click', readButtonClick);
});

function createButtonClick() {
    fetch(window.location.href, {
        method: 'PUT'
    }).then(r => r.json()).then(j => {
        console.log(j);
    })
}
function insertButtonClick() {
    const nameInput = document.querySelector('[name="user-name"]');
    if(! nameInput) throw '[name="user-name"] not found';
    const phoneInput = document.querySelector('[name="user-phone"]');
    if(! phoneInput) throw '[name="user-phone"] not found';
    fetch(window.location.href, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({name: nameInput.value, phone: phoneInput.value})
    }).then(r => r.json()).then(j => {
        console.log(j);
    });
}
function readButtonClick() {
    fetch(window.location.href, {
        method: "COPY",
        headers: {
            'Content-Type': 'application/json' // Set the content type to JSON
        }
    }).then(r => r.json()).then(data => {
        console.log(data);

        const table = document.getElementById("callMeTable");
        table.querySelector('tbody').innerHTML = '';
        data.forEach(call => {
            const row = table.querySelector('tbody').insertRow();
            row.insertCell(0).textContent = call.id;
            row.insertCell(1).textContent = call.name;
            row.insertCell(2).textContent = call.phone;
        });
        table.style.display = 'table';
    });
}