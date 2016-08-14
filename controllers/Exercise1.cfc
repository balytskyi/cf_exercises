component accessors="true" {

    property PivotIndexFinderService;

	public any function init(fw) {
		variables.fw = fw;
		return this;
	}

	public void function default(rc) {
	}

	public void function getPivotIndex(rc) {
		var array = listToArray(form.inputArray, " ");
		var hasErrors = false;
		for (item in array) {
			if (!isNumeric(item)) {
				hasErrors = true;
			}
		}

		rc.pivotIndex = 0;
		rc.errorMessage = "";
		rc.array = array;

		if (hasErrors EQ false) {
			rc.pivotIndex = variables.PivotIndexFinderService.findPivotIndex(array);
		} else {
			rc.errorMessage = "Invalid input data";
		}
	}

}
