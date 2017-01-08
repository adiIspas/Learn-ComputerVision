fprintf('Incarcam imaginile din director \n');

numeFolderImagini = 'imagini';
numeDirector = [pwd '\' numeFolderImagini '\'];
tipImagine = 'jpg';

filelist = dir([numeDirector '*.' tipImagine]);

for idxImg = 1:length(filelist)
        clc
        fprintf(['Imaginea ' num2str(idxImg) ' din ' num2str(length(filelist)) ' ... \n']);
        imgName = filelist(idxImg).name;
        image = imread([numeDirector imgName]);

        inaltime = size(image,1);
        latime = size(image,2);

        if inaltime > latime
          inaltimeNoua = 300;
          latimeNoua = uint32(inaltime/latime * inaltimeNoua);
        else
          latimeNoua = 300;
          inaltimeNoua = uint32(latime/inaltime * latimeNoua);
        end

        fullFileName = fullfile('imaginiRedimensionate/', imgName);
        image = imresize(image,[inaltimeNoua latimeNoua]);
        imwrite(image,fullFileName);
end
disp('Finalizat');
