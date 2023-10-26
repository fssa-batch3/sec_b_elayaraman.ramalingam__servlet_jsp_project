<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Find your ticket</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="GuestNavbar.jsp" />
	<div class="container" style="margin-top: 80px">
		<div
			class="input-group d-flex mt-5 input-group justify-content-center">
			<form
				class="d-flex input-grouprow g-3 needs-validation
			justify-content-center"
				onsubmit="fetchTicket(event)" novalidate style="width: 80%">
				<div class="col-md-3">
					<input id="phonenumber" pattern="^[789]\d{9}$" type="tel"
						class="form-control" placeholder="Phone number" required>
					<div class="invalid-feedback">Please provide a valid phone
						number.</div>
				</div>
				<div class="col-md-3">

					<input id="traveldate" type="date" class="form-control" required>

					<div class="invalid-feedback">Enter a date</div>
				</div>


				<button class="btn btn-primary" id="ticketButton" type="submit">Find
					your ticket</button>
			</form>

		</div>
		<div id="ticketList"></div>
	</div>
	<script>
async function fetchTicket(event) {
    event.preventDefault();

    const phonenumber = document.getElementById("phonenumber").value;
    const traveldate = document.getElementById("traveldate").value;

    if (!phonenumber || !traveldate) {
        return;
    }

    const data = new FormData();
    data.append("phonenumber", phonenumber);
    data.append("traveldate", traveldate);
    console.log(data);
    const url = "<%=request.getContextPath()%>/ticket/find";
    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: new URLSearchParams(data).toString(),
        });
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        const TicketList = await response.json();
        console.log(TicketList);
        listTickets(TicketList);
    } catch (error) {
        console.error('Error:', error);
    }
}

function listTickets(items) {
    const ticketListDiv = document.getElementById("ticketList");
    const table = document.createElement("table");
    table.className = "table mt-5";

    const headers = ["Ticket ID", "Passenger Name", "Phone Number", "Total Price", "Travel Date"];
    const headerRow = table.insertRow();
    for (const header of headers) {
        const th = document.createElement("th");
        th.textContent = header;
        headerRow.appendChild(th);
    }
    for (const item of items) {
        const row = table.insertRow();
        const cell1 = row.insertCell(0);
        const cell2 = row.insertCell(1);
        const cell3 = row.insertCell(2);
        const cell4 = row.insertCell(3);
        const cell5 = row.insertCell(4);

        cell1.textContent = item.ticketId;
        cell2.textContent = item.passengerName;
        cell3.textContent = item.phoneNumber;
        cell4.textContent = item.totalPrice;
        cell5.textContent = item.travelDate;
    }

    ticketListDiv.innerHTML = "";
    ticketListDiv.appendChild(table);
}

const forms = document.querySelectorAll('.needs-validation');

Array.from(forms).forEach((form) => {
    form.addEventListener('submit', (event) => {
        if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        }

        form.classList.add('was-validated');
    });
});
</script>
</body>
</html>
