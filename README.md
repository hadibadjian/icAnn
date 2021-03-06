#icAnn
icAnn (ICon ANNotation) is a generic script to annotate icons for different environments. It does not have any dependencies on a specific platform.

icAnn annotates release mode and app version number in colored header and footer
sections of application icons.

   Icon-72    |    Icon-76
:------------:|:-------------:
![Icon 72][Icon-72]|![Icon 76][Icon-76]
![Icon 72@2x][Icon-72@2x]|![Icon 76@2x][Icon-76@2x]


##Usage Help
```
$> sh icAnn.sh -w /Users/hadibadjian/Documents/projects/github/icAnn/icAnn/Icons -v 0.0.2 -m
```
  options   | description
:-----------|:------------
 -w         | REQUIRED - icons file path
 -v         | REQUIRED - version number
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
0.0.2

##Requirements
icAnn uses a number of open source projects to work properly:

* [ImageMagick] - awesome web-based text editor
* [Ghostscript] - a super fast port of Markdown to JavaScript

####Installation
I would recomment installing the dependencies using [Homebrew]:
```
$> brew install imagemagick
$> brew install ghostscript
```

##License
*[The MIT License (MIT)]*

[ImageMagick]:http://www.imagemagick.org/
[Ghostscript]:http://ghostscript.com/
[Homebrew]:http://brew.sh/
[Icon-76@2x]:https://raw.github.com/hadibadjian/icAnn/master/icAnn/Icons/Icon-76@2x.png?raw=true
[Icon-76]:https://github.com/hadibadjian/icAnn/blob/master/icAnn/Icons/Icon-76.png?raw=true
[Icon-72@2x]:https://github.com/hadibadjian/icAnn/blob/master/icAnn/Icons/Icon-72@2X.png?raw=true
[Icon-72]:https://github.com/hadibadjian/icAnn/blob/master/icAnn/Icons/Icon-72.png?raw=true
[The MIT License (MIT)]:https://raw.github.com/hadibadjian/icAnn/master/LICENSE