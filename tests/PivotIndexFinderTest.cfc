<cfcomponent extends="mxunit.framework.TestCase">

	<cffunction name="beforeTests" returntype="void" access="public">
		<cfset finder = createObject("component","exercises.model.services.PivotIndexFinder")>
	</cffunction>

	<cffunction name="findPivotIndex_should_return_3" returntype="void" access="public">
		<cfset var result = finder.findPivotIndex([5,6,1,5,6])>
		<cfset assertEquals(3, result,"Expected 3 but was #result#")>
	</cffunction>

	<cffunction name="findPivotIndex_should_return_3_when_5_equal_items" returntype="void" access="public">
		<cfset var result = finder.findPivotIndex([1,1,1,1,1])>
		<cfset assertEquals(3, result,"Expected 3 but was #result#")>
	</cffunction>

	<cffunction name="findPivotIndex_should_return_0_when_empty" returntype="void" access="public">
		<cfset var result = finder.findPivotIndex([])>
		<cfset assertEquals(0, result,"Expected 0 but was #result#")>
	</cffunction>

	<cffunction name="findPivotIndex_should_return_2_case_with_negative_items" returntype="void" access="public">
		<cfset var result = finder.findPivotIndex([2, 5, -1, 3])>
		<cfset assertEquals(2, result,"Expected 2 but was #result#")>
	</cffunction>

	<cffunction name="findPivotIndex_should_return_first_pivot_when_multiple_exists" returntype="void" access="public">
		<cfset var result = finder.findPivotIndex([5, -10, 2, 3, 0])>
		<cfset assertEquals(2, result,"Expected 2 but was #result#")>
	</cffunction>

</cfcomponent>
