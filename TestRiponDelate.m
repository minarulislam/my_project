x = 1;
y = 2;

vgreen=1;
vfruits=0;
vbreads=0;
vhoney=1;
vvegetables=0;
vheavy=1;


if vgreen==1
    tbreak{x,y} = 'Green Tea';
    x = x+1;
end
if vfruits==1
    tbreak{x,y} = 'Fruits';
    x = x+1;
end
if vbreads==1
    tbreak{x,y} = 'Breads';
    x = x+1;
end
if vhoney==1
    tbreak{x,y} = 'Honey';
    x = x+1;
end
if vvegetables==1
    tbreak{x,y} = 'Vegetables';
    x = x+1;
end
if vheavy==1
    tbreak{x,y} = 'Heavy Foods';
    x = x+1;
end

disp(tbreak)