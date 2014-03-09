#! /bin/bash

helpString="
iconAnnotate is a generic script to annotate icons for different environments.

It annotates release mode and app version number in colored header and footer
sections of application icons.


OPTIONS:
   -w=<workspace>       REQUIRED - project workspace
   -p=<project_name>    REQUIRED - project name
   -m=<release_mode>    OPTIONAL - release mode 
                        build specific parameters which may switch application 
                        behaviour for different build environments
                        'dev', 'qa', 'lt', or 'preprod'. 'dev' if not specified.
   -r=<revision_mode>	OPTIONAL - revision mode
                        specifying which revision the build is for (i.e. normal
                        development or specific branched off release build).
                        'bau', rel'. 'bau' if not specified.

E.g.: sh iconAnnotate.sh -w /Users/hadibadjian/projects/icAnn -p icAnn -m qa

Glossary:
   #release_mode
   dev     development
   qa      quality assurance
   lt      load test
   preprod pre-production

   #revision_mode
   bau     business as usual
   rel     release
";

while getopts "w:p:m:r:h" opt; do
case "$opt" in
	w) pWorkspace=$OPTARG ;;
    p) projectName=$OPTARG ;;
    m) mode=$OPTARG ;;
	r) revision=$OPTARG ;;
    h) echo "$helpString"; exit 1 ;;
    \?) echo "Invalid option: -$OPTARG" >&2 ;;
    :) echo "Option -$OPTARG requires an argument." >&2
exit 1 ;;
esac
done

if [[ "$pWorkspace" == "" || "$projectName" == "" ]]; then
echo "$helpString"; exit 1;
fi

if [[ ! -f ${pWorkspace}/${projectName}/${projectName}-Info.plist ]]; then
	echo "could not retrieve application version!\nPlease place the plist file at $pWorkspace/$projectName/$projectName-Info.plist";
	version="0.0.0";
else
	shortVersion=$(/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' $pWorkspace/$projectName/$projectName-Info.plist)
	bundleVersion=$(/usr/libexec/PlistBuddy -c 'Print :CFBundleVersion' $pWorkspace/$projectName/$projectName-Info.plist)
	version=${shortVersion}.${bundleVersion}
fi
echo "app version: $version";

# associating different colors to different environment builds
if [ "$mode" == "qa" ]; then
	backgroundColor="#8742D6";
elif [ "$mode" == "lt" ]; then
	backgroundColor="#A64B00";
elif [ "$mode" == "preprod" ]; then
	backgroundColor="#0C5AA6";
else
	backgroundColor="#A67F00";
	mode="dev";
fi

# capitalizing mode characters
mode=$(tr '[a-z]' '[A-Z]' <<< ${mode});

# appending revision to mode string
if [ "$revision" == "rel" ]; then
	mode="REL-${mode}";
elif [ "$revision" == "bau" ]; then
	mode="BAU-${mode}";
else
	mode="BAU-${mode}";
fi
echo "app mode: $mode";

# application icons location
FILES=${pWorkspace}/${projectName}/Icons/*.png
echo "    ${FILES}"
shopt -s nullglob
for image in ${FILES}; do
	echo "----------------------------------------"
	echo "    imageLocation   :$image"
	echo "    annotation      :$version"
	echo "    mode            :$mode"

	imageWidth=$(identify -format "%[fx:w]" ${image})
	imageHeight=$(identify -format "%[fx:h]" ${image})
	echo "    width           :$imageWidth"
	echo "    height          :$imageHeight"

	# burning the version number to the bottom of icon
	convert  -background ${backgroundColor} \
						-fill white \
						-gravity center \
						-size ${imageWidth}x20 caption:${version} \
						${image} +swap -gravity south -composite ${image}

	# burning environment param to the header of icon
	convert  -background ${backgroundColor} \
						-fill white \
						-gravity center \
						-size ${imageWidth}x20 caption:${mode} \
						${image} +swap -gravity north -composite ${image}

	echo "----------------------------------------"
done
