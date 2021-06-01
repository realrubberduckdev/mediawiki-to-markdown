MediaWiki to Markdown
=====================

Convert MediaWiki pages to GitHub flavored Markdown (or other formats supported by Pandoc). The conversion uses an XML export from MediaWiki and converts each wiki page to an individual markdown file. Directory structures will be preserved. The generated export can also include frontmatter for Github pages.

You may also be interested in a forked version of this codebase available at https://github.com/philipashlock/mediawiki-to-markdown

You may also be interested in a forked version of this codebase available at https://github.com/outofcontrol/mediawiki-to-gfm


## Requirements

* Docker
* Powershell


## Export MediaWiki Pages

You'll export all your pages as a single XML file following these steps: http://en.wikipedia.org/wiki/Help:Export


## Run

The simplest way to run is using the `convert.ps1` script.

`.\convert.ps1 -convertFileArgFullPath C:\wiki.xml`

### Further granular run parameters

In order to use any other options, you will have update the `$dockerRunCmd` variable in `convert.ps1` script. The available options are below.

####--filename####
The only required parameter is `filename` for the name of the xml file you exported from MediaWiki, eg: 

`php convert.php --filename=mediawiki.xml`

####--output####
You can also use `output` to specify an output folder since each wiki page in the XML file will generate it's own separate markdown file.

`php convert.php --filename=mediawiki.xml --output=export`


####--indexes####
You can set `indexes` as `true` if you want pages with the same name as a directory to be renamed as index.md and placed into their directory

`php convert.php --filename=mediawiki.xml --output=export --indexes=true`

####--frontmatter####
You can specify whether you want frontmatter included. This is automatically set to `true` when the output format is `gfm`

`php convert.php --filename=mediawiki.xml --output=export --format=markdown_phpextra --frontmatter=true`


####--format####
You can specify different output formats with `format`. The default is `gfm`. See 

`php convert.php --filename=mediawiki.xml --output=export --format=markdown_phpextra`

Supported pandoc formats are: 

* asciidoc
* beamer
* context
* docbook
* docx
* dokuwiki
* dzslides
* epub
* epub3
* fb2
* haddock
* html
* html5
* icml
* json
* latex
* man
* markdown
* gfm
* markdown_mmd
* markdown_phpextra
* markdown_strict
* mediawiki
* native
* odt
* opendocument
* opml
* org
* plain
* revealjs
* rst
* rtf
* s5
* slideous
* slidy
* texinfo
* textile
