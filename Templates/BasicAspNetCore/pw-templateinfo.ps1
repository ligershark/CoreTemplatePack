[cmdletbinding()]
param()

$templateInfo = New-Object -TypeName psobject -Property @{
    Name = 'BasicAspNetCore'
    Type = 'ProjectTemplate'
    # TODO: Customize
    DefaultProjectName = 'WebApplication'
    CreateNewFolder = $false
    AfterInstall = {
        Update-VisualStuidoProjects -slnRoot ($SolutionRoot)
    }
}

$templateInfo | replace (
    # TODO: customize and add extra replacements as needed
    ('BasicAspNetCore', {"$ProjectName"}, {"$DefaultProjectName"}),
	('d12aef7f-5910-4ca6-9167-7406039c9ec4', {"$ProjectId"}, {[System.Guid]::NewGuid()})
)

# when the template is run any filename with the given string will be updated
$templateInfo | update-filename (
    # TODO: customize based on your project names
    ,('BasicAspNetCore', {"$ProjectName"}<#,$null,@('.csproj','.bak','.projitems','.shproj','.cs')#>)
)
# excludes files from the template
$templateInfo | exclude-file 'pw-*.*','*.user','*.suo','*.userosscache','project.lock.json','*.vs*scc','*.sln','_project.vstemplate'
# excludes folders from the template
$templateInfo | exclude-folder '.vs','artifacts','packages','bin','obj'

# This will register the template with pecan-waffle
Set-TemplateInfo -templateInfo $templateInfo
