fprintf('Incarcam imaginile din director \n');

numeFolderImagini = 'TEZAVERZA';
numeDirector = [pwd '\' numeFolderImagini '\'];
tipImagine = 'jpg';
intensitate = 75;

filelist = dir([numeDirector '*.' tipImagine]);

for idxImg = 1:length(filelist)
        clc
        fprintf(['Imaginea ' num2str(idxImg) ' din ' num2str(length(filelist)) ' ... \n']);
        imgName = filelist(idxImg).name;
        image = imread([numeDirector imgName]);

        image(:,:,:) = image(:,:,:) + intensitate;

        imwrite(image,imgName);
end
