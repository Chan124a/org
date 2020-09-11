OpenCV

# cvtColor()

`dst=cv.cvtColor(src, code[, dst[, dstCn]])`

Converts an image from one color space to another.

###### [官网](https://docs.opencv.org/master/d8/d01/group__imgproc__color__conversions.html#ga397ae87e1288a81d2363b61574eb8cab)

# imread()

`retval=cv.imread(filename[, flags])`

Loads an image from a file.The function imread loads an image from the specified file and returns it. If the image cannot be read (because of missing file, improper permissions, unsupported or invalid format), the function returns an empty matrix ( [Mat::data](https://docs.opencv.org/master/d3/d63/classcv_1_1Mat.html#a4d33bed1c850265370d2af0ff02e1564)==NULL ).

## 支持的文件格式

- Windows bitmaps - *.bmp, *.dib (always supported)
- JPEG files - *.jpeg, *.jpg, *.jpe (see the *Note* section)
- JPEG 2000 files - *.jp2 (see the *Note* section)
- Portable Network Graphics - *.png (see the *Note* section)
- WebP - *.webp (see the *Note* section)
- Portable image format - *.pbm, *.pgm, *.ppm *.pxm, *.pnm (always supported)
- PFM files - *.pfm (see the *Note* section)
- Sun rasters - *.sr, *.ras (always supported)
- TIFF files - *.tiff, *.tif (see the *Note* section)
- OpenEXR Image files - *.exr (see the *Note* section)
- Radiance HDR - *.hdr, *.pic (always supported)
- Raster and Vector geospatial data supported by GDAL (see the *Note* section)

## 使用注意

- The function determines the type of an image by the content, not by the file extension.
- In the case of color images, the decoded images will have the channels stored in **B G R** order.

[官网手册](https://docs.opencv.org/master/d4/da8/group__imgcodecs.html#ga288b8b3da0892bd651fce07b3bbd3a56)