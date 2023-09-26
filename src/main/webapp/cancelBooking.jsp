<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cancel Booking</title>
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
<body>
<jsp:include page="GuestNavbar.jsp" />
<div class="container d-flex flex-column align-items-center justify-content-center" style="margin-top: 80px;">
    <form id="cancelForm" action="${pageContext.request.contextPath}/ticket/cancel" method="post">
        <div class="">
        <label for="ticketId">Enter Ticket ID:</label>
        <input type="text" id="ticketId" name="ticketId">
        </div>
        <div class="">
        <label for="phonenumber">Enter Booked Phone number:</label>
<input type="tel" id="phonenumber" name="phonenumber" oninput="assign(event)">
        </div>
        <button type="button" id="cancelButton" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmationModal">Cancel Ticket</button>
    </form>

    <div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirmation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Enter the OTP sent to (<span id="num"></span>)</p>
                    <input type="text" id="confirmationInput" class="form-control">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" id="confirmCancel" class="btn btn-danger" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
let number ;

function assign(event) {
    const inputValue = event.target.value;
    document.getElementById("num").textContent = inputValue;
}


        const cancelButton = document.getElementById("cancelButton");
        const confirmationModal = document.getElementById("confirmationModal");
        const confirmCancel = document.getElementById("confirmCancel");
        const confirmationInput = document.getElementById("confirmationInput");
        const ticketIdInput = document.getElementById("ticketId");
        const phonenumber = document.getElementById('phonenumber').value;

        cancelButton.addEventListener("click", function () {
        	console.log(phonenumber);
        	
            confirmationModal.show();
            const phoneNumberInput = document.getElementById('phonenumber');
            document.getElementById('num').textContent = phoneNumberInput.value;
        });

        confirmCancel.addEventListener("click", function () {
            let inputValue = confirmationInput.value.trim();

            if (inputValue !== "") {
                document.getElementById("cancelForm").submit();
            }

            confirmationModal.style.display = "none";
        });
</script>
</body>
</html>
