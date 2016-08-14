<cfset rc.title = "Exercise 1" />

<cfoutput>
	#rc.errorMessage#
</cfoutput>
<br>
<cfif rc.pivotIndex GT 0>
	<cfoutput>
		For the input array (#arrayToList(rc.array," ")#) "pivot" index is: #rc.pivotIndex#
	</cfoutput>
<cfelse>
	<cfoutput>
		For the input array (#arrayToList(rc.array," ")#) "pivot" index is not found
	</cfoutput>
</cfif>
