# ----------------------------------------------------------------------------
# Die Ausgabe von 'yarn version:pkg:full' wird in TS/JS-Code umgewandelt.
#
#     const checkVersion = '0.2.24'; // @mmit/check
#     const latlongVersion = '0.2.8'; // @mmit/latlong
#     ...
#
# Sieht auf der cmdline so aus:
#     yarn version:pkg:full | awk '{ package=$1; gsub(":","",package); gsub("@mmit/","",$1); gsub(":","",$1); print "const "$1"Version =" " " "'\''" $2 "'\''" "; // " package }'
# ----------------------------------------------------------------------------

{
    package = $1;

    gsub(":","",package);
    gsub("@mmit/","",$1);
    gsub(":","",$1);

    # print "const "$1"Version =" " " "'" $2 "'" "; // yarn add " package "@" $2
    print "constraints[\"" package "\"] = '" $2 "' // yarn add " package "@" $2

}