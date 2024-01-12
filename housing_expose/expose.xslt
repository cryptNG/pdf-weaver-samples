<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="xml" indent="yes"/>

    <!-- Define style variables -->
    <xsl:variable name="header-font" select="'Helvetica, Arial, sans-serif'"/>
    <xsl:variable name="body-font" select="'Georgia, serif'"/>
    <xsl:variable name="accent-color" select="'#8B0000'"/> <!-- Dark red for a touch of luxury -->
    <xsl:variable name="text-color" select="'#333333'"/>
    <xsl:variable name="border-color" select="'#DAA520'"/> <!-- Gold color for borders -->
    <xsl:variable name="background-color" select="'#FAF0E6'"/> <!-- Light beige for background -->
    <xsl:variable name="padding" select="'20pt'"/>

    <xsl:template match="/housingExpose">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple">
                    <fo:region-body margin="1in" padding="{$padding}" background-color="{$background-color}"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
                <fo:flow flow-name="xsl-region-body">
                    <!-- Property Title -->
                    <fo:block font-family="{$header-font}" font-size="26pt" font-weight="bold" color="{$accent-color}" text-align="center" space-after="20pt" border-bottom="4px solid {$border-color}">
                        <xsl:value-of select="property/title"/>
                    </fo:block>
                    <!-- Property Description -->
                    <fo:block font-family="{$body-font}" font-size="14pt" color="{$text-color}" space-after="15pt" space-before="15pt">
                        <xsl:value-of select="property/description"/>
                    </fo:block>
                    <!-- Features List -->
                    <fo:block font-family="{$header-font}" font-size="16pt" font-weight="bold" color="{$accent-color}" space-before="10pt" space-after="5pt">
                        Exclusive Features:
                    </fo:block>
                    <xsl:for-each select="property/features/feature">
                        <fo:block font-family="{$body-font}" font-size="12pt" color="{$text-color}">
                            • <xsl:value-of select="current()"/>
                        </fo:block>
                    </xsl:for-each>
                    <!-- Price -->
                    <fo:block font-family="{$header-font}" font-size="16pt" font-weight="bold" color="{$border-color}" space-before="10pt">
                        Asking Price: <fo:inline font-family="{$body-font}"><xsl:value-of select="property/price"/></fo:inline>
                    </fo:block>
                    <!-- Images -->
                    <fo:block font-family="{$header-font}" font-size="16pt" font-weight="bold" color="{$accent-color}" space-before="10pt">
                        Property Images:
                    </fo:block>
                    <xsl:for-each select="property/images/image">
                        <fo:block text-align="center" space-after="10pt">
                            <fo:external-graphic src="{.}" content-width="80%" scaling="uniform" width="auto" height="auto"/>
                        </fo:block>
                    </xsl:for-each>
                    <!-- Contact Information -->
                    <fo:block font-family="{$header-font}" font-size="16pt" font-weight="bold" color="{$accent-color}" space-before="10pt">
                        Contact Information:
                    </fo:block>
                    <fo:block font-family="{$body-font}" font-size="12pt" color="{$text-color}">
                        <xsl:value-of select="property/contact/name"/>
                    </fo:block>
                    <fo:block font-family="{$body-font}" font-size="12pt" color="{$text-color}">
                        <xsl:value-of select="property/contact/phone"/>
                    </fo:block>
                    <fo:block font-family="{$body-font}" font-size="12pt" color="{$text-color}">
                        <xsl:value-of select="property/contact/email"/>
                    </fo:block>
                    <fo:block font-family="{$body-font}" font-size="12pt" color="{$text-color}">
                        <xsl:value-of select="property/contact/address"/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

</xsl:stylesheet>
