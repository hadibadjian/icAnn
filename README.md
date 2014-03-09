#icAnn
icAnn (ICon ANNotation) is a generic script to annotate icons for different environments. Although this script is designed specifically for iOS projects, it can be easily modified to be used for any other projects.

icAnn annotates release mode and app version number in colored header and footer
sections of application icons.

   Icon-72    |    Icon-76
:------------:|:-------------:
![Icon 72][Icon-72]|![Icon 76][Icon-76]
![Icon 72@2x][Icon-72@2x]|![Icon 76@2x][Icon-76@2x]


##Usage Help
```
$> sh iconAnnotate.sh -w /Users/hadibadjian/projects/icAnn -p icAnn -m qa
```
  options   | description
:-----------|------------:
 -w         | REQUIRED - project workspace
 -p         | REQUIRED - project name
 -m         | OPTIONAL - release mode, defined by build specific parameters  which may switch application behaviour for different build environments. Valid options are 'dev', 'qa', 'lt', or 'preprod'. 'dev' is selected if not specified.
 -r         | OPTIONAL - revision mode, specifying which revision the build is for (i.e. normal development or specific branched off release build). Valid options are 'bau', rel'. 'bau' is selected if not specified.

####Glossary:
 release_mode  | description
:--------------|:------------
   dev         | development
   qa          | quality assurance
   lt          | load test
   preprod     | pre-production

 revision_mode | description
:--------------|:------------
   bau         | business as usual
   rel         | release

##Version
0.0.1

##Requirements
icAnn uses a number of open source projects to work properly:

* [ImageMagick] - awesome web-based text editor
* [Ghostscript] - a super fast port of Markdown to JavaScript

####Installation
I would recomment installing the dependencies using [Homebrew]:
```sh
brew install imagemagick
brew install ghostscript
```

##License
*MIT*

[ImageMagick]:http://www.imagemagick.org/
[Ghostscript]:http://ghostscript.com/
[Homebrew]:http://brew.sh/
[Icon-76@2x]:https://raw.github.com/hadibadjian/icAnn/master/icAnn/Icons/Icon-76@2x.png?raw=true
[Icon-76]:https://github.com/hadibadjian/icAnn/blob/master/icAnn/Icons/Icon-76.png?raw=true
[Icon-72@2x]:https://github.com/hadibadjian/icAnn/blob/master/icAnn/Icons/Icon-72@2x.png?raw=true
[Icon-72]:https://github.com/hadibadjian/icAnn/blob/master/icAnn/Icons/Icon-72.png?raw=true