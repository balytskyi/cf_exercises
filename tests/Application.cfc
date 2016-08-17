component{
	this.name = 'Exercises Tests';
    variables.here = getDirectoryFromPath(getCurrentTemplatePath());
	this.mappings['/mxunit'] = variables.here & "../../mxunit";
	this.mappings['/framework'] = variables.here & "../framework";
	this.mappings['/appRoot'] = variables.here & "../";
}
