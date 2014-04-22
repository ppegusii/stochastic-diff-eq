function display_image (i, img, r, f, t)

%[X1, map1] = imread ('cat1.jpg');
%[X2, map2] = imread ('dino2.jpg');
subplot (1,3,1), imagesc (img);
subplot (1,3,2); imagesc (i);
subplot (1,3,3); plot(t,r,t,f, t, 0.0625, '-');

end
