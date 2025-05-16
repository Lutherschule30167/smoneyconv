#needs column.sh

for x in *.txt; do
        enscript -B -1r "$x" -p "$x".ps
done
for ps in *.ps; do
        ps2pdf "$ps" "$ps".pdf
done
for f in *txt.ps.pdf; do
   mv -- "$f" "${f%.txt.ps.pdf}.pdf"
done
rm *.txt.ps
rm *.txt               
