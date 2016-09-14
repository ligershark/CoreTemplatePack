# Run this script to update the ASP.NET Core + Angular 2 project template to match the latest Yeoman generator

npm install -g yo generator-aspnetcore-spa

pushd "${0%/*}/../../Templates/AspNetCoreAngular2" > /dev/null
rm -r ./ClientApp ./Controllers ./node_modules ./typings ./Views ./wwwroot *.xproj *.json Dockerfile *.cs *.user *.md .gitignore *.config *.js
yo aspnetcore-spa --skip-install --framework=angular-2 --name=AspNetCoreAngular2 --projectguid=0b04208e-c11c-4026-9cfa-fbf4ecbd4547

# Even though there's a .gitignore excluding wwwroot/dist/, we do want those files to be tracked as part of the CoreTemplatePack repo,
# since the idea is to have prebuilt JS files as a workaround for the template not supporting post-project-creation actions.
git add -f wwwroot/dist/*

popd > /dev/null

echo "Template updated"
