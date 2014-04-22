function display_image (i, r, f, t)

j = i + r + f + t;
[X1, map1] = imread ('cat1.jpg');
[X2, map2] = imread ('dino2.jpg');
subplot (1,2,1), subimage ([X1, map1]);
subplot (1,2,2), subimage ([X2, map2]);
