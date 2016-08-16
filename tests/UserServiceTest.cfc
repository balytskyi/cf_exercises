<cfcomponent extends="mxunit.framework.TestCase">

	<cffunction name="beforeTests" returntype="void" access="public">
		<cfset var factory = new cf_exercises.framework.ioc( "/cf_exercises/model/beans")>
		<cfset userService = createObject("component","cf_exercises.model.services.User").init(factory)>
	</cffunction>

	<cffunction name="test_get_user_not_found" returntype="void" access="public">
		<cfset var result = userService.get("", "", 0, 0)>
		<cfset assertTrue(IsNull(result), "Expected null but was #result#")>
	</cffunction>

	<cffunction name="test_get_user_found_user" returntype="void" access="public">
		<cfset var result = userService.get("John Doe", "09/04/1988", 10, 7900)>
		<cfset assertEquals("New York", result.getCity(), "Expected 'New York' but was #result.getCity()#")>
	</cffunction>

</cfcomponent>
