<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">

	<link rel="stylesheet" href="./assets/styles/style.css">

</head>
<style>

.field {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

form {
	background: url("./assets/images/bus-bg.jpg");
	background-size: cover;
	background-position: center;
	height: 300px;
}

.form-container {
	display: flex;
	flex-direction: column;
	width: 450px;
	align-items: center;
	margin: auto;
	-webkit-backdrop-filter: blur(5px);
	backdrop-filter: blur(5px);
}

.holder{
	display:grid;
	grid-template-columns: repeat(auto-fit, minmax(275px, 1fr));
  	gap: 10px;
  	width:700px;
  	justify-items:center;
}

.route{
height:48px;
width:350px;
}

#loader{
width:100px;
height:100px;
}
.select{
width:100px;
}

.w-150 {
	min-width: 250px !important;
}

#routeList{
height: calc(100vh - 460px) !important;
}

::-webkit-scrollbar {
  width: 6px;
}

::-webkit-scrollbar-track {
  background: #f1f1f1;
}

::-webkit-scrollbar-thumb {
  background: #d1d1cf;
}

::-webkit-scrollbar-thumb:hover {
  background: #d6d6c6;
}
</style>
<jsp:include page="GuestNavbar.jsp" />
<body>

	<form action="${pageContext.request.contextPath}/bus/list"
		method="post" style="margin-top: 80px">
		<div class="form-container m-auto justify-content-center h-100 w-100">
			<div style="width:400px">
			<div class="mb-3 field">
				<h2 class="fw-semibold mb-2 text-light">Location Details:</h2>
			</div>
			<div class="input-group">
				<input type="text" name="fromLocation" required id="fromLocation"
					class="form-control" autocomplete="off" placeholder="from">
				<input type="text" disabled name="toLocation" required
					id="toLocation" class="form-control" autocomplete="off"
					placeholder="to"> <input type="date" id="travelDate"
					name="travelDate" required class="form-control"min="<%=java.time.LocalDate.now()%>" max="<%=java.time.LocalDate.now().plusDays(60)%>"><br>
			</div>
			</div>
			<input name="routeId" type="hidden" id="selectedRouteId" /> <input
				type="submit" value="Search Buses" class="btn btn-primary mt-3">
			<div id="locationError" class="form-text text-danger d-none">Select a route to book tickets</div>
			<div id="emailHelp" class="form-text text-light"><em>Type from location to get the route or select the route from the list below</em></div>
		</div>
		
	</form>
	<h3 class="fw-semibold mb-2 text-dark text-center mt-3	">Available Routes:</h3>
	<div id="loader" class="container d-flex w-100 justify-content-center flex-column align-items-center">
	<img src="./assets/images/Dual Ring-1s-70px.svg" class="h-25 w-25">
	<p>Fetching Locations</p>
	</div>
	<div id="routeList"
		class="d-flex align-items-start justify-content-center p-0 overflow-auto">
	</div>
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
                if(fromLocation && toLocation){
                	form.submit();
                }else{
                	console.log(document.getElementById("locationError"));
                	document.getElementById("locationError").classList.remove("d-none");
                }
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
                    document.getElementById("loader").classList.add("d-none");
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
            	
                    const columnList = document.createElement("div");
                    columnList.classList.add("holder");
                    for (let j = 0;  j < filteredRoutes.length; j++) {
                    	
                        const route = filteredRoutes[j];
                        const holder = document.createElement("div");
                        holder.classList.add("d-flex","m-3","route");
                        const item = document.createElement("p");
                        const btn = document.createElement("button");
                        btn.textContent= "Select";
                        btn.classList.add("btn","btn-light","btn-sm","select");
                        item.style.textAlign = "left"; 
                        item.classList.add("text-left", "mt-2","w-150");
                        item.textContent = route.fromLocation + ' to ' + route.toLocation;
                        
                        

                        btn.addEventListener("click", function () {
                            fromLocationInput.value = route.fromLocation;
                            toLocationInput.value = route.toLocation;
                            selectRouteId();
                        });
                        
                        btn.addEventListener("mouseenter", function () {
							btn.classList.remove("btn-light");
							btn.classList.add("btn-primary");

						});

                        btn.addEventListener("mouseleave", function () {
							btn.classList.remove("btn-primary");
							btn.classList.add("btn-light");

						});

                        holder.appendChild(item);
                        holder.appendChild(btn);
                        columnList.appendChild(holder);
                    }

                    listDiv.appendChild(columnList);
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
</body>
</html>