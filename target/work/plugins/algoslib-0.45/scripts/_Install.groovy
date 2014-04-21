/*
 * Main script to setup algosvers on installation
 */

def sourceFile
def targetFile

// copy Readme into project
sourceFile = "${pluginBasedir}/grails-app/Readme"
targetFile = "${basedir}/README-Lib"
ant.copy(file: sourceFile, tofile: targetFile, overwrite: true)
ant.delete(file: sourceFile)

print('------------')
print('Algoslib - creato (o sovrascritto) README-Lib')
print('------------')
