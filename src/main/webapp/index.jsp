<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP - Hello World</title>
<!-- Include Bootstrap 5 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">

</head>
<style>
.autocomplete-dropdown {
	max-height: 150px;
	overflow-y: auto;
	width: 100%; /* Adjust the width to match the input field */
}

.autocomplete-dropdown div {
	padding: 5px;
	cursor: pointer;
}

.field {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.form-container {
	display: flex;
	flex-direction: column;
	width: 450px;
	align-items: center;
	margin: auto;
}
.w-150{
	min-width:250px !important;
}
</style>
<body>
    <jsp:include page="GuestNavbar.jsp" />

    <form action="${pageContext.request.contextPath}/bus/list" method="post">
        <div class="form-container">
            <h1>Booking</h1>
                        <div class="mb-3 field">
                <span class="fw-semibold mb-2">Location Details:</span>
            </div>
            <div class="input-group">
                <input type="text" name="fromLocation" required id="fromLocation" class="form-control" autocomplete="off" placeholder="from">
                <input type="text" disabled name="toLocation" required id="toLocation" class="form-control" autocomplete="off" placeholder="to">
                <input type="date" id="travelDate" name="travelDate" required class="form-control"><br>

</div>


            <input name="routeId" type="hidden" id="selectedRouteId" />
            <input type="submit" value="Search Buses" class="btn btn-primary mt-3">
        </div>
    </form>
    <ul id="routeList" class="d-flex align-items-start justify-content-center p-0">
    </ul>
    <script>
        const fromLocationInput = document.getElementById("fromLocation");
        const toLocationInput = document.getElementById("toLocation");

        let routeList;

        document.addEventListener("DOMContentLoaded", function () {
            fetchRoutes();

            const form = document.querySelector("form");
            form.addEventListener("submit", function (event) {
                event.preventDefault();
                const fromLocation = fromLocationInput.value;
                const toLocation = toLocationInput.value;

                console.log("From Location:", fromLocation);
                console.log("To Location:", toLocation);

                selectRouteId();

                form.submit();
            });

            fromLocationInput.addEventListener("input", function () {
                const inputValue = this.value.toLowerCase();
                displayRoutes(inputValue);
            });
        });

        function fetchRoutes() {
            fetch("${pageContext.request.contextPath}/fetch-routes")
                .then((response) => response.json())
                .then((routes) => {
                    routeList = routes;
                    displayRoutes();
                })
                .catch((error) => {
                    console.error("Error fetching routes: " + error);
                });
        }

        function displayRoutes() {
            const listDiv = document.getElementById("routeList");
            listDiv.innerHTML = '';

            const fromLocation = fromLocationInput.value.toLowerCase();

            const filteredRoutes = routeList.filter(route => route.fromLocation.toLowerCase().startsWith(fromLocation));

            if (filteredRoutes.length > 0) {
                const columns = 3;
                const itemsPerColumn = Math.ceil(filteredRoutes.length / columns);

                for (let i = 0; i < columns; i++) {
                    const columnDiv = document.createElement("div");
                    columnDiv.classList.add("col-xl-2");
                    const columnList = document.createElement("ul");
                    columnList.classList.add("d-flex", "flex-column", "align-items-start", "justify-content-center", "p-0","w-150");
                    for (let j = i * itemsPerColumn; j < (i + 1) * itemsPerColumn && j < filteredRoutes.length; j++) {
                        const route = filteredRoutes[j];
                        const item = document.createElement("p");
                        item.style.textAlign = "left"; 
                        item.classList.add("btn", "text-left", "mt-2","w-150");
                        item.textContent = route.fromLocation + ' to ' + route.toLocation;

                        item.addEventListener("click", function () {
                            fromLocationInput.value = route.fromLocation;
                            toLocationInput.value = route.toLocation;
                            selectRouteId();
                        });
                        
                        item.addEventListener("mouseenter", function () {
                            item.textContent = "Click to Add"; 
                        });

                        item.addEventListener("mouseleave", function () {
                            item.textContent = route.fromLocation + ' to ' + route.toLocation; 
                        });

                        columnList.appendChild(item);
                    }

                    columnDiv.appendChild(columnList);
                    listDiv.appendChild(columnDiv);
                }
            } else {
                const noRoutesItem = document.createElement("p");
                noRoutesItem.textContent = "No routes available.";
                listDiv.appendChild(noRoutesItem);
            }
        }

        function selectRouteId() {
            const selectedToLocation = toLocationInput.value;

            for (const route of routeList) {
                if (route.fromLocation === fromLocationInput.value && route.toLocation === selectedToLocation) {
                    document.getElementById("selectedRouteId").value = route.routeId;
                    break;
                }
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
</body>
</html>