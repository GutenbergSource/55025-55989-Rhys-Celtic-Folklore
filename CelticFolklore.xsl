<!DOCTYPE xsl:stylesheet [

    <!ENTITY aacute "&#x00E1;">
    <!ENTITY amacr "&#x0101;">
    <!ENTITY euml "&#x00EB;">
    <!ENTITY imacr "&#x012B;">
    <!ENTITY mdash "&#x2014;">
    <!ENTITY ndash "&#x2013;">
    <!ENTITY tdotb "&#x1E6D;">
    <!ENTITY umacr "&#x016B;">
    <!ENTITY Ycirc "&#x0176;">
    <!ENTITY ycirc "&#x0177;">

]>
<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="urn:stylesheet-functions"
    exclude-result-prefixes="f xs"
    version="2.0">

<xsl:include href="../../../../../Tools/tei2html/merge-documents.xsl"/>

<xsl:variable name="volume1" select="f:import-document('Volume 1/CelticFolklore1.xml', /, 'v1', 'v2')"/>
<xsl:variable name="volume2" select="f:import-document('Volume 2/CelticFolklore2.xml', /, 'v2', 'v1')"/>

<xsl:template match="/">
    <TEI.2 lang="en">
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title>Celtic Folklore: Welsh and Manx</title>
                <author key="Rh&ycirc;s, John" ref="https://viaf.org/viaf/41967414/">John Rh&ycirc;s (1840&ndash;1915)</author>
                <respStmt><resp>Transcription</resp> <name key="Hellingman, Jeroen">Jeroen Hellingman</name></respStmt>
            </titleStmt>
            <publicationStmt>
                <publisher>Project Gutenberg</publisher>
                <pubPlace>Urbana, Illinois, USA.</pubPlace>
                <idno type="OLN">OL7078815M</idno>
                <idno type="OLW">OL1685975W</idno>
                <idno type="PGclearance">20150925132802rhys</idno>
                <idno type="epub-id">urn:uuid:1a816428-d916-4793-95da-9eed106f41eb</idno>
                <idno type="PGnum">#####</idno>
                <date>#####</date>

                <xsl:apply-templates select="$volume1//teiHeader/fileDesc/publicationStmt/availability"/>

            </publicationStmt>
            <sourceDesc>
                <bibl>
                    <author>John Rh&ycirc;s</author>
                    <title>Celtic Folklore: Welsh and Manx</title>
                    <date>1901</date>
                </bibl>
            </sourceDesc>
        </fileDesc>

        <xsl:apply-templates select="$volume1//teiHeader/encodingDesc"/>
        <xsl:apply-templates select="$volume1//teiHeader/profileDesc"/>

        <revisionDesc>
            <list type="simple">
                <item>2017-06-14 Started.</item>
            </list>
        </revisionDesc>
    </teiHeader>
    <text rend="stylesheet(style/classic.css)">
        <front id="frontmatter">
            <div1 id="cover" type="Cover">
                <p>
                    <figure id="cover-image" rend="image(images/new-cover.jpg)">
                        <figDesc>Newly Designed Front Cover.</figDesc>
                    </figure>
                </p>
            </div1>

            <xsl:apply-templates select="$volume1/text/front/div1[@id='v1titlepage']"/>
            <xsl:apply-templates select="$volume1/text/front/titlePage"/>
            <xsl:apply-templates select="$volume1/text/front/div1[@id='v1copyright' or @id='v1preface']"/>

            <div1 id="toc" type="Contents">
                <head>Contents</head>

                <div2 type="Contents">
                    <xsl:apply-templates select="$volume1/text/front/div1[@id='v1toc']/*[not(self::head)]"/>
                </div2>
            </div1>

        <pb id="v1pb1" n="1"/>
        </front>
        <body>
            <xsl:apply-templates select="$volume1/text/body/*"/>
            <pb id="v2pb401" n="401"/>
            <xsl:apply-templates select="$volume2/text/body/*"/>
        </body>
        <back id="backmatter">
            <xsl:apply-templates select="$volume1/text/back/div1"/>
            <xsl:apply-templates select="$volume2/text/back/div1"/>

            <divGen type="Colophon"/>
        </back>
    </text>
    </TEI.2>
</xsl:template>


<xsl:template match="ab[@id='v1volumetitle']"/>


<xsl:template match="node()|@*">
    <xsl:copy>
        <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
</xsl:template>


</xsl:transform>
