function vertices = find_vertices(l,img,edge,plus)
vertices = zeros(9,2);
vf = zeros(1,4);

for i=1:l
    if (img(i,plus) > edge) && (vf(1) == 0)% && (img(i-1,plus) < edge)
        vf(1) = 1;
        vertices(1,1) = i;
        vertices(1,2) = plus;
        vertices(9,1) = i;
        vertices(9,2) = plus;
    end
    if (img(l-i+1,plus) > edge) && (vf(3) == 0) %&& (img(l-i+2,plus) < edge)
        vf(3) = 1;
        vertices(5,1) = l-i+1;
        vertices(5,2) = plus;
    end
    if (img(plus,i) > edge) && (vf(4) == 0) %&& (img(plus,i-1) < edge)
        vf(4) = 1;
        vertices(7,2) = i;
        vertices(7,1) = plus;
    end
    if (img(plus,l-i+1) > edge) && (vf(2) == 0) %&& (img(plus,l-i+2) < edge)
        vf(2) = 1;
        vertices(3,2) = l-i+1;
        vertices(3,1) = plus;
    end
end

vf2 = zeros(1,4);

for i=1:l
    if (img(i,i) > edge) && (vf2(1) == 0) %&& (img(i-1,i-1) < edge)
        vf2(1) = 1;
        vertices(8,1) = i;
        vertices(8,2) = i;
    end
    if (img(l-i+1,l-i+1) > edge) && (vf2(3) == 0) %&& (img(l-i+2,l-i+2) < edge)
        vf2(3) = 1;
        vertices(4,1) = l-i+1;
        vertices(4,2) = l-i+1;
    end
    if (img(l-i+1,i) > edge) && (vf2(4) == 0) %&& (img(l-i+2,i-1) < edge)
        vf2(4) = 1;
        vertices(6,2) = i;
        vertices(6,1) = l-i+1;
    end
    if (img(i,l-i+1) > edge) && (vf2(2) == 0) %&& (img(i-1,l-i+2) < edge)
        vf2(2) = 1;
        vertices(2,2) = l-i+1;
        vertices(2,1) = i;
    end
end

for i=1:4
    if (vf(i)==0) || (vf2(i)==0)
        vertices = zeros(9,2);
        break;
    end
end