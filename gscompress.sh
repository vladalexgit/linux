if [[ $# -ne 3 ]] ; then
    echo "Usage: $0 infile.pdf outfile.pdf resolution"
    exit 1
fi

gs -q -dNOPAUSE -dBATCH -dSAFER          \
    -sDEVICE=pdfwrite                    \
    -dCompatibilityLevel=1.3             \
    -dPDFSETTINGS=/screen                \
    -dEmbedAllFonts=true                 \
    -dSubsetFonts=true                   \
    -dAutoRotatePages=/None              \
    -dColorImageDownsampleType=/Bicubic  \
    -dColorImageResolution=$3            \
    -dGrayImageDownsampleType=/Bicubic   \
    -dGrayImageResolution=$3             \
    -dMonoImageDownsampleType=/Subsample \
    -dMonoImageResolution=$3             \
    -sOutputFile="$2"                    \
    "$1"

echo "--- Finished ---"
echo "Initial size: "
du -h "$1"
echo "Compressed size: "
du -h "$2"
