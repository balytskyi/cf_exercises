component {

	public numeric function findPivotIndex(array inputArray) {
		var sum = 0;
		var leftSum = 0;

		for(i = 1; i LTE arrayLen(inputArray); i = i + 1) {
			sum = sum + inputArray[i];
		}

		for(i = 1; i LTE arrayLen(inputArray); i = i + 1) {
			sum = sum - inputArray[i];

			if (leftSum EQ sum) {
				return i;
			}

			leftSum = leftSum + inputArray[i];
		}

		return 0;
	}

}
