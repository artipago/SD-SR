function reducingImage(imageStruct,stmColor,bkgColor)


for ii=1:size(imageStruct,2)
    figure
    tempImage=imageStruct(ii).image;
    subplot(1,2,1)
    imshow(tempImage)
    tempImageOriginal=tempImage;
    
    tempImage(tempImage==stmColor)=1;
    tempImage(tempImage==bkgColor)=0;
    
    tempImageFiltered=movingAverageImage(tempImage,7);
    
%     tempImageFiltered(tempImageFiltered~=1)=0;
    tempImageFiltered=floor(tempImageFiltered);
    tempImageFiltered(tempImageFiltered==0)=bkgColor;
    tempImageFiltered(tempImageFiltered==1)=stmColor;
    
    tempImageFiltered=uint8(tempImageFiltered);
    subplot(1,2,2)
    imshow(tempImageFiltered)
    
    de=1;
end

de=1

end

function tempImageFiltered=movingAverageImage(tempImage,sizeWindow)

    tempImage=double(tempImage);
    tempImage=[NaN*ones(size(tempImage,1),sizeWindow) tempImage];
    tempImage=[tempImage NaN*ones(size(tempImage,1),sizeWindow)];
    
    tempImage=[NaN*ones(sizeWindow,size(tempImage,2)); tempImage];
    tempImage=[tempImage; NaN*ones(sizeWindow,size(tempImage,2))];
    
    tempImageFiltered=zeros(size(tempImage));
    
    for rr=1:size(tempImage,1)-sizeWindow
        for cc=1:size(tempImage,2)-sizeWindow
            tempImageFiltered(rr,cc)=nanmean(nanmean(tempImage(rr:rr+sizeWindow-1,cc:cc+sizeWindow-1)));
        end
    end

    tempImageFiltered(1:sizeWindow,:)=[];
    tempImageFiltered(end-sizeWindow+1:end,:)=[];
    tempImageFiltered(:,1:sizeWindow)=[];
    tempImageFiltered(:,end-sizeWindow+1:end)=[];
    
    
end





