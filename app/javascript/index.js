document.addEventListener("DOMContentLoaded", () => {
    document.getElementById("form")
            .addEventListener('ajax:success', (event) => {
        event.preventDefault();
        let data = event.detail[0];

        let tr, ind, first, second;

        tr = document.body.appendChild(document.createElement("tr"));

        ind = tr.appendChild(document.createElement("td"));
        ind.textContent = '1';

        first = tr.appendChild(document.createElement("td"));
        first.textContent = '2';

        second = tr.appendChild(document.createElement("td"));
        second.textContent = '3';
    });
});

