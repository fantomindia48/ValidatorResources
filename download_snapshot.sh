#Pre-requisites install axel and pigz
#sudo apt install axel
#sudo apt install pigz

URL=https://snapshot.fantom.network/files/pruned/snapshot-16-Sep-2023-20-54/
url=https://snapshot.fantom.network/files/pruned/
wget ${URL}/listtgzfiles.txt;
for f in `cat listtgzfiles.txt`;
do
echo $f;
echo "downloading: ${url}/$f";
axel -n 32 "${url}/$f";
file=`ls *.tgz`;
echo "untar";
tar --use-compress-program="pigz -d" -xvf ${file};
echo "remove file ${file}";
rm ${file};
done
