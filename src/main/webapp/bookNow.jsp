check

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="in.fssa.sundaratravels.dto.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Now</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

</head>
<style>
html, body {
	height: 100%;
	width: 100%;
}

.h-100 {
	height: 100%;
	width: 100%;
}

.h-80 {
	height: 80%;
}

.seat {
	height: 50px;
	width: 100px;
	display: flex;
	flex-direction: column-reverse;
	align-items: center;
	align-content: center;
	flex-wrap: wrap;
}
</style>
<body>
	<jsp:include page="GuestNavbar.jsp" />
	<%
	BusDetailsDTO busDetails = (BusDetailsDTO) request.getAttribute("busDetails");
	%>

	<div class="container d-flex align-item-center h-100">
		<div id="checkboxContainer" class=" h-80 m-auto w-50 d-flex flex-wrap">
		</div>
		<form id="mainForm"
			class=" needs-validation d-flex flex-column m-auto w-50" novalidate
			method="post">

			<input type="hidden" name="busId" value="<%=busDetails.getBusid()%>">
			<input type="hidden" name="busNo" value="<%=busDetails.getBusNo()%>">
			<input type="hidden" value="<%=busDetails.getSeats()%>" name="seats" />
			<input type="hidden" name="basePrice" id="basePrice"
				value="<%=busDetails.getBasePrice()%>"> <input type="hidden"
				name="availableSeats" value="<%=busDetails.getAvailableSeats()%>">
			<input type="hidden" name="travelDate"
				value="<%=busDetails.getTravelDate()%>"> <input
				type="hidden" id="finalPrice" name="finalPrice" value=""> <input
				type="hidden" name="selectedSeats" id="selectedSeats" value="">

			<h1>Passenger Details</h1>

			<div class="col">
				<label for="passengerName" class="form-label">Name of the
					Passenger</label> <input class="form-control" type="text" id="name"
					name="passengerName" required>
				<div class="valid-feedback">Good to go!</div>
				<div class="invalid-feedback">Passenger name is required</div>
			</div>

			<input type="hidden" id="finalPrice" name="finalPrice" value="">

			<div class="col">
				<label for="phoneNumber" class="form-label">Phone number of
					the Passenger</label> <input class="form-control" type="tel"
					id="phoneNumber" pattern="[6-9][0-9]{9}" name="phoneNumber"
					required />
				<div class="valid-feedback">Good to go!</div>
				<div class="invalid-feedback">Enter a valid phone number</div>
			</div>
			<div class="col">
				<div class="col-auto">
					<label for="seatCount" class="col-form-label">Ticket count</label>
				</div>
				<div class="col-auto">
					<input type="number" class="form-control" id="seatCount"
						name="seatCount" min="1" max="<%=busDetails.getAvailableSeats()%>"
						required>
					<div class="valid-feedback">Good to go!</div>
					<div class="invalid-feedback">Minimum 1 ticket should be
						selected</div>
				</div>
			</div>
			<div class="col-auto">
				<span class="form-text"><%=busDetails.getAvailableSeats()%>
					available tickets </span>
			</div>
			<div class="col mt-4">
				<button type="button" class="btn-primary btn" data-bs-toggle="modal"
					data-bs-target="" id="bookNowButton">Book Now</button>
				<button type="button" onclick="window.history.back()"
					class="btn btn-secondary">Cancel</button>
			</div>
		</form>

		<div class="modal fade" id="paymentModal" tabindex="-1"
			aria-labelledby="paymentModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="paymentModalLabel">Payment</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- Mock payment form content -->
						<form id="mockPaymentForm" novalidate>
							<div class="mb-3">
								<label for="cardNumber" class="form-label">Card Number</label> <input
									type="text" class="form-control" id="cardNumber"
									name="cardNumber" required>
								<div class="invalid-feedback">Please enter a valid card
									number.</div>
							</div>
							<div class="mb-3">
								<label for="cvv" class="form-label">CVV</label> <input
									type="text" class="form-control" id="cvv" name="cvv" required>
								<div class="invalid-feedback">Please enter a valid CVV.</div>
							</div>
							<div class="mb-3">
								<label for="amountToBePaid" class="form-label">Amount to
									be Paid</label> <input type="text" class="form-control"
									id="amountToBePaid" name="amountToBePaid" readonly>
							</div>
							<button type="button" id="payment" class="btn btn-primary">Pay
								Now</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script>
  const seatsValue = document.querySelector('input[name="seats"]').value;
  const cleanedSeatsValue = seatsValue.replace(/[{}]/g, ''); 
  const seatPairs = cleanedSeatsValue.split(',');

  const busDetails = {};
  const selectedSeats = {};

  seatPairs.forEach(seatPair => {
    const [seatNumber, seatStatus] = seatPair.split('=').map(item => item.trim());
    busDetails[parseInt(seatNumber)] = seatStatus === 'true';
  });
	
  function updateSelectedSeats(seatNumber, isSelected) {
	  if (isSelected) {
	    selectedSeats[seatNumber] = true;
	  } else {
	    delete selectedSeats[seatNumber];
	  }
	  
	  const selectedSeatsInput = document.getElementById('selectedSeats');
	  selectedSeatsInput.value = JSON.stringify(selectedSeats);
	    
	  document.getElementById('seatCount').value = Object.keys(selectedSeats).length;
	  
	  const basePrice = parseFloat(document.getElementById('basePrice').value);
	  
	  const seatCount = parseInt(document.getElementById('seatCount').value);
	  
	  const finalPriceInput = document.getElementById('finalPrice');
	  
	  const finalPrice = basePrice * seatCount;
	    finalPriceInput.value = finalPrice.toFixed(2);
	    document.getElementById("amountToBePaid").value = finalPriceInput.value;
	    
	    console.log(basePrice);
	    
	    console.log(seatCount);
	    
	    console.log(finalPriceInput);
	  console.log(selectedSeats); 
	}
  console.log(busDetails);
  
  const checkboxContainer = document.getElementById('checkboxContainer');

  for (const seatNumber in busDetails) {
    if (busDetails.hasOwnProperty(seatNumber)) {
      const label = document.createElement('div');
      label.textContent = seatNumber;
      label.classList.add("seat");
      
      const checkbox = document.createElement('input');
      checkbox.type = 'checkbox';
      checkbox.name = seatNumber;
      checkbox.value = seatNumber;
      checkbox.checked = busDetails[seatNumber];
      checkbox.disabled = busDetails[seatNumber];
      checkbox.classList.add("btn");
      
      checkbox.addEventListener('click', function () {
          updateSelectedSeats(seatNumber, this.checked);
        });
      
      label.appendChild(checkbox);
      checkboxContainer.appendChild(label);
    }
  }

  document.addEventListener("DOMContentLoaded", function () {
    const forms = document.querySelectorAll('.needs-validation');
    const bookNowButton = document.getElementById('bookNowButton');
    const paymentModal = new bootstrap.Modal(document.getElementById('paymentModal'));
    const finalPriceInput = document.getElementById('finalPrice');
    Array.from(forms).forEach(form => {
      form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
    bookNowButton.addEventListener('click', () => {
      const form = document.querySelector('.needs-validation');
      if(!selectedSeats){
    	  
      }
      else if (form.checkValidity()) {
        paymentModal.show();
      } else {
        form.classList.add('was-validated');
      }
    });
    document.getElementById("payment").addEventListener('click', (e) => {
      const form = document.querySelector('#mainForm');
      const mock = document.getElementById('mockPaymentForm');
      if (mock.checkValidity()) {
        console.log("" + form);
        form.submit();
      } else {
        mock.classList.add('was-validated');
      }
    });
  });

</script>


</body>
</html>
