function [imageStruct]=creatingTheImageStruct(stmColor,bkgColor,scalingFactor)

%consider rescaling to have same size everyzhere yo

[imageStructTemp(1).image,b,c]=imread('E:\can\artVis\hexominoes\A06.png');
[imageStructTemp(2).image,b,c]=imread('E:\can\artVis\hexominoes\C06.png');
[imageStructTemp(3).image,b,c]=imread('E:\can\artVis\hexominoes\D06.png');
[imageStructTemp(4).image,b,c]=imread('E:\can\artVis\hexominoes\E06.png');
[imageStructTemp(5).image,b,c]=imread('E:\can\artVis\hexominoes\F06.png');
[imageStructTemp(6).image,b,c]=imread('E:\can\artVis\hexominoes\F16.png');
[imageStructTemp(7).image,b,c]=imread('E:\can\artVis\hexominoes\F26.png');
[imageStructTemp(8).image,b,c]=imread('E:\can\artVis\hexominoes\F36.png');
[imageStructTemp(9).image,b,c]=imread('E:\can\artVis\hexominoes\G06.png');
[imageStructTemp(10).image,b,c]=imread('E:\can\artVis\hexominoes\H06.png');
[imageStructTemp(11).image,b,c]=imread('E:\can\artVis\hexominoes\I06.png');
[imageStructTemp(12).image,b,c]=imread('E:\can\artVis\hexominoes\J06.png');
[imageStructTemp(13).image,b,c]=imread('E:\can\artVis\hexominoes\K06.png');
[imageStructTemp(14).image,b,c]=imread('E:\can\artVis\hexominoes\L06.png');
[imageStructTemp(15).image,b,c]=imread('E:\can\artVis\hexominoes\M06.png');
[imageStructTemp(16).image,b,c]=imread('E:\can\artVis\hexominoes\N06.png');
[imageStructTemp(17).image,b,c]=imread('E:\can\artVis\hexominoes\N16.png');
[imageStructTemp(18).image,b,c]=imread('E:\can\artVis\hexominoes\O06.png');
[imageStructTemp(19).image,b,c]=imread('E:\can\artVis\hexominoes\P06.png');
[imageStructTemp(20).image,b,c]=imread('E:\can\artVis\hexominoes\Q06.png');
[imageStructTemp(21).image,b,c]=imread('E:\can\artVis\hexominoes\R06.png');
[imageStructTemp(22).image,b,c]=imread('E:\can\artVis\hexominoes\S06.png');
[imageStructTemp(23).image,b,c]=imread('E:\can\artVis\hexominoes\T06.png');
[imageStructTemp(24).image,b,c]=imread('E:\can\artVis\hexominoes\T16.png');
[imageStructTemp(25).image,b,c]=imread('E:\can\artVis\hexominoes\U06.png');
[imageStructTemp(26).image,b,c]=imread('E:\can\artVis\hexominoes\V06.png');
[imageStructTemp(27).image,b,c]=imread('E:\can\artVis\hexominoes\W06.png');
[imageStructTemp(28).image,b,c]=imread('E:\can\artVis\hexominoes\W16.png');
[imageStructTemp(29).image,b,c]=imread('E:\can\artVis\hexominoes\W26.png');
[imageStructTemp(30).image,b,c]=imread('E:\can\artVis\hexominoes\X06.png');
[imageStructTemp(31).image,b,c]=imread('E:\can\artVis\hexominoes\X16.png');
[imageStructTemp(32).image,b,c]=imread('E:\can\artVis\hexominoes\Y06.png');
[imageStructTemp(33).image,b,c]=imread('E:\can\artVis\hexominoes\Y16.png');
[imageStructTemp(34).image,b,c]=imread('E:\can\artVis\hexominoes\Z06.png');
[imageStructTemp(35).image,b,c]=imread('E:\can\artVis\hexominoes\Z16.png');

for ii=1:size(imageStructTemp,2)
    tempImage=imageStructTemp(ii).image(:,:,1);
    tempImage(tempImage==0)=stmColor;
    tempImage(tempImage==255)=bkgColor;
    tempImage2 = imresize(tempImage, scalingFactor);
    imageStruct(ii).image=tempImage2;
end




