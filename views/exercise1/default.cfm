<cfset rc.title = "Exercise 1" />

<cfform name="arrayForm" action="#buildURL('exercise1.getPivotIndex')#" method="POST">

	<div class="field">
		<label>
			Enter elements of array separated by spaces
		</label>
		<br>
		<cftextarea name="inputArray" wrap="virtual" rows="5" cols="50" />
	</div>

	<div class="control">
		<input type="submit" value="Submit">
	</div>

</cfform>
