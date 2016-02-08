curl -L https://raw.githubusercontent.com/MGEScan/mgescan/master/one-liner/ubuntu | bash
source ~/.mgescanrc

cd $HOME
mkdir ~/accuracy
cd accuracy
mkdir dm3
cd dm3
wget ftp://ftp.fruitfly.org/pub/download/compressed/na_whole-genome_genomic_dmel_RELEASE3.FASTA.gz
gzip -d na_whole-genome_genomic_dmel_RELEASE3.FASTA.gz
python ~/mgescan3/mgescan/mgescan/split.py na_whole-genome_genomic_dmel_RELEASE3.FASTA
rm split-output/gadfly*
cd ~/accuracy
mkdir dm3-chr-only
mv dm3/split-output/* dm3-chr-only/
mkdir c_elegans
cd c_elegans
wget ftp://ftp.wormbase.org/pub/wormbase/species/c_elegans/sequence/genomic/c_elegans.PRJNA13758.WS251.genomic.fa.gz
gzip -d c_elegans.PRJNA13758.WS251.genomic.fa.gz
cd ~/accuracy
mkdir a_thaliana
cd a_thaliana
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF_000001735.3_TAIR10/GCF_000001735.3_TAIR10_genomic.fna.gz
gzip -d GCF_000001735.3_TAIR10_genomic.fna.gz

sudo apt-get install hmmer2 -y
sudo apt-get install openmpi-bin -y
sudo apt-get install libopenmpi-dev -y

source ~/.mgescanrc
cd $MGESCAN_SRC
python setup.py install
