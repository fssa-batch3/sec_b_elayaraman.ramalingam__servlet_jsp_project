<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html class="h-100">

<head>
<title>Bookings</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRmz2DAYM2fXMwJ5NqF5t1rbZ3R5C5tZ4l5g5T5D6w"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRmz2DAYM2fXMwJ5NqF5t1rbZ3R5C5tZ4l5g5T5D6w"
	crossorigin="anonymous"></script>


<body class="h-100">
	<jsp:include page="GuestNavbar.jsp" />
	<div
		class=" container d-flex flex-column align-items-center justify-content-center"
		style="margin-top: 80px;">
		<h1>User Bookings</h1>

		<c:choose>
			<c:when test="${not empty bookings}">
				<table class="table">
					<thead>
						<tr>
							<th>Bus Number</th>
							<th>Travel Date</th>
							<th>From Location</th>
							<th>To Location</th>
							<th>Booked Seats</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="booking" items="${bookings}">
							<tr>
								<td>${booking.busNumber}</td>
								<td>${booking.travelDate}</td>
								<td>${booking.fromLocation}</td>
								<td>${booking.toLocation}</td>
								<td>${booking.seatCount}</td>
								<td>${(booking.cancelable && booking.status) ? "Active" : "Expired / Cancelled"}</td>
								<td><c:choose>
										<c:when test="${booking.cancelable && booking.status}">
											<button href="javascript:void(0);"
												onclick="handleCancelClick(${booking.ticketId});"
												data-bs-toggle="modal"
												data-bs-target="#cancelConfirmationModal">Cancel</button>
										</c:when>
										<c:otherwise>Not Cancelable</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<p>No bookings</p>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="modal fade" id="cancelConfirmationModal" tabindex="-1"
		aria-labelledby="cancelConfirmationModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cancelConfirmationModalLabel">Confirmation</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are you sure you want to cancel this
					booking?</div>
				<div class="modal-footer">
					<form action="<%=request.getContextPath()%>/user/cancelBooking"
						method="post" id="cancelForm">
						<input type="hidden" name="ticketId" id="ticketIdInput" value="">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">No</button>
						<button type="submit" class="btn btn-danger">Yes</button>
					</form>

				</div>
			</div>
		</div>
	</div>

	<script>
	function handleCancelClick(ticketId) {
	    document.getElementById("ticketIdInput").value =ticketId;

	}
	</script>

	</script>

</body>

</html>
