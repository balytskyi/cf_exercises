<cfset rc.title = "Exercise 1" />

<cfif len(rc.errorMessage) GT 0>
	<cfoutput>
		#rc.errorMessage#
	</cfoutput>
<cfelse>
	<cfif rc.pivotIndex GT 0>
		<cfoutput>
			For the input array (#arrayToList(rc.array," ")#) "pivot" index is: #rc.pivotIndex#
		</cfoutput>
	<cfelse>
		<cfoutput>
			For the input array (#arrayToList(rc.array," ")#) "pivot" index is not found
		</cfoutput>
	</cfif>
</cfif>

<cfoutput>
	<br><a href="#buildURL('exercise1')#">Back</a>
</cfoutput>
