<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.3.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="con-3m" urn="urn:adsk.eagle:library:119">
<description>&lt;b&gt;3M Connectors&lt;/b&gt;&lt;p&gt;
PCMCIA-CompactFlash Connectors&lt;p&gt;
Zero Insertion Force Socked&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="PAK100/2500-40" urn="urn:adsk.eagle:footprint:5527/1" library_version="1">
<description>&lt;b&gt;3M (TM) Pak 100 4-Wall Header&lt;/b&gt; Straight&lt;p&gt;
Source: 3M</description>
<wire x1="-29.05" y1="4.2" x2="-23.473" y2="4.2" width="0.2032" layer="21"/>
<wire x1="-23.473" y1="4.2" x2="-19.707" y2="4.2" width="0.2032" layer="21"/>
<wire x1="-19.707" y1="4.2" x2="19.707" y2="4.2" width="0.2032" layer="21"/>
<wire x1="19.707" y1="4.2" x2="23.473" y2="4.2" width="0.2032" layer="21"/>
<wire x1="23.473" y1="4.2" x2="29.05" y2="4.2" width="0.2032" layer="21"/>
<wire x1="29.05" y1="4.2" x2="29.05" y2="-4.2" width="0.2032" layer="21"/>
<wire x1="29.05" y1="-4.2" x2="23.718" y2="-4.2" width="0.2032" layer="21"/>
<wire x1="23.718" y1="-4.2" x2="23.718" y2="-3.9" width="0.2032" layer="21"/>
<wire x1="23.718" y1="-3.9" x2="22.239" y2="-3.9" width="0.2032" layer="21"/>
<wire x1="22.239" y1="-3.9" x2="22.239" y2="-4.2" width="0.2032" layer="21"/>
<wire x1="22.239" y1="-4.2" x2="1.883" y2="-4.2" width="0.2032" layer="21"/>
<wire x1="1.883" y1="-4.2" x2="1.883" y2="-2.65" width="0.2032" layer="21"/>
<wire x1="1.883" y1="-2.65" x2="-1.883" y2="-2.65" width="0.2032" layer="21"/>
<wire x1="-1.883" y1="-2.65" x2="-1.883" y2="-4.2" width="0.2032" layer="21"/>
<wire x1="1.883" y1="-4.2" x2="-1.883" y2="-4.2" width="0.2032" layer="21"/>
<wire x1="-1.883" y1="-4.2" x2="-22.002" y2="-4.2" width="0.2032" layer="21"/>
<wire x1="-23.481" y1="-4.2" x2="-29.05" y2="-4.2" width="0.2032" layer="21"/>
<wire x1="-29.05" y1="-4.2" x2="-29.05" y2="4.2" width="0.2032" layer="21"/>
<wire x1="-27.925" y1="3.275" x2="-23.48" y2="3.275" width="0.2032" layer="21"/>
<wire x1="-19.705" y1="3.275" x2="19.705" y2="3.275" width="0.2032" layer="21"/>
<wire x1="23.48" y1="3.275" x2="27.925" y2="3.275" width="0.2032" layer="21"/>
<wire x1="27.925" y1="3.275" x2="27.925" y2="-3.275" width="0.2032" layer="21"/>
<wire x1="27.925" y1="-3.275" x2="1.883" y2="-3.275" width="0.2032" layer="21"/>
<wire x1="-1.883" y1="-3.275" x2="-27.925" y2="-3.275" width="0.2032" layer="21"/>
<wire x1="-27.925" y1="-3.275" x2="-27.925" y2="3.275" width="0.2032" layer="21"/>
<wire x1="-22.002" y1="-4.2" x2="-22.002" y2="-3.9" width="0.2032" layer="21"/>
<wire x1="-22.002" y1="-3.9" x2="-23.481" y2="-3.9" width="0.2032" layer="21"/>
<wire x1="-23.481" y1="-3.9" x2="-23.481" y2="-4.2" width="0.2032" layer="21"/>
<wire x1="-23.473" y1="4.2" x2="-23.473" y2="2.65" width="0.2032" layer="21"/>
<wire x1="-23.473" y1="2.65" x2="-19.707" y2="2.65" width="0.2032" layer="21"/>
<wire x1="-19.707" y1="2.65" x2="-19.707" y2="4.2" width="0.2032" layer="21"/>
<wire x1="19.707" y1="4.2" x2="19.707" y2="2.65" width="0.2032" layer="21"/>
<wire x1="19.707" y1="2.65" x2="23.473" y2="2.65" width="0.2032" layer="21"/>
<wire x1="23.473" y1="2.65" x2="23.473" y2="4.2" width="0.2032" layer="21"/>
<pad name="1" x="-24.13" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="2" x="-24.13" y="1.27" drill="1" diameter="1.4224"/>
<pad name="3" x="-21.59" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="4" x="-21.59" y="1.27" drill="1" diameter="1.4224"/>
<pad name="5" x="-19.05" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="6" x="-19.05" y="1.27" drill="1" diameter="1.4224"/>
<pad name="7" x="-16.51" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="8" x="-16.51" y="1.27" drill="1" diameter="1.4224"/>
<pad name="9" x="-13.97" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="10" x="-13.97" y="1.27" drill="1" diameter="1.4224"/>
<pad name="11" x="-11.43" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="12" x="-11.43" y="1.27" drill="1" diameter="1.4224"/>
<pad name="13" x="-8.89" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="14" x="-8.89" y="1.27" drill="1" diameter="1.4224"/>
<pad name="15" x="-6.35" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="16" x="-6.35" y="1.27" drill="1" diameter="1.4224"/>
<pad name="17" x="-3.81" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="18" x="-3.81" y="1.27" drill="1" diameter="1.4224"/>
<pad name="19" x="-1.27" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="20" x="-1.27" y="1.27" drill="1" diameter="1.4224"/>
<pad name="21" x="1.27" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="22" x="1.27" y="1.27" drill="1" diameter="1.4224"/>
<pad name="23" x="3.81" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="24" x="3.81" y="1.27" drill="1" diameter="1.4224"/>
<pad name="25" x="6.35" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="26" x="6.35" y="1.27" drill="1" diameter="1.4224"/>
<pad name="27" x="8.89" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="28" x="8.89" y="1.27" drill="1" diameter="1.4224"/>
<pad name="29" x="11.43" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="30" x="11.43" y="1.27" drill="1" diameter="1.4224"/>
<pad name="31" x="13.97" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="32" x="13.97" y="1.27" drill="1" diameter="1.4224"/>
<pad name="33" x="16.51" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="34" x="16.51" y="1.27" drill="1" diameter="1.4224"/>
<pad name="35" x="19.05" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="36" x="19.05" y="1.27" drill="1" diameter="1.4224"/>
<pad name="37" x="21.59" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="38" x="21.59" y="1.27" drill="1" diameter="1.4224"/>
<pad name="39" x="24.13" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="40" x="24.13" y="1.27" drill="1" diameter="1.4224"/>
<text x="-29.21" y="4.572" size="1.27" layer="25">&gt;NAME</text>
<text x="-21.59" y="4.572" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="PAK100/2500-5-40" urn="urn:adsk.eagle:footprint:5526/1" library_version="1">
<description>&lt;b&gt;3M (TM) Pak 100 4-Wall Header&lt;/b&gt; Right Angle&lt;p&gt;
Source: 3M</description>
<wire x1="29.05" y1="1.875" x2="29.05" y2="11.075" width="0.2032" layer="21"/>
<wire x1="29.05" y1="11.075" x2="23.718" y2="11.075" width="0.2032" layer="21"/>
<wire x1="22.239" y1="11.075" x2="23.718" y2="11.075" width="0.2032" layer="21"/>
<wire x1="23.718" y1="11.075" x2="23.718" y2="10.105" width="0.2032" layer="21"/>
<wire x1="23.718" y1="10.105" x2="22.239" y2="10.105" width="0.2032" layer="21"/>
<wire x1="22.239" y1="10.105" x2="22.239" y2="11.075" width="0.2032" layer="21"/>
<wire x1="22.239" y1="11.075" x2="1.883" y2="11.075" width="0.2032" layer="21"/>
<wire x1="1.883" y1="11.075" x2="1.883" y2="4.01" width="0.2032" layer="21"/>
<wire x1="1.883" y1="4.01" x2="-1.883" y2="4.01" width="0.2032" layer="21"/>
<wire x1="-1.883" y1="4.01" x2="-1.883" y2="11.075" width="0.2032" layer="21"/>
<wire x1="1.883" y1="11.075" x2="-1.883" y2="11.075" width="0.2032" layer="21"/>
<wire x1="-1.883" y1="11.075" x2="-19.462" y2="11.075" width="0.2032" layer="21"/>
<wire x1="-20.941" y1="11.075" x2="-19.462" y2="11.075" width="0.2032" layer="21"/>
<wire x1="-20.941" y1="11.075" x2="-29.05" y2="11.075" width="0.2032" layer="21"/>
<wire x1="-29.05" y1="11.075" x2="-29.05" y2="1.875" width="0.2032" layer="21"/>
<wire x1="-19.462" y1="11.075" x2="-19.462" y2="10.105" width="0.2032" layer="21"/>
<wire x1="-19.462" y1="10.105" x2="-20.941" y2="10.105" width="0.2032" layer="21"/>
<wire x1="-20.941" y1="10.105" x2="-20.941" y2="11.075" width="0.2032" layer="21"/>
<wire x1="-25.506" y1="1.875" x2="-29.05" y2="1.875" width="0.2032" layer="21"/>
<wire x1="25.489" y1="1.875" x2="-25.502" y2="1.875" width="0.2032" layer="51"/>
<wire x1="29.05" y1="1.875" x2="25.493" y2="1.875" width="0.2032" layer="21"/>
<pad name="1" x="-24.13" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="2" x="-24.13" y="1.27" drill="1" diameter="1.4224"/>
<pad name="3" x="-21.59" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="4" x="-21.59" y="1.27" drill="1" diameter="1.4224"/>
<pad name="5" x="-19.05" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="6" x="-19.05" y="1.27" drill="1" diameter="1.4224"/>
<pad name="7" x="-16.51" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="8" x="-16.51" y="1.27" drill="1" diameter="1.4224"/>
<pad name="9" x="-13.97" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="10" x="-13.97" y="1.27" drill="1" diameter="1.4224"/>
<pad name="11" x="-11.43" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="12" x="-11.43" y="1.27" drill="1" diameter="1.4224"/>
<pad name="13" x="-8.89" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="14" x="-8.89" y="1.27" drill="1" diameter="1.4224"/>
<pad name="15" x="-6.35" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="16" x="-6.35" y="1.27" drill="1" diameter="1.4224"/>
<pad name="17" x="-3.81" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="18" x="-3.81" y="1.27" drill="1" diameter="1.4224"/>
<pad name="19" x="-1.27" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="20" x="-1.27" y="1.27" drill="1" diameter="1.4224"/>
<pad name="21" x="1.27" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="22" x="1.27" y="1.27" drill="1" diameter="1.4224"/>
<pad name="23" x="3.81" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="24" x="3.81" y="1.27" drill="1" diameter="1.4224"/>
<pad name="25" x="6.35" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="26" x="6.35" y="1.27" drill="1" diameter="1.4224"/>
<pad name="27" x="8.89" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="28" x="8.89" y="1.27" drill="1" diameter="1.4224"/>
<pad name="29" x="11.43" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="30" x="11.43" y="1.27" drill="1" diameter="1.4224"/>
<pad name="31" x="13.97" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="32" x="13.97" y="1.27" drill="1" diameter="1.4224"/>
<pad name="33" x="16.51" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="34" x="16.51" y="1.27" drill="1" diameter="1.4224"/>
<pad name="35" x="19.05" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="36" x="19.05" y="1.27" drill="1" diameter="1.4224"/>
<pad name="37" x="21.59" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="38" x="21.59" y="1.27" drill="1" diameter="1.4224"/>
<pad name="39" x="24.13" y="-1.27" drill="1" diameter="1.4224"/>
<pad name="40" x="24.13" y="1.27" drill="1" diameter="1.4224"/>
<text x="-29.21" y="-3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-21.59" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<polygon width="0.2032" layer="21">
<vertex x="-25.41" y="10.945"/>
<vertex x="-22.86" y="10.945"/>
<vertex x="-24.135" y="8.37"/>
</polygon>
</package>
</packages>
<packages3d>
<package3d name="PAK100/2500-40" urn="urn:adsk.eagle:package:5589/1" type="box" library_version="1">
<description>3M (TM) Pak 100 4-Wall Header Straight
Source: 3M</description>
<packageinstances>
<packageinstance name="PAK100/2500-40"/>
</packageinstances>
</package3d>
<package3d name="PAK100/2500-5-40" urn="urn:adsk.eagle:package:5588/1" type="box" library_version="1">
<description>3M (TM) Pak 100 4-Wall Header Right Angle
Source: 3M</description>
<packageinstances>
<packageinstance name="PAK100/2500-5-40"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINV" urn="urn:adsk.eagle:symbol:5508/1" library_version="1">
<text x="-1.27" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<text x="-3.81" y="2.667" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="0" y1="-0.254" x2="2.794" y2="0.254" layer="94"/>
<pin name="KL" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="PIN" urn="urn:adsk.eagle:symbol:5509/1" library_version="1">
<text x="-1.27" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<rectangle x1="0" y1="-0.254" x2="2.794" y2="0.254" layer="94"/>
<pin name="KL" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="2540-" urn="urn:adsk.eagle:component:5620/1" prefix="X" library_version="1">
<description>&lt;b&gt;3M (TM) Pak 100 4-Wall Header&lt;/b&gt;&lt;p&gt;
Source: 3M</description>
<gates>
<gate name="-1" symbol="PINV" x="0" y="0" addlevel="always"/>
<gate name="-2" symbol="PIN" x="0" y="-2.54" addlevel="always"/>
<gate name="-3" symbol="PIN" x="0" y="-5.08" addlevel="always"/>
<gate name="-4" symbol="PIN" x="0" y="-7.62" addlevel="always"/>
<gate name="-5" symbol="PIN" x="0" y="-10.16" addlevel="always"/>
<gate name="-6" symbol="PIN" x="0" y="-12.7" addlevel="always"/>
<gate name="-7" symbol="PIN" x="0" y="-15.24" addlevel="always"/>
<gate name="-8" symbol="PIN" x="0" y="-17.78" addlevel="always"/>
<gate name="-9" symbol="PIN" x="0" y="-20.32" addlevel="always"/>
<gate name="-10" symbol="PIN" x="0" y="-22.86" addlevel="always"/>
<gate name="-11" symbol="PIN" x="0" y="-25.4" addlevel="always"/>
<gate name="-12" symbol="PIN" x="0" y="-27.94" addlevel="always"/>
<gate name="-13" symbol="PIN" x="0" y="-30.48" addlevel="always"/>
<gate name="-14" symbol="PIN" x="0" y="-33.02" addlevel="always"/>
<gate name="-15" symbol="PIN" x="0" y="-35.56" addlevel="always"/>
<gate name="-16" symbol="PIN" x="0" y="-38.1" addlevel="always"/>
<gate name="-17" symbol="PIN" x="0" y="-40.64" addlevel="always"/>
<gate name="-18" symbol="PIN" x="0" y="-43.18" addlevel="always"/>
<gate name="-19" symbol="PIN" x="0" y="-45.72" addlevel="always"/>
<gate name="-20" symbol="PIN" x="0" y="-48.26" addlevel="always"/>
<gate name="-21" symbol="PIN" x="0" y="-50.8" addlevel="always"/>
<gate name="-22" symbol="PIN" x="0" y="-53.34" addlevel="always"/>
<gate name="-23" symbol="PIN" x="0" y="-55.88" addlevel="always"/>
<gate name="-24" symbol="PIN" x="0" y="-58.42" addlevel="always"/>
<gate name="-25" symbol="PIN" x="0" y="-60.96" addlevel="always"/>
<gate name="-26" symbol="PIN" x="0" y="-63.5" addlevel="always"/>
<gate name="-27" symbol="PIN" x="0" y="-66.04" addlevel="always"/>
<gate name="-28" symbol="PIN" x="0" y="-68.58" addlevel="always"/>
<gate name="-29" symbol="PIN" x="0" y="-71.12" addlevel="always"/>
<gate name="-30" symbol="PIN" x="0" y="-73.66" addlevel="always"/>
<gate name="-31" symbol="PIN" x="0" y="-76.2" addlevel="always"/>
<gate name="-32" symbol="PIN" x="0" y="-78.74" addlevel="always"/>
<gate name="-33" symbol="PIN" x="0" y="-81.28" addlevel="always"/>
<gate name="-34" symbol="PIN" x="0" y="-83.82" addlevel="always"/>
<gate name="-35" symbol="PIN" x="0" y="-86.36" addlevel="always"/>
<gate name="-36" symbol="PIN" x="0" y="-88.9" addlevel="always"/>
<gate name="-37" symbol="PIN" x="0" y="-91.44" addlevel="always"/>
<gate name="-38" symbol="PIN" x="0" y="-93.98" addlevel="always"/>
<gate name="-39" symbol="PIN" x="0" y="-96.52" addlevel="always"/>
<gate name="-40" symbol="PIN" x="0" y="-99.06" addlevel="always"/>
</gates>
<devices>
<device name="" package="PAK100/2500-40">
<connects>
<connect gate="-1" pin="KL" pad="1"/>
<connect gate="-10" pin="KL" pad="10"/>
<connect gate="-11" pin="KL" pad="11"/>
<connect gate="-12" pin="KL" pad="12"/>
<connect gate="-13" pin="KL" pad="13"/>
<connect gate="-14" pin="KL" pad="14"/>
<connect gate="-15" pin="KL" pad="15"/>
<connect gate="-16" pin="KL" pad="16"/>
<connect gate="-17" pin="KL" pad="17"/>
<connect gate="-18" pin="KL" pad="18"/>
<connect gate="-19" pin="KL" pad="19"/>
<connect gate="-2" pin="KL" pad="2"/>
<connect gate="-20" pin="KL" pad="20"/>
<connect gate="-21" pin="KL" pad="21"/>
<connect gate="-22" pin="KL" pad="22"/>
<connect gate="-23" pin="KL" pad="23"/>
<connect gate="-24" pin="KL" pad="24"/>
<connect gate="-25" pin="KL" pad="25"/>
<connect gate="-26" pin="KL" pad="26"/>
<connect gate="-27" pin="KL" pad="27"/>
<connect gate="-28" pin="KL" pad="28"/>
<connect gate="-29" pin="KL" pad="29"/>
<connect gate="-3" pin="KL" pad="3"/>
<connect gate="-30" pin="KL" pad="30"/>
<connect gate="-31" pin="KL" pad="31"/>
<connect gate="-32" pin="KL" pad="32"/>
<connect gate="-33" pin="KL" pad="33"/>
<connect gate="-34" pin="KL" pad="34"/>
<connect gate="-35" pin="KL" pad="35"/>
<connect gate="-36" pin="KL" pad="36"/>
<connect gate="-37" pin="KL" pad="37"/>
<connect gate="-38" pin="KL" pad="38"/>
<connect gate="-39" pin="KL" pad="39"/>
<connect gate="-4" pin="KL" pad="4"/>
<connect gate="-40" pin="KL" pad="40"/>
<connect gate="-5" pin="KL" pad="5"/>
<connect gate="-6" pin="KL" pad="6"/>
<connect gate="-7" pin="KL" pad="7"/>
<connect gate="-8" pin="KL" pad="8"/>
<connect gate="-9" pin="KL" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5589/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="5" package="PAK100/2500-5-40">
<connects>
<connect gate="-1" pin="KL" pad="1"/>
<connect gate="-10" pin="KL" pad="10"/>
<connect gate="-11" pin="KL" pad="11"/>
<connect gate="-12" pin="KL" pad="12"/>
<connect gate="-13" pin="KL" pad="13"/>
<connect gate="-14" pin="KL" pad="14"/>
<connect gate="-15" pin="KL" pad="15"/>
<connect gate="-16" pin="KL" pad="16"/>
<connect gate="-17" pin="KL" pad="17"/>
<connect gate="-18" pin="KL" pad="18"/>
<connect gate="-19" pin="KL" pad="19"/>
<connect gate="-2" pin="KL" pad="2"/>
<connect gate="-20" pin="KL" pad="20"/>
<connect gate="-21" pin="KL" pad="21"/>
<connect gate="-22" pin="KL" pad="22"/>
<connect gate="-23" pin="KL" pad="23"/>
<connect gate="-24" pin="KL" pad="24"/>
<connect gate="-25" pin="KL" pad="25"/>
<connect gate="-26" pin="KL" pad="26"/>
<connect gate="-27" pin="KL" pad="27"/>
<connect gate="-28" pin="KL" pad="28"/>
<connect gate="-29" pin="KL" pad="29"/>
<connect gate="-3" pin="KL" pad="3"/>
<connect gate="-30" pin="KL" pad="30"/>
<connect gate="-31" pin="KL" pad="31"/>
<connect gate="-32" pin="KL" pad="32"/>
<connect gate="-33" pin="KL" pad="33"/>
<connect gate="-34" pin="KL" pad="34"/>
<connect gate="-35" pin="KL" pad="35"/>
<connect gate="-36" pin="KL" pad="36"/>
<connect gate="-37" pin="KL" pad="37"/>
<connect gate="-38" pin="KL" pad="38"/>
<connect gate="-39" pin="KL" pad="39"/>
<connect gate="-4" pin="KL" pad="4"/>
<connect gate="-40" pin="KL" pad="40"/>
<connect gate="-5" pin="KL" pad="5"/>
<connect gate="-6" pin="KL" pad="6"/>
<connect gate="-7" pin="KL" pad="7"/>
<connect gate="-8" pin="KL" pad="8"/>
<connect gate="-9" pin="KL" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5588/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="9838414" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-lstb" urn="urn:adsk.eagle:library:162">
<description>&lt;b&gt;Pin Headers&lt;/b&gt;&lt;p&gt;
Naming:&lt;p&gt;
MA = male&lt;p&gt;
# contacts - # rows&lt;p&gt;
W = angled&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="MA08-1" urn="urn:adsk.eagle:footprint:8294/1" library_version="1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-9.525" y1="1.27" x2="-8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-0.635" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.27" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="1.27" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-0.635" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-1.27" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-10.16" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-9.398" y="-2.921" size="1.27" layer="21" ratio="10">1</text>
<text x="8.255" y="1.651" size="1.27" layer="21" ratio="10">8</text>
<text x="-1.27" y="-2.921" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="-9.144" y1="-0.254" x2="-8.636" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
<rectangle x1="8.636" y1="-0.254" x2="9.144" y2="0.254" layer="51"/>
</package>
<package name="MA09-1" urn="urn:adsk.eagle:footprint:8298/1" library_version="1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-10.795" y1="1.27" x2="-9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-0.635" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="0.635" x2="-8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-0.635" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.27" x2="-8.89" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="0.635" x2="-11.43" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="1.27" x2="-11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-0.635" x2="-10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-1.27" x2="-10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-0.635" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-1.27" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="1.27" x2="10.795" y2="1.27" width="0.1524" layer="21"/>
<wire x1="10.795" y1="1.27" x2="11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="11.43" y1="-0.635" x2="10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="1.27" x2="8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-0.635" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-1.27" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="11.43" y1="0.635" x2="11.43" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-10.16" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-7.62" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="7.62" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="9" x="10.16" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-11.43" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-10.668" y="-2.921" size="1.27" layer="21" ratio="10">1</text>
<text x="9.652" y="1.651" size="1.27" layer="21" ratio="10">9</text>
<text x="0" y="-2.921" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-7.874" y1="-0.254" x2="-7.366" y2="0.254" layer="51"/>
<rectangle x1="-10.414" y1="-0.254" x2="-9.906" y2="0.254" layer="51"/>
<rectangle x1="-5.334" y1="-0.254" x2="-4.826" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
<rectangle x1="9.906" y1="-0.254" x2="10.414" y2="0.254" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="MA08-1" urn="urn:adsk.eagle:package:8343/1" type="box" library_version="1">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="MA08-1"/>
</packageinstances>
</package3d>
<package3d name="MA09-1" urn="urn:adsk.eagle:package:8350/1" type="box" library_version="1">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="MA09-1"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="MA08-1" urn="urn:adsk.eagle:symbol:8293/1" library_version="1">
<wire x1="3.81" y1="-10.16" x2="-1.27" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="2.54" y2="-5.08" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="2.54" y2="-7.62" width="0.6096" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="10.16" x2="2.54" y2="10.16" width="0.6096" layer="94"/>
<wire x1="1.27" y1="7.62" x2="2.54" y2="7.62" width="0.6096" layer="94"/>
<wire x1="1.27" y1="5.08" x2="2.54" y2="5.08" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="12.7" x2="-1.27" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-10.16" x2="3.81" y2="12.7" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="12.7" x2="3.81" y2="12.7" width="0.4064" layer="94"/>
<text x="-1.27" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<text x="-1.27" y="13.462" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="7.62" y="-7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="3" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="5" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="6" x="7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="7" x="7.62" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="8" x="7.62" y="10.16" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="MA09-1" urn="urn:adsk.eagle:symbol:8297/1" library_version="1">
<wire x1="3.81" y1="-12.7" x2="-1.27" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="2.54" y2="-5.08" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="2.54" y2="-7.62" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-10.16" x2="2.54" y2="-10.16" width="0.6096" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="7.62" x2="2.54" y2="7.62" width="0.6096" layer="94"/>
<wire x1="1.27" y1="5.08" x2="2.54" y2="5.08" width="0.6096" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="10.16" x2="2.54" y2="10.16" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="12.7" x2="-1.27" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-12.7" x2="3.81" y2="12.7" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="12.7" x2="3.81" y2="12.7" width="0.4064" layer="94"/>
<text x="-1.27" y="-15.24" size="1.778" layer="96">&gt;VALUE</text>
<text x="-1.27" y="13.462" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="7.62" y="-10.16" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="7.62" y="-7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="3" x="7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="5" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="6" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="7" x="7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="8" x="7.62" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="9" x="7.62" y="10.16" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MA08-1" urn="urn:adsk.eagle:component:8385/1" prefix="SV" uservalue="yes" library_version="1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="MA08-1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MA08-1">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
<connect gate="1" pin="4" pad="4"/>
<connect gate="1" pin="5" pad="5"/>
<connect gate="1" pin="6" pad="6"/>
<connect gate="1" pin="7" pad="7"/>
<connect gate="1" pin="8" pad="8"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:8343/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MA09-1" urn="urn:adsk.eagle:component:8396/1" prefix="SV" uservalue="yes" library_version="1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="MA09-1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MA09-1">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
<connect gate="1" pin="4" pad="4"/>
<connect gate="1" pin="5" pad="5"/>
<connect gate="1" pin="6" pad="6"/>
<connect gate="1" pin="7" pad="7"/>
<connect gate="1" pin="8" pad="8"/>
<connect gate="1" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:8350/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="RPI" library="con-3m" library_urn="urn:adsk.eagle:library:119" deviceset="2540-" device="" package3d_urn="urn:adsk.eagle:package:5589/1"/>
<part name="RFID" library="con-lstb" library_urn="urn:adsk.eagle:library:162" deviceset="MA08-1" device="" package3d_urn="urn:adsk.eagle:package:8343/1"/>
<part name="LCD" library="con-lstb" library_urn="urn:adsk.eagle:library:162" deviceset="MA09-1" device="" package3d_urn="urn:adsk.eagle:package:8350/1"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="RPI" gate="-1" x="0" y="93.98" smashed="yes">
<attribute name="NAME" x="-1.27" y="94.869" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="-3.81" y="96.647" size="1.778" layer="96"/>
</instance>
<instance part="RPI" gate="-2" x="0" y="91.44" smashed="yes">
<attribute name="NAME" x="-1.27" y="92.329" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-3" x="0" y="88.9" smashed="yes">
<attribute name="NAME" x="-1.27" y="89.789" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-4" x="0" y="86.36" smashed="yes">
<attribute name="NAME" x="-1.27" y="87.249" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-5" x="0" y="83.82" smashed="yes">
<attribute name="NAME" x="-1.27" y="84.709" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-6" x="0" y="81.28" smashed="yes">
<attribute name="NAME" x="-1.27" y="82.169" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-7" x="0" y="78.74" smashed="yes">
<attribute name="NAME" x="-1.27" y="79.629" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-8" x="0" y="76.2" smashed="yes">
<attribute name="NAME" x="-1.27" y="77.089" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-9" x="0" y="73.66" smashed="yes">
<attribute name="NAME" x="-1.27" y="74.549" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-10" x="0" y="71.12" smashed="yes">
<attribute name="NAME" x="-1.27" y="72.009" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-11" x="0" y="68.58" smashed="yes">
<attribute name="NAME" x="-1.27" y="69.469" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-12" x="0" y="66.04" smashed="yes">
<attribute name="NAME" x="-1.27" y="66.929" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-13" x="0" y="63.5" smashed="yes">
<attribute name="NAME" x="-1.27" y="64.389" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-14" x="0" y="60.96" smashed="yes">
<attribute name="NAME" x="-1.27" y="61.849" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-15" x="0" y="58.42" smashed="yes">
<attribute name="NAME" x="-1.27" y="59.309" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-16" x="0" y="55.88" smashed="yes">
<attribute name="NAME" x="-1.27" y="56.769" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-17" x="0" y="53.34" smashed="yes">
<attribute name="NAME" x="-1.27" y="54.229" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-18" x="0" y="50.8" smashed="yes">
<attribute name="NAME" x="-1.27" y="51.689" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-19" x="0" y="48.26" smashed="yes">
<attribute name="NAME" x="-1.27" y="49.149" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-20" x="0" y="45.72" smashed="yes">
<attribute name="NAME" x="-1.27" y="46.609" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-21" x="0" y="43.18" smashed="yes">
<attribute name="NAME" x="-1.27" y="44.069" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-22" x="0" y="40.64" smashed="yes">
<attribute name="NAME" x="-1.27" y="41.529" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-23" x="0" y="38.1" smashed="yes">
<attribute name="NAME" x="-1.27" y="38.989" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-24" x="0" y="35.56" smashed="yes">
<attribute name="NAME" x="-1.27" y="36.449" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-25" x="0" y="33.02" smashed="yes">
<attribute name="NAME" x="-1.27" y="33.909" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-26" x="0" y="30.48" smashed="yes">
<attribute name="NAME" x="-1.27" y="31.369" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-27" x="0" y="27.94" smashed="yes">
<attribute name="NAME" x="-1.27" y="28.829" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-28" x="0" y="25.4" smashed="yes">
<attribute name="NAME" x="-1.27" y="26.289" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-29" x="0" y="22.86" smashed="yes">
<attribute name="NAME" x="-1.27" y="23.749" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-30" x="0" y="20.32" smashed="yes">
<attribute name="NAME" x="-1.27" y="21.209" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-31" x="0" y="17.78" smashed="yes">
<attribute name="NAME" x="-1.27" y="18.669" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-32" x="0" y="15.24" smashed="yes">
<attribute name="NAME" x="-1.27" y="16.129" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-33" x="0" y="12.7" smashed="yes">
<attribute name="NAME" x="-1.27" y="13.589" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-34" x="0" y="10.16" smashed="yes">
<attribute name="NAME" x="-1.27" y="11.049" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-35" x="0" y="7.62" smashed="yes">
<attribute name="NAME" x="-1.27" y="8.509" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-36" x="0" y="5.08" smashed="yes">
<attribute name="NAME" x="-1.27" y="5.969" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-37" x="0" y="2.54" smashed="yes">
<attribute name="NAME" x="-1.27" y="3.429" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-38" x="0" y="0" smashed="yes">
<attribute name="NAME" x="-1.27" y="0.889" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-39" x="0" y="-2.54" smashed="yes">
<attribute name="NAME" x="-1.27" y="-1.651" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RPI" gate="-40" x="0" y="-5.08" smashed="yes">
<attribute name="NAME" x="-1.27" y="-4.191" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="RFID" gate="1" x="60.96" y="86.36" smashed="yes" rot="R180">
<attribute name="VALUE" x="62.23" y="99.06" size="1.778" layer="96" rot="R180"/>
<attribute name="NAME" x="62.23" y="72.898" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="LCD" gate="1" x="60.96" y="43.18" smashed="yes" rot="R180">
<attribute name="VALUE" x="62.23" y="58.42" size="1.778" layer="96" rot="R180"/>
<attribute name="NAME" x="62.23" y="29.718" size="1.778" layer="95" rot="R180"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="3.3V" class="0">
<segment>
<pinref part="RPI" gate="-1" pin="KL"/>
<pinref part="RFID" gate="1" pin="1"/>
<wire x1="5.08" y1="93.98" x2="53.34" y2="93.98" width="0.1524" layer="91"/>
<wire x1="5.08" y1="93.98" x2="27.94" y2="93.98" width="0.1524" layer="91"/>
<wire x1="27.94" y1="93.98" x2="27.94" y2="53.34" width="0.1524" layer="91"/>
<junction x="5.08" y="93.98"/>
<pinref part="LCD" gate="1" pin="1"/>
<wire x1="27.94" y1="53.34" x2="53.34" y2="53.34" width="0.1524" layer="91"/>
<label x="12.7" y="93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPI0_MOSI" class="0">
<segment>
<pinref part="RPI" gate="-19" pin="KL"/>
<wire x1="5.08" y1="48.26" x2="27.94" y2="48.26" width="0.1524" layer="91"/>
<wire x1="27.94" y1="48.26" x2="27.94" y2="40.64" width="0.1524" layer="91"/>
<pinref part="LCD" gate="1" pin="6"/>
<wire x1="27.94" y1="40.64" x2="53.34" y2="40.64" width="0.1524" layer="91"/>
<label x="12.7" y="48.26" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPI0_MISO" class="0">
<segment>
<pinref part="RPI" gate="-21" pin="KL"/>
<wire x1="5.08" y1="43.18" x2="25.4" y2="43.18" width="0.1524" layer="91"/>
<wire x1="25.4" y1="43.18" x2="25.4" y2="33.02" width="0.1524" layer="91"/>
<pinref part="LCD" gate="1" pin="9"/>
<wire x1="25.4" y1="33.02" x2="53.34" y2="33.02" width="0.1524" layer="91"/>
<label x="12.7" y="43.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPI0_SCK" class="0">
<segment>
<pinref part="RPI" gate="-23" pin="KL"/>
<pinref part="LCD" gate="1" pin="7"/>
<wire x1="5.08" y1="38.1" x2="53.34" y2="38.1" width="0.1524" layer="91"/>
<label x="12.7" y="38.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="RPI" gate="-39" pin="KL"/>
<wire x1="5.08" y1="-2.54" x2="30.48" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="RFID" gate="1" pin="3"/>
<wire x1="30.48" y1="-2.54" x2="30.48" y2="50.8" width="0.1524" layer="91"/>
<wire x1="30.48" y1="50.8" x2="30.48" y2="88.9" width="0.1524" layer="91"/>
<wire x1="30.48" y1="88.9" x2="53.34" y2="88.9" width="0.1524" layer="91"/>
<pinref part="LCD" gate="1" pin="2"/>
<wire x1="30.48" y1="50.8" x2="53.34" y2="50.8" width="0.1524" layer="91"/>
<junction x="30.48" y="50.8"/>
<label x="12.7" y="-2.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPI0_CS" class="0">
<segment>
<pinref part="RPI" gate="-24" pin="KL"/>
<wire x1="5.08" y1="35.56" x2="33.02" y2="35.56" width="0.1524" layer="91"/>
<wire x1="33.02" y1="35.56" x2="33.02" y2="48.26" width="0.1524" layer="91"/>
<label x="12.7" y="35.56" size="1.778" layer="95"/>
<pinref part="LCD" gate="1" pin="3"/>
<wire x1="33.02" y1="48.26" x2="53.34" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SPI0_RESET" class="0">
<segment>
<pinref part="RPI" gate="-22" pin="KL"/>
<wire x1="5.08" y1="40.64" x2="10.16" y2="40.64" width="0.1524" layer="91"/>
<wire x1="10.16" y1="40.64" x2="10.16" y2="30.48" width="0.1524" layer="91"/>
<wire x1="10.16" y1="30.48" x2="35.56" y2="30.48" width="0.1524" layer="91"/>
<wire x1="35.56" y1="30.48" x2="35.56" y2="45.72" width="0.1524" layer="91"/>
<pinref part="LCD" gate="1" pin="4"/>
<wire x1="35.56" y1="45.72" x2="53.34" y2="45.72" width="0.1524" layer="91"/>
<label x="12.7" y="30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPI0_DC_RS" class="0">
<segment>
<pinref part="RPI" gate="-18" pin="KL"/>
<wire x1="5.08" y1="50.8" x2="25.4" y2="50.8" width="0.1524" layer="91"/>
<wire x1="25.4" y1="50.8" x2="25.4" y2="55.88" width="0.1524" layer="91"/>
<wire x1="25.4" y1="55.88" x2="38.1" y2="55.88" width="0.1524" layer="91"/>
<wire x1="38.1" y1="55.88" x2="38.1" y2="43.18" width="0.1524" layer="91"/>
<pinref part="LCD" gate="1" pin="5"/>
<wire x1="38.1" y1="43.18" x2="53.34" y2="43.18" width="0.1524" layer="91"/>
<label x="12.7" y="50.8" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPI0_LED" class="0">
<segment>
<pinref part="RPI" gate="-16" pin="KL"/>
<wire x1="5.08" y1="55.88" x2="22.86" y2="55.88" width="0.1524" layer="91"/>
<wire x1="22.86" y1="55.88" x2="22.86" y2="58.42" width="0.1524" layer="91"/>
<wire x1="22.86" y1="58.42" x2="40.64" y2="58.42" width="0.1524" layer="91"/>
<wire x1="40.64" y1="58.42" x2="40.64" y2="35.56" width="0.1524" layer="91"/>
<pinref part="LCD" gate="1" pin="8"/>
<wire x1="40.64" y1="35.56" x2="53.34" y2="35.56" width="0.1524" layer="91"/>
<label x="12.7" y="55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPI1_RST" class="0">
<segment>
<pinref part="RPI" gate="-36" pin="KL"/>
<wire x1="5.08" y1="5.08" x2="43.18" y2="5.08" width="0.1524" layer="91"/>
<wire x1="43.18" y1="5.08" x2="43.18" y2="91.44" width="0.1524" layer="91"/>
<pinref part="RFID" gate="1" pin="2"/>
<wire x1="43.18" y1="91.44" x2="53.34" y2="91.44" width="0.1524" layer="91"/>
<label x="12.7" y="5.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPI1_MISO" class="0">
<segment>
<pinref part="RPI" gate="-35" pin="KL"/>
<wire x1="5.08" y1="7.62" x2="45.72" y2="7.62" width="0.1524" layer="91"/>
<wire x1="45.72" y1="7.62" x2="45.72" y2="83.82" width="0.1524" layer="91"/>
<pinref part="RFID" gate="1" pin="5"/>
<wire x1="45.72" y1="83.82" x2="53.34" y2="83.82" width="0.1524" layer="91"/>
<label x="12.7" y="7.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPI1_MOSI" class="0">
<segment>
<pinref part="RPI" gate="-38" pin="KL"/>
<wire x1="5.08" y1="0" x2="48.26" y2="0" width="0.1524" layer="91"/>
<wire x1="48.26" y1="0" x2="48.26" y2="81.28" width="0.1524" layer="91"/>
<pinref part="RFID" gate="1" pin="6"/>
<wire x1="48.26" y1="81.28" x2="53.34" y2="81.28" width="0.1524" layer="91"/>
<label x="12.7" y="0" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPI1_SCK" class="0">
<segment>
<pinref part="RPI" gate="-40" pin="KL"/>
<wire x1="5.08" y1="-5.08" x2="50.8" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="50.8" y1="-5.08" x2="50.8" y2="78.74" width="0.1524" layer="91"/>
<pinref part="RFID" gate="1" pin="7"/>
<wire x1="50.8" y1="78.74" x2="53.34" y2="78.74" width="0.1524" layer="91"/>
<label x="12.7" y="-5.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPI1_CS" class="0">
<segment>
<pinref part="RPI" gate="-12" pin="KL"/>
<wire x1="5.08" y1="66.04" x2="53.34" y2="66.04" width="0.1524" layer="91"/>
<pinref part="RFID" gate="1" pin="8"/>
<wire x1="53.34" y1="66.04" x2="53.34" y2="76.2" width="0.1524" layer="91"/>
<label x="12.7" y="66.04" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
