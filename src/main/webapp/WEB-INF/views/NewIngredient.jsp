<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Add New Ingredient</title>
<!-- Bootstrap 4.5 CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
	<div class="container mt-5">
		<h2 class="mb-4">Add New Ingredient</h2>
		<form action="saveingredient" method="post">
			<div class="form-group">
				<label for="name">Name (e.g., INS211)</label> <input type="text"
					class="form-control" id="name" name="name"
					placeholder="Enter ingredient code" required />
			</div>

			<div class="form-group">
				<label for="scientificName">Scientific Name</label> <input
					type="text" class="form-control" id="scientificName"
					name="scientificName" placeholder="Sodium Benzoate (INS 211)"
					required />
			</div>

			<div class="form-group">
				<label for="commonUsage">Common Usage</label>
				<textarea class="form-control" id="commonUsage" name="commonUsage"
					rows="3" placeholder="Describe common uses"></textarea>
			</div>

			<div class="form-group">
				<label>Avoided By</label>
				<div class="form-row">
					<div class="col-md-4">
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								id="asthma_patient" name="avoidBy" value="Asthma Patient" /> <label
								class="form-check-label" for="asthma_patient">Asthma
								Patient</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								id="diabetic_patient" name="avoidBy" value="Diabetic Patient" />
							<label class="form-check-label" for="diabetic_patient">Diabetic
								Patient</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="children"
								name="avoidBy" value="Children" /> <label
								class="form-check-label" for="children">Children</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="infant"
								name="avoidBy" value="infant" /> <label
								class="form-check-label" for="Infant">Infant</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="adult"
								name="avoidBy" value="Adult" /> <label class="form-check-label"
								for="adult">Adult</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								id="senior_citizen" name="avoidBy" value="Senior Citizen" /> <label
								class="form-check-label" for="senior_citizen">Senior
								Citizen</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								id="pregnant_woman" name="avoidBy" value="Pregnant Woman" /> <label
								class="form-check-label" for="pregnant_woman">Pregnant
								Woman</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								id="breastfeeding_woman" name="avoidBy"
								value="Breastfeeding Woman" /> <label class="form-check-label"
								for="breastfeeding_woman">Breastfeeding Woman</label>
						</div>
					</div>
				</div>
			</div>


			<div class="form-group">
				<label for="fda">FDA Status</label> <input type="text"
					class="form-control" id="fda" name="fda"
					placeholder="FDA approval or warnings" />
			</div>

			<div class="form-group">
				<label for="fssai">FSSAI Status</label> <input type="text"
					class="form-control" id="fssai" name="fssai"
					placeholder="FSSAI approval or warnings" />
			</div>

			<div class="form-group">
				<label for="efsa">EFSA Status</label> <input type="text"
					class="form-control" id="efsa" name="efsa"
					placeholder="EFSA approval or warnings" />
			</div>

			<button type="submit" class="btn btn-primary">Add Ingredient</button>
		</form>
	</div>

	<!-- Bootstrap 4.5 JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
